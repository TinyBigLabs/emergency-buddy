// Repository for managing first aid data
import 'dart:convert';

import 'package:emergency_buddy/domain/entities/first_aid_home_page_model.dart';
import 'package:emergency_buddy/domain/entities/first_aid_listing_model.dart';
import 'package:emergency_buddy/domain/entities/first_aid_model.dart';
import 'package:emergency_buddy/domain/entities/pdf_reference_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class FirstAidRepository {
  /// Get all first aid procedures
  Future<List<FirstAidHomePageData>> getHomePageListing();
}

/// Exception thrown when repository operations fail
class FirstAidRepositoryException implements Exception {
  final String message;
  final dynamic cause;

  const FirstAidRepositoryException(this.message, [this.cause]);

  @override
  String toString() =>
      'FirstAidRepositoryException: $message${cause != null ? ' (Cause: $cause)' : ''}';
}

class FirstAidRepositoryImpl implements FirstAidRepository {
  // Private fields for caching
  List<FirstAidData> _firstAidDataList = [];
  List<PdfReference> _pdfList = [];
  List<FirstAidListing> _firstAidMainListing = [];

  /// Simple init function to load all data
  Future<void> loadData({
    String categoriesAssetPath = 'assets/data/first_aid_categories.json',
    String pdfReferencesAssetPath = 'assets/data/pdf.json',
    String listingsAssetPath = 'assets/data/listing.json',
  }) async {
    debugPrint('Data not loaded yet, loading from assets...');

    debugPrint('Loading data from assets...');
    try {
      final proceduresJson = await rootBundle.loadString(categoriesAssetPath);
      final proceduresArray = json.decode(proceduresJson) as List<dynamic>;
      _firstAidDataList = proceduresArray
          .map((item) => FirstAidData.fromJson(item as Map<String, dynamic>))
          .toList();

      // Load PDF references
      final pdfReferencesJson =
          await rootBundle.loadString(pdfReferencesAssetPath);
      final pdfReferencesArray =
          json.decode(pdfReferencesJson) as List<dynamic>;
      _pdfList = pdfReferencesArray
          .map((item) => PdfReference.fromJson(item as Map<String, dynamic>))
          .toList();

      // Load listings
      final listingsJson = await rootBundle.loadString(listingsAssetPath);
      final listingsArray = json.decode(listingsJson) as List<dynamic>;
      _firstAidMainListing = listingsArray
          .map((item) => FirstAidListing.fromJson(item as Map<String, dynamic>))
          .toList();

      debugPrint('Loaded ${_firstAidDataList.length} first aid procedures');
      debugPrint('Loaded ${_pdfList.length} PDF references');
      debugPrint('Loaded ${_firstAidMainListing.length} listings');
    } catch (e) {
      debugPrint('Error loading data: $e');
      throw FirstAidRepositoryException('Failed to initialize repository', e);
    }
  }

  @override
  Future<List<FirstAidHomePageData>> getHomePageListing() async {
    // Ensure data is loaded
    if (_firstAidDataList.isEmpty &&
        _pdfList.isEmpty &&
        _firstAidMainListing.isEmpty) {
      await loadData();
    }

    // Combine data from all three lists
    final combinedData = _firstAidMainListing
        .map((listing) {
          final firstAidData = _firstAidDataList.firstWhere(
            (data) =>
                data.firstAidId == listing.firstAidId && data.language == 'en',
            // Assuming 'en' is the default language
            orElse: () => FirstAidData.empty(),
          );

          return FirstAidHomePageData(
            category: firstAidData.category,
            promptTag: firstAidData.promptTag,
            ageGroup: firstAidData.ageGroup,
            pdf: _pdfList
                .firstWhere(
                  (pdf) => pdf.pdfId == listing.pdfId,
                  orElse: () => PdfReference.empty(),
                )
                .pdfFilename,
            sort: firstAidData.sort,
          );
        })
        .toSet()
        .toList();

    // sort by sort
    final filteredAndSortedData = combinedData.toList()
      ..sort((a, b) => a.sort.compareTo(b.sort));

    return filteredAndSortedData;
  }
}
