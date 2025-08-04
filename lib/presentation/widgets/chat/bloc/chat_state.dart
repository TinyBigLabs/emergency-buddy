import 'package:equatable/equatable.dart';
import 'package:flutter_gemma/core/message.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatModelLoading extends ChatState {
  final String message;
  final double? progress;

  const ChatModelLoading(this.message, [this.progress]);

  @override
  List<Object?> get props => [message, progress];
}

class ChatReady extends ChatState {
  final List<Message> messages;
  final bool isResponding;

  const ChatReady({required this.messages, this.isResponding = false});

  @override
  List<Object?> get props => [messages, isResponding];
}

class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object?> get props => [message];
}
