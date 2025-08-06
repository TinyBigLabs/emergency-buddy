import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:emergency_buddy/domain/entities/download_model.dart';
import 'package:flutter/foundation.dart';

import '../../data/downloader_datasource.dart';

abstract class ModelSetupRepository {
  /// Handles the logic of checking device capabilities, downloading the
  /// appropriate model if it doesn't exist, and returning its local file path.
  Future<String> setupModel({
    required Function(String, double?) onProgress,
  });
}

class ModelSetupRepositoryImpl implements ModelSetupRepository {
  @override
  Future<String> setupModel({
    required Function(String, double?) onProgress,
  }) async {
    bool isLowRamDevice = true;
    if(kIsWeb){
      if (kDebugMode) {
        // In debug mode, we assume the model is bundled with the web app.
        onProgress('Using bundled model for web.', null);
        return 'assets/gemma/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task';
      }
      onProgress('Using bundled model for release web.', null);
      return 'assets/assets/gemma/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task';
    }
    if (!kIsWeb) {
      if (Platform.isIOS) {
        final iosInfo = await DeviceInfoPlugin().iosInfo;
        // systemMemory is in bytes. Check if less than 6GB.
        isLowRamDevice = (iosInfo.physicalRamSize < 6 * 1024);
      } else if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        isLowRamDevice = androidInfo.isLowRamDevice;
      }
    }

    final DownloadModel modelToDownload;
    if (isLowRamDevice) {
      onProgress('Low RAM device: Preparing smaller model.', null);
      modelToDownload = DownloadModel(
        modelUrl:
            'https://huggingface.co/litert-community/Gemma3-1B-IT/resolve/main/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task',
        modelFilename: 'Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task',
      );
    } else {
      onProgress('Preparing high-performance model.', null);
      modelToDownload = DownloadModel(
        modelUrl:
            'https://huggingface.co/google/gemma-3n-E2B-it-litert-preview/resolve/main/gemma-3n-E2B-it-int4.task',
        modelFilename: 'gemma-3n-E2B-it-int4.task',
      );
    }

    final downloader = GemmaDownloaderDataSource(model: modelToDownload);

    final bool exists = await downloader.checkModelExistence();
    if (!exists) {
      await downloader.downloadModel(
        onProgress: (progress) {
          onProgress(
              'Downloading model: ${(progress * 100).toStringAsFixed(1)}%',
              progress);
        },
      );
    } else {
      onProgress('Model found locally.', null);
    }

    return await downloader.getFilePath();
  }
}
