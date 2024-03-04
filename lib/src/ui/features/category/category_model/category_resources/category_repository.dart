import '../category.dart';
import 'category_provider.dart';

class CategoryRepository {
  final CategoryProvider _categoryProvider = CategoryProvider();

  Future<List<Category>> getCategories() => _categoryProvider.getCategories();
}
