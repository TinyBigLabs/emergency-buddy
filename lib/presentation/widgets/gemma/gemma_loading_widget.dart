import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:emergency_buddy/data/downloader_datasource.dart';
import 'package:emergency_buddy/domain/entities/download_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GemmaLoadingWidget extends StatefulWidget {
  const GemmaLoadingWidget({super.key});

  @override
  State<GemmaLoadingWidget> createState() => _GemmaLoadingWidgetState();
}

class _GemmaLoadingWidgetState extends State<GemmaLoadingWidget> {
  bool _isModelLoading = true;
  bool _isLowRamDevice = false;
  late final DeviceInfoPlugin deviceInfo;
  late final AndroidDeviceInfo androidInfo;
  late final IosDeviceInfo iosInfo;
  late final GemmaDownloaderDataSource _downloaderDataSource;
  final ValueNotifier<String> _loadingMessage = ValueNotifier('Initializing, loading Gemma...');

  Future<bool> loadModel() async {
    if (kIsWeb) {
      // Is already loaded as using gemma from assets
      _loadingMessage.value = 'Loading Gemma model for web...';
      setState(() {
        _isModelLoading = false;
      });
      return true;
    }

    if (_isLowRamDevice) {
      _downloaderDataSource = GemmaDownloaderDataSource(
        model: DownloadModel(
          modelUrl:
              'https://huggingface.co/litert-community/Gemma3-1B-IT/resolve/main/Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task',
          modelFilename: 'Gemma3-1B-IT_multi-prefill-seq_q4_ekv2048.task',
        ),
      );
    } else {
      _downloaderDataSource = GemmaDownloaderDataSource(
        model: DownloadModel(
          modelUrl:
              'https://huggingface.co/google/gemma-3n-E2B-it-litert-preview/resolve/main/gemma-3n-E2B-it-int4.task',
          modelFilename: 'gemma-3n-E2B-it-int4.task',
        ),
      );
    }

    // Check model existence first
    bool exists = await _downloaderDataSource.checkModelExistence();
    if (exists) {
      _loadingMessage.value = 'Model already exists, loading...';
      setState(() {
        _isModelLoading = false;
      });
      return true;
    }

    await _downloaderDataSource.downloadModel(
      onProgress: (progress) {
        _loadingMessage.value = 'Downloading model: ${(progress * 100).toStringAsFixed(1)}%';
      },
    );

    exists = await _downloaderDataSource.checkModelExistence();
    if (exists) {
      setState(() {
        _isModelLoading = false;
      });
    } else {
      _loadingMessage.value = 'Model already exists, loading...';
    }
    return exists;
  }

  @override
  void initState() {
    super.initState();
    deviceInfo = DeviceInfoPlugin();
    //check if RAM is less than 8GB in which case we use the smaller model
    if (kIsWeb) {
      //loading straight away as Platform is not available on web.
      _isLowRamDevice = false;
      loadModel();
    } else if (Platform.isIOS) {
      deviceInfo.iosInfo.then((info) {
        iosInfo = info;
        _isLowRamDevice = (info.physicalRamSize < 6 * 1024);
        loadModel(); // Check if available RAM is less than 6GB
      });
    } else if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((info) {
        androidInfo = info;
        _isLowRamDevice = info.isLowRamDevice;
        loadModel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isModelLoading
          ? Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    strokeCap: StrokeCap.round,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  SizedBox(height: 16),
                  ValueListenableBuilder<String>(
                    valueListenable: _loadingMessage,
                    builder: (context, value, child) {
                      return Text(value, style: Theme.of(context).textTheme.bodyMedium);
                    },
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
