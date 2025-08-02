import 'dart:convert';
import 'dart:math';

import 'package:emergency_buddy/domain/entities/knowledge_base_model.dart';
import 'package:emergency_buddy/quad_tree/models/boundary.dart';
import 'package:emergency_buddy/quad_tree/models/quad_tree_node.dart';
import 'package:emergency_buddy/quad_tree/models/quad_tree_point.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('group', () {
    test("test", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      String jsonString =
          await rootBundle.loadString("assets/knowledge_graph.json");
      // 2. Decode the JSON string into a Map.
      final Map<String, dynamic> parsedJson = jsonDecode(jsonString);
      // 3. Pass the map to the KnowledgeBase.fromJson factory constructor.
      KnowledgeBase kb = KnowledgeBase.fromJson(parsedJson);

      Boundary b =
          Boundary(centerPoint: Point(50, 50), halfHeight: 100, halfWidth: 100);

      QuadTreeNode quadTreeNode = QuadTreeNode(boundary: b, capacity: 4);
      QuadTreePoint quadTreePoint1 =
          QuadTreePoint(10, 90, knowledgeBaseElement: kb.knowledgeBase.first);
      QuadTreePoint quadTreePoint2 =
          QuadTreePoint(10, 10, knowledgeBaseElement: kb.knowledgeBase.first);
                QuadTreePoint quadTreePoint3 =
          QuadTreePoint(40, 60, knowledgeBaseElement: kb.knowledgeBase.first);
      QuadTreePoint quadTreePoint4 =
          QuadTreePoint(25, 75, knowledgeBaseElement: kb.knowledgeBase.first);
      QuadTreePoint quadTreePoint5 =
          QuadTreePoint(80, 80, knowledgeBaseElement: kb.knowledgeBase.first);

      quadTreeNode.insert(quadTreePoint1);
      quadTreeNode.insert(quadTreePoint2);
      quadTreeNode.insert(quadTreePoint3);
      quadTreeNode.insert(quadTreePoint4);
      quadTreeNode.insert(quadTreePoint5);


      List<QuadTreePoint> points = quadTreeNode.query(Point(10, 30), 10);
      print(points);
      print(quadTreeNode);
    });
  });
}
