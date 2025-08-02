// first_aid_data.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_aid_model.freezed.dart';
part 'first_aid_model.g.dart';

// First Aid Data Model
@freezed
abstract class FirstAidData with _$FirstAidData {
  const factory FirstAidData({
    @JsonKey(name: 'first_aid_id') required String firstAidId,
    @JsonKey(name: 'prompt_tag') required String promptTag,
    @JsonKey(name: 'age_group') required String ageGroup,
    required String category,
    required String language,
    required int sort,
  }) = _FirstAidData;

  factory FirstAidData.fromJson(Map<String, dynamic> json) =>
      _$FirstAidDataFromJson(json);

  factory FirstAidData.empty() {
    return FirstAidData(
      firstAidId: '',
      promptTag: '',
      ageGroup: '',
      category: '',
      language: 'en',
      sort: 0,
    );
  }
}

// First Aid Data Response Model (contains the array)
@freezed
abstract class FirstAidDataResponse with _$FirstAidDataResponse {
  const factory FirstAidDataResponse({
    @JsonKey(name: 'first_aid_data') required List<FirstAidData> firstAidData,
  }) = _FirstAidDataResponse;

  factory FirstAidDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FirstAidDataResponseFromJson(json);
}
