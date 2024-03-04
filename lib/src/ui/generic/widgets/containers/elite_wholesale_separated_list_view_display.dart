import 'package:flutter/material.dart';

import '../../../configs/screen_config.dart';
import '../../exports/widget_exports.dart' show HeightSpacer;

class EliteWholesaleSeparatedListViewDisplay extends StatelessWidget {
  const EliteWholesaleSeparatedListViewDisplay({
    super.key,
    required this.listOfItems,
    this.bottomNavBarPadding = false,
  });
  final List<Widget> listOfItems;
  final bool bottomNavBarPadding;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        top: ScreenConfig.screenSizeHeight * 0.01,
        bottom:
            // bottomNavBarPadding ? 150 :
            ScreenConfig.screenSizeHeight * 0.01,
      ),
      itemCount: listOfItems.length,
      separatorBuilder: (context, _) {
        return const HeightSpacer();
      },
      itemBuilder: (context, index) {
        return listOfItems[index];
      },
    );
  }
}
