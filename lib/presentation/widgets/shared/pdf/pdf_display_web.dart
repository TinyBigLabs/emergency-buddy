import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PDFDisplayWeb extends StatefulWidget {
  final String pdfUrl; // URL of the PDF file
  final int pageNumber;
  const PDFDisplayWeb(
      {super.key, required this.pdfUrl, required this.pageNumber});

  @override
  State<PDFDisplayWeb> createState() => _PDFDisplayWebState();
}

class _PDFDisplayWebState extends State<PDFDisplayWeb> {
  PdfViewerController? controller;

  @override
  Widget build(BuildContext context) {
    return PdfViewer.openAsset('pdf/bleeding.pdf', params: PdfViewerParams(
        // called when the controller is fully initialized
        onViewerControllerInitialized: (PdfViewerController c) {
      controller = c;
      controller?.goToPage(
          pageNumber: widget.pageNumber); // scrolling animation to page 3.
    }));
  }
}
