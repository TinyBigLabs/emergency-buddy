import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';

import '../entities/knowledge_base_model.dart';



class KnowledgeGraphRepo {
// --- TOP-LEVEL PARSER FUNCTION ---
// This is the main function you will call from your application logic.
  Future<KnowledgeBase> parseKnowledgeBase() async {
    //1. Get json from file
    String jsonString = await rootBundle.loadString("assets/knowledge_graph.json");
    // 2. Decode the JSON string into a Map.
    final Map<String, dynamic> parsedJson = jsonDecode(jsonString);
    // 3. Pass the map to the KnowledgeBase.fromJson factory constructor.
    return KnowledgeBase.fromJson(parsedJson);
  }

  Future<KnowledgeBaseElement> searchAndReturnClosestMatchingNamedLocation(String query) async {
    KnowledgeBase knowledgeBaseFromJson = await parseKnowledgeBase();
    Map<KnowledgeBaseElement, int> closestStringMatchRatios = {};
    for (KnowledgeBaseElement knowledgeBaseElement
        in knowledgeBaseFromJson.knowledgeBase) {
      closestStringMatchRatios.addAll({
        knowledgeBaseElement:
            weightedRatio(knowledgeBaseElement.name, query)
      });
    }

    return closestStringMatchRatios.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }
}
