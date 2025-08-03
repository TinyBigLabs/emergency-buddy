import 'package:freezed_annotation/freezed_annotation.dart';

part 'age_group_model.freezed.dart';
part 'age_group_model.g.dart';

@freezed
abstract class AgeGroup with _$AgeGroup {
  const factory AgeGroup({
    @JsonKey(name: 'first_aid_id') required String firstAidId,
    @JsonKey(name: 'age_group') required String ageGroup,
  }) = _AgeGroup;

  factory AgeGroup.fromJson(Map<String, dynamic> json) =>
      _$AgeGroupFromJson(json);

  factory AgeGroup.empty() {
    return AgeGroup(
      firstAidId: '',
      ageGroup: '',
    );
  }
}

// PDF References Response Model
@freezed
abstract class AgeGroupResponse with _$AgeGroupResponse {
  const factory AgeGroupResponse({
    @JsonKey(name: 'pdf_references') required List<AgeGroup> ageGroups,
  }) = _AgeGroupResponse;

  factory AgeGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AgeGroupResponseFromJson(json);
}
