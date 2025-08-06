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
      // supportsFunctionCalls: true,
      supportImage: !kIsWeb,
      // tools: [
      //   // Add your Tool definitions here if you use function calling
      //   const Tool(
      //     name: UIConstants.kSearchDatabaseFunctionTool,
      //     description:
      //         'Searches the local knowledge graph for a specific place, like a hospital or food bank. Use this to find details like an address or phone number. It can handle partial names and minor typos.',
      //     parameters: {
      //       'type': 'object',
      //       'properties': {
      //         'query': {
      //           'type': 'string',
      //           'description':
      //               "The name of the place you are looking for, for example 'Russells Hall Hospital' or 'Dudley food bank'.",
      //         },
      //       },
      //       'required': ['query'],
      //     },
      //   ),
      //   const Tool(
      //     name: UIConstants.kFindNearbyLocationsFunctionTool,
      //     description:
      //         'Finds nearby points of interest like emergency shelters, hospitals, or radio stations based on the user\'s current latitude and longitude. Use this when the user asks "what is near me?" or asks for the closest location for help.',
      //     parameters: {
      //       'type': 'object',
      //       'properties': {
      //         'radius': {
      //           'type': 'number',
      //           'description':
      //               'Optional. The search radius in kilometers. Defaults to 5 if not provided.',
      //         },
      //       },
      //       'required': [
      //         'radius',
      //       ],
      //     },
      //   ),
      // ],
    );
  }

  @override
  Stream<String> sendMessage(String text, Uint8List? image) async* {
    if (_chat == null) {
      throw Exception("Chat not initialized. Call initialize() first.");
    }

    const masterPrompt = ""; // Add your full prompt

    final userMessage = image == null
        ? Message.text(text: masterPrompt + text, isUser: true)
        : Message.withImage(
            text: text.isNotEmpty ? (masterPrompt + text) : masterPrompt,
            imageBytes: image,
            isUser: true,
          );

    await _chat!.addQueryChunk(userMessage);

    final responseStream = _chat!.generateChatResponseAsync();
    await for (final modelResponse in responseStream) {
      if (modelResponse is TextResponse) {
        yield modelResponse.token;
      } 
      // else if (modelResponse is FunctionCallResponse) {
      //   yield*  _handleFunctionCall(modelResponse);
      // }
    }
  }

//   // This private method is the core of handling the function call.
//   /// It acts as a router to the correct repository.
//  Stream<String> _handleFunctionCall(FunctionCallResponse call) async* {
//     final args = call.args;
//     String toolResult;
//     if (call.name == UIConstants.kSearchDatabaseFunctionTool) {
//       if (args.containsKey('query') &&
//           args['query'] != null &&
//           (args['query'] as String).isNotEmpty) {
//         // --- 1. Name-based Search (Fuzzy Text) ---
//         final query = args['query'] as String;
//         final closestMatch = await _knowledgeGraphRepo
//             .searchAndReturnClosestMatchingNamedLocation(query);
//         toolResult =
//             "Found a location matching '$query':\n${closestMatch.toString()}";
//       } else {
//         toolResult = "Found no locations matching the user's request";
//       }
//     } else if (call.name == UIConstants.kFindNearbyLocationsFunctionTool) {
//       final radiusInKm = (args['radius'] as num? ?? 5.0).toDouble();

//       final userPoint = await Geolocator.getCurrentPosition();
//       final foundElements = await _locationSearchRepo.findNearby(
//           Point(userPoint.latitude, userPoint.longitude), radiusInKm);

//       if (foundElements.isEmpty) {
//         toolResult = "No locations were found within a ${radiusInKm}km radius.";
//       } else {
//         toolResult =
//             "Found ${foundElements.length} nearby locations:\n${foundElements.map((element) {
//           return "- Name: ${element.name}, Type: ${element.type}, Purpose: ${element.details.purpose}";
//         }).join("\n")}";
//       }
//     } else {
//       toolResult = "Invalid arguments provided for search. ";
//     }

//     // --- Feed the result back to Gemma ---
//     await _chat!.addQueryChunk(Message(
//       text: toolResult,
//       isUser: true,
//     ));
//     final finalResponseStream = _chat!.generateChatResponseAsync();
//     yield* finalResponseStream
//         .where((response) => response is TextResponse)
//         .map((response) => (response as TextResponse).token);
//   }
}
