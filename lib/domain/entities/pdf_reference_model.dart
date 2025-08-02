import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_reference_model.freezed.dart';
part 'pdf_reference_model.g.dart';

// PDF Reference Model
@freezed
abstract class PdfReference with _$PdfReference {
  const factory PdfReference({
    @JsonKey(name: 'pdf_id') required String pdfId,
    @JsonKey(name: 'pdf_filename') required String pdfFilename,
  }) = _PdfReference;

  factory PdfReference.fromJson(Map<String, dynamic> json) =>
      _$PdfReferenceFromJson(json);

  factory PdfReference.empty() {
    return PdfReference(
      pdfId: '',
      pdfFilename: '',
    );
  }
}

// PDF References Response Model
@freezed
abstract class PdfReferencesResponse with _$PdfReferencesResponse {
  const factory PdfReferencesResponse({
    @JsonKey(name: 'pdf_references') required List<PdfReference> pdfReferences,
  }) = _PdfReferencesResponse;

  factory PdfReferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$PdfReferencesResponseFromJson(json);
}
