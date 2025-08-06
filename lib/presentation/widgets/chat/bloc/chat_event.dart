import 'dart:typed_data';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class InitializeModelEvent extends ChatEvent {
  final bool isFirstAid;

  const InitializeModelEvent({required this.isFirstAid});

  @override
  List<Object?> get props => [isFirstAid];
}

class SendMessageEvent extends ChatEvent {
  final String text;
  final Uint8List? image;
  final bool isFirstAid;

  const SendMessageEvent({required this.text, this.image, required this.isFirstAid});

  @override
  List<Object?> get props => [text, image, isFirstAid];
}
