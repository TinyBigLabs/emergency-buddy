import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:math';

import '../../quad_tree/models/boundary.dart';
import '../../quad_tree/models/quad_tree_node.dart';
import '../../quad_tree/models/quad_tree_point.dart';
import '../entities/knowledge_base_model.dart';

abstract class LocationSearchRepo {
  Future<void> buildLocationTree();
  Future<List<KnowledgeBaseElement>> findNearby(Point userLocation, double radiusKm);
}

class LocationSearchRepoImpl implements LocationSearchRepo {
  QuadTreeNode? _quadtree;

  @override
  Future<void> buildLocationTree() async {
    // Define a boundary that covers the entire UK
    final ukBoundary = Boundary(
        centerPoint: Point(-2.5, 54.5), // Center of UK
        halfWidth: 6.0,
        halfHeight: 6.0);
    _quadtree = QuadTreeNode(boundary: ukBoundary, capacity: 4);

    // Load data from JSON
    final String response =
        await rootBundle.loadString('assets/data/knowledge_graph.json');
    final data = await json.decode(response);
    final List<dynamic> knowledgeBase = data['knowledge_base'];

    // Populate the Quadtree
    for (var item in knowledgeBase) {
      final element = KnowledgeBaseElement.fromJson(item);
      final point = QuadTreePoint(element.location.lon, element.location.lat,
          knowledgeBaseElement: element);
      _quadtree!.insert(point);
    }
    print("Quadtree initialized with ${knowledgeBase.length} elements.");
  }

  @override
  Future<List<KnowledgeBaseElement>> findNearby(Point userLocation, double radiusKm) async {
    if (_quadtree == null) {
      print("Service not initialized!");
      return [];
    }

    // Convert radius from km to degrees (a rough approximation for the query)
    // 1 degree of latitude is roughly 111km
    final double radiusInDegrees = radiusKm / 111.0;

    final foundPoints = _quadtree!.query(userLocation, radiusInDegrees);

    return foundPoints.map((p) => p.knowledgeBaseElement).toList();
  }
}
