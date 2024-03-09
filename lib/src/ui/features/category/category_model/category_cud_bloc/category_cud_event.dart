part of 'category_cud_bloc.dart';

@immutable
sealed class CategoryCudEvent {}

class AddCategory extends CategoryCudEvent {
  AddCategory({
    required this.categoryName,
    required this.categoryImage,
  });
  final String categoryName, categoryImage;
}

class DeleteCategory extends CategoryCudEvent {
  DeleteCategory({
    required this.categoryId,
  });
  final int categoryId;
}

class UpdateCategory extends CategoryCudEvent {
  UpdateCategory({
    required this.categoryId,
    this.categoryName,
    this.categoryImage,
  });
  final int categoryId;
  final String? categoryName;
  final String? categoryImage;
}
