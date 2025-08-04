import 'dart:typed_data';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class InitializeModelEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String text;
  final Uint8List? image;

  const SendMessageEvent({required this.text, this.image});

  @override
  List<Object?> get props => [text, image];
}
