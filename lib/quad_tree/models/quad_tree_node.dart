import 'dart:math';


import 'boundary.dart';
import 'quad_tree_point.dart';

class QuadTreeNode {
  final Boundary boundary;
  final int capacity;
  List<QuadTreePoint> points = [];

  bool hasSplit = false;

  QuadTreeNode? northWest;
  QuadTreeNode? northEast;
  QuadTreeNode? southWest;
  QuadTreeNode? southEast;

  QuadTreeNode({
    required this.boundary,
    required this.capacity,
  });

  // --- CALCULATED GETTERS  ---
  bool get isFull => points.length >= capacity;
  bool get isLeaf => !hasSplit;

  void insert(QuadTreePoint point) {
    if (!boundary.contains(point)) {
      return;
    }
    if (isLeaf) {
      points.add(point);

      if (isFull) {
        _subDivide();
      }
    } else {
      if (northWest!.boundary.contains(point)) {
        northWest!.insert(point);
      } else if (northEast!.boundary.contains(point)) {
        northEast!.insert(point);
      } else if (southWest!.boundary.contains(point)) {
        southWest!.insert(point);
      } else if (southEast!.boundary.contains(point)) {
        southEast!.insert(point);
      }
    }
  }

  void _subDivide() {
    // 1. Mark this node as a branch, no longer a leaf.
    hasSplit = true;

    // 2. Create the four new child nodes.
    final hw = boundary.halfWidth;
    final hh = boundary.halfHeight;
    final childHalfWidth = hw / 2;
    final childHalfHeight = hh / 2;
    //    Each one gets a new boundary for its quadrant.
    northWest = QuadTreeNode(
        boundary: Boundary(
            centerPoint: Point(boundary.centerPoint.x - childHalfWidth,
                boundary.centerPoint.y + childHalfHeight),
            halfWidth: childHalfWidth,
            halfHeight: childHalfHeight),
        capacity: capacity);
    northEast = QuadTreeNode(
        boundary: Boundary(
            centerPoint: Point(boundary.centerPoint.x + childHalfWidth,
                boundary.centerPoint.y + childHalfHeight),
            halfWidth: childHalfWidth,
            halfHeight: childHalfHeight),
        capacity: capacity);
    southEast = QuadTreeNode(
        boundary: Boundary(
            centerPoint: Point(boundary.centerPoint.x + childHalfWidth,
                boundary.centerPoint.y - childHalfHeight),
            halfWidth: childHalfWidth,
            halfHeight: childHalfHeight),
        capacity: capacity);
    southWest = QuadTreeNode(
        boundary: Boundary(
            centerPoint: Point(boundary.centerPoint.x - childHalfWidth,
                boundary.centerPoint.y - childHalfWidth),
            halfWidth: childHalfWidth,
            halfHeight: childHalfHeight),
        capacity: capacity);

    // 3. Redistribute all the points this node was holding.
    for (final point in points) {
      northWest!.insert(point);
      northEast!.insert(point);
      southWest!.insert(point);
      southEast!.insert(point);
    }

    // 4. Clear this node's own list.
    points.clear();
  }

  List<QuadTreePoint> query(Point userLocation, double radius) {
    List<QuadTreePoint> foundPoints = [];
    if (!boundary.intersects(userLocation, radius)) {
      return foundPoints;
    }
      for (QuadTreePoint point in points) {
        double distance = distanceBetween(point, userLocation);
        if (distance <= radius) {
          foundPoints.add(point);
        }
      }

      if (hasSplit) {
        List<QuadTreePoint> pointsFromNW =
            northWest!.query(userLocation, radius);
        foundPoints.addAll(pointsFromNW);

        List<QuadTreePoint> pointsFromNE =
            northEast!.query(userLocation, radius);
        foundPoints.addAll(pointsFromNE);

        List<QuadTreePoint> pointsFromSW =
            southWest!.query(userLocation, radius);
        foundPoints.addAll(pointsFromSW);

        List<QuadTreePoint> pointsFromSE =
            southEast!.query(userLocation, radius);
        foundPoints.addAll(pointsFromSE);
      }
    
    return foundPoints;
  }

  double distanceBetween(Point point1, Point point2) {
    double distance =
        sqrt(pow((point2.x - point1.x), 2) + pow((point2.y - point1.y), 2));
    return distance;
  }
}
