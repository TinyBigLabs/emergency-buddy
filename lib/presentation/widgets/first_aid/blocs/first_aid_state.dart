part of 'first_aid_cubit.dart';

@immutable
sealed class FirstAidState extends Equatable {}

final class FirstAidInitial extends FirstAidState {
  @override
  List<Object?> get props => [];
}

final class FirstAidLoading extends FirstAidState {
  @override
  List<Object?> get props => [];
}

final class FirstAidAllCategoriesLoaded extends FirstAidState {
  final List<FirstAidHomePageData> lifeThreateningCategories;
  final List<FirstAidHomePageData> emergencyCategories;
  final String ageGroup;

  FirstAidAllCategoriesLoaded(
      this.lifeThreateningCategories, this.emergencyCategories, this.ageGroup);

  @override
  List<Object?> get props =>
      [lifeThreateningCategories, emergencyCategories, ageGroup];
}

final class FirstAidError extends FirstAidState {
  final String errorMessage;

  FirstAidError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
