import '../category.dart';
import 'category_provider.dart';

class CategoryRepository {
  final CategoryProvider _categoryProvider = CategoryProvider();

  Future<List<Category>> getCategories() => _categoryProvider.getCategories();

  Future<bool> addCategory({
    required String categoryName,
    required String categoryImage,
  }) =>
      _categoryProvider.addCategory(
        categoryName,
        categoryImage,
      );

  Future<bool> deleteCategory({
    required int categoryId,
  }) =>
      _categoryProvider.deleteCategory(
        categoryId,
      );

  Future<bool> updateCategory({
    required int categoryId,
    String? categoryName,
    String? categoryImage,
  }) =>
      _categoryProvider.updateCategory(
        categoryId,
        categoryName,
        categoryImage,
      );
}
