import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generic/exports/assets_exports.dart';
import '../category_model/all_categories_bloc/all_categories_bloc.dart';
import '../category_model/category.dart';
import '../category_model/category_cud_bloc/category_cud_bloc.dart';

class CategoryService {
  CategoryService._();

  static List<Category> categoryItems = [];

  static List<Category> getCategoryItems({
    int limit = 20,
  }) {
    final List<Category> categoryItems = [];

    for (int i = 0; i < limit; i++) {
      categoryItems.add(
        Category(
          categoryId: i,
          categoryName: 'Category ${i + 1}',
          pictureUrl: ImageAssets.COCACOLA_IMAGE_DUMMY,
        ),
      );
    }

    return categoryItems;
  }

  static List<Category> getProductItems({
    int limit = 100,
  }) {
    final List<Category> categoryItems = [];

    for (int i = 0; i < limit; i++) {
      categoryItems.add(
        Category(
          categoryId: i,
          categoryName: 'Product ${i + 1}',
          pictureUrl: ImageAssets.DRDANK_IMAGE_DUMMY,
        ),
      );
    }

    return categoryItems;
  }

  // static Widget getHomeThreeByTwoCategoryGeneralDisplay() {
  //   return const HomeCategoryBlocWrappedDisplay();
  // }

  static getThreeByTwoCategorySpecificDisplay({
    required int categoryId,
  }) {}

  //Bloc Calling
  //All Categories Bloc
  static void getAllCategories(BuildContext context) {
    final allCategoriesBlocState =
        BlocProvider.of<AllCategoriesBloc>(context).state;

    if (allCategoriesBlocState is AllCategoriesRetrieved) {
      BlocProvider.of<AllCategoriesBloc>(context).add(
        RefreshAllCategories(
          previousCategories: allCategoriesBlocState.allCategories,
        ),
      );
    } else {
      BlocProvider.of<AllCategoriesBloc>(context).add(
        FetchAllCategories(),
      );
    }
  }

  static void resetAllCategoriesBloc(BuildContext context) {
    BlocProvider.of<AllCategoriesBloc>(context).add(
      ResetAllCategoriesStateToInitial(),
    );
  }

  //Category CUD Bloc
  //Add Category
  static void addCategory(
    BuildContext context, {
    required String categoryName,
    required String categoryImage,
  }) {
    BlocProvider.of<CategoryCudBloc>(context).add(
      AddCategory(
        categoryName: categoryName,
        categoryImage: categoryImage,
      ),
    );
  }

  //Update Category
  static void updateCategory(
    BuildContext context, {
    required int categoryId,
    String? categoryName,
    String? categoryImage,
  }) {
    BlocProvider.of<CategoryCudBloc>(context).add(
      UpdateCategory(
        categoryId: categoryId,
        categoryName: categoryName,
        categoryImage: categoryImage,
      ),
    );
  }

  //Delete Category
  static void deleteCategory(
    BuildContext context, {
    required int categoryId,
  }) {
    BlocProvider.of<CategoryCudBloc>(context).add(
      DeleteCategory(
        categoryId: categoryId,
      ),
    );
  }
}
