import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gemma/core/message.dart';
import '../../../../domain/repositories/chat_repo.dart';
import '../../../../domain/usecases/chat_sendmessage_usecase.dart';
import '../../../../domain/usecases/intialise_model_usecase.dart';
import '../../../../domain/usecases/setup_model_usecase.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SetupModelUseCase _setupModelUseCase;
  final InitializeModelUseCase _initializeModelUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final ChatRepository _chatRepository;

  List<Message> _messages = [];

  ChatBloc(
    this._setupModelUseCase,
    this._initializeModelUseCase,
    this._sendMessageUseCase,
    this._chatRepository,
  ) : super(ChatInitial()) {
    on<InitializeModelEvent>(_onInitializeModel);
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onInitializeModel(
      InitializeModelEvent event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatModelLoading('Preparing model...'));

      //if(!kIsWeb){
      final modelPath = await _setupModelUseCase(
        onProgress: (message, progress) {
          emit(ChatModelLoading(message, progress));
        },
      );
      _chatRepository.setModelPath(modelPath);
      //}

      emit(const ChatModelLoading('Initializing Gemma engine...'));
      await _initializeModelUseCase();

      emit(ChatReady(messages: _messages));
    } catch (e) {
      emit(ChatError("Setup failed: ${e.toString()}"));
    }
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    final userMessage = Message(
      text: event.text,
      imageBytes: event.image,
      isUser: true,
    );
    _messages.add(userMessage);

    emit(ChatReady(messages: List.from(_messages), isResponding: true));

    final aiResponsePlaceholder = Message(text: '', isUser: false);
    _messages.add(aiResponsePlaceholder);

    // StreamSubscription<String>? subscription;

    try {
      final responseStream = _sendMessageUseCase(userMessage);

      await for (final token in responseStream) {
        // This check is a safeguard. If another event comes in while this one
        // is processing, the emitter might be closed.
        if (emit.isDone) return;

        // Update the last message (the placeholder) with the new token.
        final lastMessage = _messages.last;
        _messages[_messages.length - 1] = Message(
          text: lastMessage.text + token,
          isUser: false,
        );

        // Emit the updated list to show the text streaming in the UI.
        emit(ChatReady(messages: List.from(_messages), isResponding: true));
      }

      // 6. After the stream is fully consumed, emit the final state.
      if (!emit.isDone) {
        emit(ChatReady(messages: List.from(_messages), isResponding: false));
      }
    } catch (e) {
      _messages.removeLast();
      emit(ChatError("Error sending message: ${e.toString()}"));
      emit(ChatReady(messages: List.from(_messages), isResponding: false));
    }
  }
}
