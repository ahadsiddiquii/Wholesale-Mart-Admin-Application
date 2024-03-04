part of 'all_categories_bloc.dart';

@immutable
sealed class AllCategoriesState {}

final class AllCategoriesInitial extends AllCategoriesState {}

final class AllCategoriesLoading extends AllCategoriesState {}

final class AllCategoriesRetrieved extends AllCategoriesState {
  AllCategoriesRetrieved({
    required this.allCategories,
  });
  final List<Category> allCategories;
}
