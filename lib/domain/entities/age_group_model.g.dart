// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AgeGroup _$AgeGroupFromJson(Map<String, dynamic> json) => _AgeGroup(
      firstAidId: json['first_aid_id'] as String,
      ageGroup: json['age_group'] as String,
    );

Map<String, dynamic> _$AgeGroupToJson(_AgeGroup instance) => <String, dynamic>{
      'first_aid_id': instance.firstAidId,
      'age_group': instance.ageGroup,
    };

_AgeGroupResponse _$AgeGroupResponseFromJson(Map<String, dynamic> json) =>
    _AgeGroupResponse(
      ageGroups: (json['pdf_references'] as List<dynamic>)
          .map((e) => AgeGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgeGroupResponseToJson(_AgeGroupResponse instance) =>
    <String, dynamic>{
      'pdf_references': instance.ageGroups,
    };
