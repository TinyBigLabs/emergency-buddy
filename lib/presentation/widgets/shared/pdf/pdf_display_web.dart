import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PDFDisplayWeb extends StatefulWidget {
  final String pdfUrl; // URL of the PDF file
  final int pageNumber;
  const PDFDisplayWeb(
      {super.key, required this.pdfUrl, required this.pageNumber});

  @override
  State<PDFDisplayWeb> createState() => _PDFDisplayWebState();
}

class _PDFDisplayWebState extends State<PDFDisplayWeb> {
  @override
  Widget build(BuildContext context) {
    final pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/${widget.pdfUrl}'),
      initialPage: widget.pageNumber, // default page number is 1
    );
    return PdfViewPinch(
      controller: pdfPinchController,
    );
  }
}
