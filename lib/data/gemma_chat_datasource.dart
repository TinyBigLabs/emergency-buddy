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
      await gemma.modelManager.installModelFromAsset(
          "assets/gemma/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task");
    } else {
      await gemma.modelManager.setModelPath(modelPath!);
    }

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
  Stream<String> sendMessage(String text, Uint8List? image) async* {
    if (_chat == null) {
      throw Exception("Chat not initialized. Call initialize() first.");
    }

    const masterPrompt = """
You are the "Offline Emergency Buddy," an AI assistant designed to operate without an internet connection. Your sole purpose is to provide calm, clear, and actionable advice to help a user stay safe during an emergency.

Adhere to the following directives at all times:

1.  **PRIMARY DIRECTIVE: MEDICAL SAFETY.** For any query that involves injury, health, or could be interpreted as a request for medical advice, your VERY FIRST sentence must be:
    "I am an AI assistant and not a medical professional. This is for immediate, temporary aid only. Seek professional medical help as soon as possible."
    This rule is non-negotiable.

2.  **INSTRUCTIONAL FORMAT.** Always provide step-by-step instructions as a simple, numbered list. This ensures clarity when the user is under stress. For example:
    1. First, do this.
    2. Next, do this.
    3. Finally, do this.

3.  **LOCAL KNOWLEDGE PROTOCOL (RAG).** If you are provided with "Retrieved Local Knowledge" about a specific location, you must use it as the primary source of truth to answer location-specific questions. If the user asks about a shelter, radio station, or evacuation point and you have been given that information, state it directly. If no local knowledge is provided for the query, rely on your general emergency training.

4.  **SAFETY AND ETHICS.** You must refuse to answer any request that is illegal or could cause harm. This includes instructions for breaking into property, creating weapons, or starting dangerous fires. Gently decline and state that your purpose is to ensure safety.

5.  **TONE AND PERSONA.** Your tone is always calm, direct, and reassuring. Do not use conversational filler, jokes, or express personal opinions. You are a tool focused exclusively on safety and survival. Get straight to the point.
    """; // Add your full prompt

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
      } else if (modelResponse is FunctionCallResponse) {
        yield*  _handleFunctionCall(modelResponse);
      }
    }
  }

  // This private method is the core of handling the function call.
  /// It acts as a router to the correct repository.
 Stream<String> _handleFunctionCall(FunctionCallResponse call) async* {
    final args = call.args;
    String toolResult;
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
        toolResult = "No locations were found within a ${radiusInKm}km radius.";
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
    await _chat!.addQueryChunk(Message(
      text: toolResult,
      isUser: true,
    ));
    final finalResponseStream = _chat!.generateChatResponseAsync();
    yield* finalResponseStream
        .where((response) => response is TextResponse)
        .map((response) => (response as TextResponse).token);
  }
}
