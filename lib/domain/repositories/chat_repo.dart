

import 'package:emergency_buddy/data/gemma_chat_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemma/core/message.dart';

abstract class ChatRepository {
  /// Sets the local file path for the model to be used for initialization.
  void setModelPath(String? path);

  /// Initializes the chat service with the previously set model path.
  Future<void> initializeModel(bool isFirstAid);

  /// Sends a message to the chat service and returns a stream of response tokens.
  Stream<String> sendMessage(Message message, bool isFirstAid);
}



class ChatRepositoryImpl implements ChatRepository {
  final GemmaChatDataSource gemmaDataSource;
  String? _modelPath;

  ChatRepositoryImpl(this.gemmaDataSource);
  
  @override
  void setModelPath(String? path) {
    _modelPath = path;
  }

  @override
  Future<void> initializeModel(bool isFirstAid) {
    if (_modelPath == null && !kIsWeb) {
      throw Exception("Model path not set. Call ChatRepository.setModelPath() first.");
    }
    return gemmaDataSource.initialize(_modelPath, isFirstAid);
  }

  @override
  Stream<String> sendMessage(Message message, bool isFirstAid) {
    return gemmaDataSource.sendMessage(message.text, message.imageBytes, isFirstAid);
  }
}
