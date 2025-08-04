

import '../repositories/model_setup_repo.dart';

class SetupModelUseCase {
  final ModelSetupRepository repository;

  SetupModelUseCase(this.repository);

  /// Checks which model is needed, downloads if necessary,
  /// and returns the local file path to the model.
  Future<String> call({
    required Function(String, double?) onProgress,
  }) async {
    return repository.setupModel(onProgress: onProgress);
  }
}
