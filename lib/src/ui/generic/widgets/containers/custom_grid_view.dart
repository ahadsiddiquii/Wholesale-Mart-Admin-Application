import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../configs/screen_config.dart';
import '../../../generic/exports/widget_exports.dart' show ResponsiveHandler;

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.listMapToGrid,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
  });
  final List<Widget> listMapToGrid;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: ResponsiveHandler.getStaggeredGridCount(context),
      crossAxisSpacing: crossAxisSpacing ?? ScreenConfig.screenSizeWidth * 0.08,
      mainAxisSpacing: mainAxisSpacing ?? 0,
      children: listMapToGrid,
    );
  }
}
