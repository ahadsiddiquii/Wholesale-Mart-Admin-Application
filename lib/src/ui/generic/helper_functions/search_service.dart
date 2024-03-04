import '../../features/category/category_model/category.dart';

class SearchService {
  SearchService._();

  static List<Category> getFilteredCategoryList(
    List<Category> listToFilter,
    String searchString,
  ) {
    final filteredList = listToFilter
        .where((item) => item.categoryName
            .toLowerCase()
            .contains(searchString.toLowerCase()))
        .toList();
    return filteredList;
  }
}
