import '../repositories/chat_repo.dart';

class InitializeModelUseCase {
  final ChatRepository repository;

  InitializeModelUseCase(this.repository);

  Future<void> call() {
    return repository.initializeModel();
  }
}
