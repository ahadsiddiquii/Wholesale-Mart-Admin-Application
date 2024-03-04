import 'package:flutter/material.dart';

import '../../../../generic/exports/constants_exports.dart';
import '../../../../generic/exports/widget_exports.dart';
import '../../../../generic/widgets/appbars/custom_appbar_with_searchbar.dart';
import '../../category_view_model/all_categories_bloc_wrapped_widget.dart';
import '../../category_view_model/category_service.dart';
import '../category_widget/add_update_category_item.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  TextEditingController searchBarController = TextEditingController();

  void updateSearchText(String value) {
    setState(() {
      searchBarController.text = value;
    });
  }

  @override
  void initState() {
    super.initState();
    CategoryService.getAllCategories(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWithSearchbar(
        showLeading: true,
        showSearchBarScanner: false,
        showUserIcon: false,
        showOtherIcon: true,
        otherIcon: Icons.add_circle_outline_rounded,
        otherIconFunction: () {
          eliteWholeSaleDialogBoxWithWidgets(
            willPopScope: true,
            barrierDismissable: true,
            context: context,
            heading: 'Add Category',
            text: 'Please enter category details',
            widgets: [
              HeightSpacer(
                space: Spaces.defaultSpacingVertical * 1.5,
              ),
              const AddUpdateCategoryItemDisplay(),
            ],
          );
        },
        extendCurvedContainerHeight: 35,
        title: 'All Categories',
        showSearchBarCrossIcon: true,
        searchController: searchBarController,
        searchBarCrossAdditionFunction: () {
          setState(() {
            searchBarController.clear();
          });
        },
        onChangeSearch: updateSearchText,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllCategoriesBlocWrappedWidget(
              searchText: searchBarController.text,
            ),
            const HeightSpacer(),
          ],
        ),
      ),
    );
  }
}
