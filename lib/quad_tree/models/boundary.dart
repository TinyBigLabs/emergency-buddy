import 'dart:math';

class Boundary {
  final Point centerPoint;
  final double halfWidth;
  final double halfHeight;

  Boundary({
    required this.centerPoint,
    required this.halfWidth,
    required this.halfHeight,
  });

  bool contains(Point point) {
    double northEdge = centerPoint.y + halfHeight;
    double southEdge = centerPoint.y - halfHeight;
    double eastEdge = centerPoint.x + halfWidth;
    double westEdge = centerPoint.x - halfWidth;

    return point.y < northEdge &&
        point.y > southEdge &&
        point.x < eastEdge &&
        point.x > westEdge;
  }

  bool intersects(Point userPoint, double searchRadius) {
    double minX = centerPoint.x - halfWidth;
    double minY = centerPoint.y - halfHeight;

    double maxX = centerPoint.x + halfWidth;
    double maxY = centerPoint.y + halfHeight;

    num closestX = userPoint.x.clamp(minX, maxX);
    num closestY = userPoint.y.clamp(minY, maxY);
    double distance = sqrt(
        pow((closestX - userPoint.x), 2) + pow((closestY - userPoint.y), 2));

    return searchRadius <= distance;
  }
}
