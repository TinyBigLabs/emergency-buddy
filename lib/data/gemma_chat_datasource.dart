import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemma/core/model.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:geolocator/geolocator.dart';

import '../core/utils/constants.dart';
import '../domain/repositories/knowledge_graph_repo.dart';
import '../domain/repositories/location_search_repo.dart';

abstract class GemmaChatDataSource {
  Future<void> initialize(String? modelPath);
  Stream<String> sendMessage(String text, Uint8List? image);
}

class GemmaChatDataSourceImpl implements GemmaChatDataSource {
  InferenceChat? _chat;

  final KnowledgeGraphRepo _knowledgeGraphRepo = KnowledgeGraphRepo();
  final LocationSearchRepo _locationSearchRepo = LocationSearchRepoImpl();

  @override
  Future<void> initialize(String? modelPath) async {
    final gemma = FlutterGemmaPlugin.instance;
    if (kIsWeb) {
      if (kDebugMode) {
        // In debug mode, we assume the model is bundled with the web app.
        modelPath =
            "assets/gemma/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task";
      } else {
        // In release mode, we can still use the asset path.
        modelPath =
            "assets/assets/gemma/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task";
      }
    }
    // await gemma.modelManager.installModelFromAsset(
    //     "assets/gemma/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task");
    await gemma.modelManager.setModelPath(modelPath!);
    debugPrint(modelPath);

    final inferenceModel = await gemma.createModel(
      modelType: ModelType.gemmaIt,
      supportImage: !kIsWeb,
      maxTokens: 2048,
    );

    _chat = await inferenceModel.createChat(
      supportsFunctionCalls: true,
      supportImage: !kIsWeb,
      tools: [
        // Add your Tool definitions here if you use function calling
        const Tool(
          name: UIConstants.kSearchDatabaseFunctionTool,
          description:
              'Searches the local knowledge graph for a specific place, like a hospital or food bank. Use this to find details like an address or phone number. It can handle partial names and minor typos.',
          parameters: {
            'type': 'object',
            'properties': {
              'query': {
                'type': 'string',
                'description':
                    "The name of the place you are looking for, for example 'Russells Hall Hospital' or 'Dudley food bank'.",
              },
            },
            'required': ['query'],
          },
        ),
        const Tool(
          name: UIConstants.kFindNearbyLocationsFunctionTool,
          description:
              'Finds nearby points of interest like emergency shelters, hospitals, or radio stations based on the user\'s current latitude and longitude. Use this when the user asks "what is near me?" or asks for the closest location for help.',
          parameters: {
            'type': 'object',
            'properties': {
              'radius': {
                'type': 'number',
                'description':
                    'Optional. The search radius in kilometers. Defaults to 5 if not provided.',
              },
            },
            'required': [
              'radius',
            ],
          },
        ),
      ],
    );
  }

  @override
  Stream<String> sendMessage(String text, Uint8List? image) {
    // 1. Create a StreamController to manually manage the stream.
    final controller = StreamController<String>();

    // This is a self-contained async function that will perform the work
    // and add results/errors to the controller.
    _performChatRequest(text, image, controller);

    // 2. Immediately return the controller's stream. The UI will listen to this.
    return controller.stream;
  }

  Future<void> _performChatRequest(
      String text, Uint8List? image, StreamController controller) async {
    if (_chat == null) {
      throw Exception("Chat not initialized. Call initialize() first.");
    }
    try {
      final userMessage = image == null
          ? Message.text(text: text, isUser: true)
          : Message.withImage(
              text: text.isNotEmpty ? text : "",
              imageBytes: image,
              isUser: true,
            );

      await _chat!.addQueryChunk(userMessage);
      bool isHandlingFunctionCall = false;

      _chat!.generateChatResponseAsync().listen(
        (response) async {
          if (response is TextResponse) {
            // Add the text token to our stream for the UI to receive.
            controller.add(response.token);
          } else if (response is FunctionCallResponse) {
            isHandlingFunctionCall = true;
            // Delegate to the function handler, which will now also use the controller.
            await _handleFunctionCall(response, controller);
          }
        },
        onError: (error) {
          // Pass any errors to the stream.
          controller.addError(error);
        },
        onDone: () {
          // If the stream finishes and we DID NOT start a function call,
          // it means the conversation is over. We can close the controller.
          if (!isHandlingFunctionCall) {
            controller.close();
          }
        },
      );
    } catch (e) {
      controller.addError(e);
      controller.close();
    }
  }

  // This private method is the core of handling the function call.
  /// It acts as a router to the correct repository.
  Future<void> _handleFunctionCall(
      FunctionCallResponse call, StreamController controller) async {
    final args = call.args;
    String toolResult;
    try {
      if (call.name == UIConstants.kSearchDatabaseFunctionTool) {
        if (args.containsKey('query') &&
            args['query'] != null &&
            (args['query'] as String).isNotEmpty) {
          // --- 1. Name-based Search (Fuzzy Text) ---
          final query = args['query'] as String;
          final closestMatch = await _knowledgeGraphRepo
              .searchAndReturnClosestMatchingNamedLocation(query);
          toolResult =
              "Found a location matching '$query':\n${closestMatch.toString()}";
        } else {
          toolResult = "Found no locations matching the user's request";
        }
      } else if (call.name == UIConstants.kFindNearbyLocationsFunctionTool) {
        final radiusInKm = (args['radius'] as num? ?? 5.0).toDouble();

        final userPoint = await Geolocator.getCurrentPosition();
        final foundElements = await _locationSearchRepo.findNearby(
            Point(userPoint.latitude, userPoint.longitude), radiusInKm);

        if (foundElements.isEmpty) {
          toolResult =
              "No locations were found within a ${radiusInKm}km radius.";
        } else {
          toolResult =
              "Found ${foundElements.length} nearby locations:\n${foundElements.map((element) {
            return "- Name: ${element.name}, Type: ${element.type}, Purpose: ${element.details.purpose}";
          }).join("\n")}";
        }
      } else {
        toolResult = "Invalid arguments provided for search. ";
      }

      // --- Feed the result back to Gemma ---
      await _chat!.addQueryChunk(Message.toolResponse(
        toolName: call.name,
        response: {'status': 'success', 'message': toolResult},
      ));
       await for (final finalResponse in _chat!.generateChatResponseAsync()) {
        if (finalResponse is TextResponse) {
          // Add the final response tokens to the same stream.
          controller.add(finalResponse.token);
        }
      }
    } catch (e) {
      controller.addError(e);
    } finally {
      // Crucially, close the controller here. This signals the end of the
      // entire multi-step interaction.
      controller.close();
    }
  }
}
