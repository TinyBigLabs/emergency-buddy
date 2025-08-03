import 'dart:async';
import 'dart:io';
import 'package:emergency_buddy/presentation/widgets/first_aid/blocs/first_aid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PDFDisplayMobile extends StatefulWidget {
  final String pdfFileName;
  final int pageID;

  const PDFDisplayMobile(
      {super.key, required this.pdfFileName, required this.pageID});

  @override
  State<PDFDisplayMobile> createState() => _PDFDisplayMobileState();
}

class _PDFDisplayMobileState extends State<PDFDisplayMobile> {
  String pathPDF = "";
  int pageNumber = 0;

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file! $filename');
    }
    return completer.future;
  }

  Future<void> setPDFPath(String asset, String filename) async {
    fromAsset(asset, filename).then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageNumber = widget.pageID - 1;
    setPDFPath("assets/pdf/${widget.pdfFileName}", widget.pdfFileName);
  }

  @override
  Widget build(BuildContext context) {
    return pathPDF.isEmpty
        ? Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 400, // Set desired height
            child: PDFView(
              filePath: pathPDF,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: true,
              pageFling: false,
              defaultPage: pageNumber,
              onRender: (pages) {
                debugPrint("PDF rendered with $pages pages");
              },
              onError: (error) {
                debugPrint("PDF Error: $error");
              },
              onPageError: (page, error) {
                debugPrint("Page $page Error: $error");
              },
            ),
          );
  }
}
