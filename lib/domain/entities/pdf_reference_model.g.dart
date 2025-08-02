// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_reference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PdfReference _$PdfReferenceFromJson(Map<String, dynamic> json) =>
    _PdfReference(
      pdfId: json['pdf_id'] as String,
      pdfFilename: json['pdf_filename'] as String,
    );

Map<String, dynamic> _$PdfReferenceToJson(_PdfReference instance) =>
    <String, dynamic>{
      'pdf_id': instance.pdfId,
      'pdf_filename': instance.pdfFilename,
    };

_PdfReferencesResponse _$PdfReferencesResponseFromJson(
        Map<String, dynamic> json) =>
    _PdfReferencesResponse(
      pdfReferences: (json['pdf_references'] as List<dynamic>)
          .map((e) => PdfReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PdfReferencesResponseToJson(
        _PdfReferencesResponse instance) =>
    <String, dynamic>{
      'pdf_references': instance.pdfReferences,
    };
