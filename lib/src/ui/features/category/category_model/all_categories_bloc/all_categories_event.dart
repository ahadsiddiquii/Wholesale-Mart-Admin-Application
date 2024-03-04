part of 'all_categories_bloc.dart';

@immutable
sealed class AllCategoriesEvent {}

class ResetAllCategoriesStateToInitial extends AllCategoriesEvent {}

class FetchAllCategories extends AllCategoriesEvent {}

class RefreshAllCategories extends AllCategoriesEvent {
  RefreshAllCategories({
    required this.previousCategories,
  });
  final List<Category> previousCategories;
}
