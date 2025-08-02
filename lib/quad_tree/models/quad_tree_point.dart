import 'dart:math';

import '../../domain/entities/knowledge_base_model.dart';


class QuadTreePoint extends Point {
  final KnowledgeBaseElement knowledgeBaseElement;

  QuadTreePoint(
    super.x,
    super.y, {
    required this.knowledgeBaseElement,
  });
}
