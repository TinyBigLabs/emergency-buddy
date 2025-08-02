// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_aid_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirstAidListing _$FirstAidListingFromJson(Map<String, dynamic> json) =>
    _FirstAidListing(
      listingId: json['listing_id'] as String,
      firstAidId: json['first_aid_id'] as String,
      pdfId: json['pdf_id'] as String,
      title: json['title'] as String,
      page: (json['page'] as num).toInt(),
      defaultValue: (json['default'] as num).toInt(),
    );

Map<String, dynamic> _$FirstAidListingToJson(_FirstAidListing instance) =>
    <String, dynamic>{
      'listing_id': instance.listingId,
      'first_aid_id': instance.firstAidId,
      'pdf_id': instance.pdfId,
      'title': instance.title,
      'page': instance.page,
      'default': instance.defaultValue,
    };

_FirstAidListingsResponse _$FirstAidListingsResponseFromJson(
        Map<String, dynamic> json) =>
    _FirstAidListingsResponse(
      firstAidListings: (json['first_aid_listings'] as List<dynamic>)
          .map((e) => FirstAidListing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirstAidListingsResponseToJson(
        _FirstAidListingsResponse instance) =>
    <String, dynamic>{
      'first_aid_listings': instance.firstAidListings,
    };
