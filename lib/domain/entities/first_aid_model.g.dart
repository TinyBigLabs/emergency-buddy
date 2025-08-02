// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_aid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirstAidData _$FirstAidDataFromJson(Map<String, dynamic> json) =>
    _FirstAidData(
      firstAidId: json['first_aid_id'] as String,
      promptTag: json['prompt_tag'] as String,
      ageGroup: json['age_group'] as String,
      category: json['category'] as String,
      language: json['language'] as String,
      sort: (json['sort'] as num).toInt(),
    );

Map<String, dynamic> _$FirstAidDataToJson(_FirstAidData instance) =>
    <String, dynamic>{
      'first_aid_id': instance.firstAidId,
      'prompt_tag': instance.promptTag,
      'age_group': instance.ageGroup,
      'category': instance.category,
      'language': instance.language,
      'sort': instance.sort,
    };

_FirstAidDataResponse _$FirstAidDataResponseFromJson(
        Map<String, dynamic> json) =>
    _FirstAidDataResponse(
      firstAidData: (json['first_aid_data'] as List<dynamic>)
          .map((e) => FirstAidData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirstAidDataResponseToJson(
        _FirstAidDataResponse instance) =>
    <String, dynamic>{
      'first_aid_data': instance.firstAidData,
    };
