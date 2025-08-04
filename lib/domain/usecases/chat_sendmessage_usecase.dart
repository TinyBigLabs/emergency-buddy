import 'dart:async';

import 'package:flutter_gemma/core/message.dart';

import '../repositories/chat_repo.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Stream<String> call(Message message) {
    return repository.sendMessage(message);
  }
}
