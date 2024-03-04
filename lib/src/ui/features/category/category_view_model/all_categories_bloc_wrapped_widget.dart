import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generic/constants/spaces.dart';
import '../../../generic/exports/widget_exports.dart'
    show
        CustomGridView,
        HeightSpacer,
        WideButton,
        eliteWholeSaleDialogBoxWithWidgets;
import '../../../generic/helper_functions/search_service.dart';
import '../../../generic/widgets/containers/not_found_box/no_generic_text_found.dart';
import '../category_model/all_categories_bloc/all_categories_bloc.dart';
import '../category_model/category.dart';
import '../category_view/category_widget/category_item_display.dart';

class AllCategoriesBlocWrappedWidget extends StatelessWidget {
  const AllCategoriesBlocWrappedWidget({
    super.key,
    this.searchText,
  });
  final String? searchText;

  List<Widget> getWidgetCategoryList(BuildContext context,
      {required List<Category> categoryItems}) {
    final List<Widget> mapToGrid = [];
    for (final item in categoryItems) {
      mapToGrid.add(
        CategoryItemDisplay(
          largeSizedContainer: true,
          gridSingleCategory: item,
          showEditIcon: true,
          editFunction: () {
            eliteWholeSaleDialogBoxWithWidgets(
              willPopScope: true,
              barrierDismissable: true,
              context: context,
              heading: item.categoryName,
              text: 'Category# ${item.categoryId}',
              widgets: [
                HeightSpacer(
                  space: Spaces.defaultSpacingVertical * 2,
                ),
                WideButton(
                  onPressed: () {},
                  borderAlreadyGiven: true,
                  buttonText: 'Update',
                ),
                HeightSpacer(
                  space: Spaces.fieldSpacingVertical,
                ),
                WideButton(
                  onPressed: () {},
                  borderAlreadyGiven: true,
                  buttonText: 'Delete',
                  isTransparent: true,
                ),
              ],
            );
          },
        ),
      );
    }
    return mapToGrid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
      builder: (context, allCategoriesBlocState) {
        if (allCategoriesBlocState is AllCategoriesRetrieved) {
          List<Category> categoryItems = allCategoriesBlocState.allCategories;
          if (searchText != null) {
            categoryItems = SearchService.getFilteredCategoryList(
              categoryItems,
              searchText!,
            );
          }
          if (categoryItems.isNotEmpty) {
            return CustomGridView(
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              listMapToGrid: getWidgetCategoryList(
                context,
                categoryItems: categoryItems,
              ),
            );
          }
        }

        return const Center(
          child: NoGenericTextFound(
            text: 'Category',
          ),
        );
      },
    );
  }
}
