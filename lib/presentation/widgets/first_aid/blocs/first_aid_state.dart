part of 'first_aid_cubit.dart';

@immutable
sealed class FirstAidState {}

final class FirstAidInitial extends FirstAidState {}

final class FirstAidLoading extends FirstAidState {}

final class FirstAidAllCategoriesLoaded extends FirstAidState {
  final List<FirstAidHomePageData> lifeThreateningCategories;
  final List<FirstAidHomePageData> emergencyCategories;

  FirstAidAllCategoriesLoaded(
      this.lifeThreateningCategories, this.emergencyCategories);
}

final class FirstAidError extends FirstAidState {
  final String errorMessage;

  FirstAidError(this.errorMessage);
}
