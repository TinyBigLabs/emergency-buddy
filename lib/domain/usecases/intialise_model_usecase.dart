import '../repositories/chat_repo.dart';

class InitializeModelUseCase {
  final ChatRepository repository;

  InitializeModelUseCase(this.repository);

  Future<void> call(bool isFirstAid) {
    return repository.initializeModel(isFirstAid);
  }
}
