import 'package:emergency_buddy/domain/entities/first_aid_home_page_model.dart';
import 'package:emergency_buddy/domain/entities/first_aid_listing_model.dart';
import 'package:emergency_buddy/domain/entities/first_aid_model.dart';
import 'package:emergency_buddy/domain/usecases/get_first_aid_home_screen_listing_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'first_aid_state.dart';

class FirstAidCubit extends Cubit<FirstAidState> {
  final GetHomeScreenFirstAidListingUseCase _getFirstAidUsecase;

  FirstAidCubit(
      {required GetHomeScreenFirstAidListingUseCase getFirstAidUsecase})
      : _getFirstAidUsecase = getFirstAidUsecase,
        super(FirstAidInitial());

  late List<FirstAidHomePageData> _categories = [];
  String _selectedAgeGroup = 'adult';

  List<FirstAidHomePageData> get categories => _categories;
  String get ageGroup => _selectedAgeGroup;

  Future<void> loadCategories() async {
    try {
      debugPrint('FirstAidCubit: Loading categories...');
      emit(FirstAidLoading());
      _categories = await _getFirstAidUsecase.execute();
      debugPrint('FirstAidCubit: Loaded ${_categories.length} categories');
      emit(FirstAidAllCategoriesLoaded(
        _categories.where((c) => c.category == 'Life-threatening').toList(),
        _categories.where((c) => c.category == 'Emergency').toList(),
        _selectedAgeGroup,
      ));
    } catch (e) {
      debugPrint('FirstAidCubit: Error loading categories: $e');
      emit(FirstAidError('Failed to load categories: $e'));
    }
  }

  Future<void> setAgeGroup(String ageGroup) async {
    _selectedAgeGroup = ageGroup;
    debugPrint('FirstAidCubit: Age group set to $ageGroup');
    emit(FirstAidAllCategoriesLoaded(
      _categories.where((c) => c.category == 'Life-threatening').toList(),
      _categories.where((c) => c.category == 'Emergency').toList(),
      _selectedAgeGroup,
    ));
  }
}
