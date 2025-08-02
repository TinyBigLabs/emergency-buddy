import 'package:freezed_annotation/freezed_annotation.dart';
part 'first_aid_listing_model.freezed.dart';
part 'first_aid_listing_model.g.dart';

// First Aid Listing Model
@freezed
abstract class FirstAidListing with _$FirstAidListing {
  const factory FirstAidListing({
    @JsonKey(name: 'listing_id') required String listingId,
    @JsonKey(name: 'first_aid_id') required String firstAidId,
    @JsonKey(name: 'pdf_id') required String pdfId,
    required String title,
    required int page,
    @JsonKey(name: 'default') required int defaultValue,
  }) = _FirstAidListing;

  factory FirstAidListing.fromJson(Map<String, dynamic> json) =>
      _$FirstAidListingFromJson(json);

  factory FirstAidListing.empty() {
    return FirstAidListing(
      listingId: '',
      firstAidId: '',
      pdfId: '',
      title: '',
      page: 0,
      defaultValue: 0,
    );
  }
}

// First Aid Listings Response Model
@freezed
abstract class FirstAidListingsResponse with _$FirstAidListingsResponse {
  const factory FirstAidListingsResponse({
    @JsonKey(name: 'first_aid_listings')
    required List<FirstAidListing> firstAidListings,
  }) = _FirstAidListingsResponse;

  factory FirstAidListingsResponse.fromJson(Map<String, dynamic> json) =>
      _$FirstAidListingsResponseFromJson(json);
}
