import 'package:flutter/material.dart';

import '../../../exports/constants_exports.dart';

class ListItemTrailingBox extends StatelessWidget {
  const ListItemTrailingBox({
    super.key,
    required this.child,
    this.boxColor,
    this.isDark,
    this.width,
    this.height,
  });

  final Widget child;
  final Color? boxColor;
  final bool? isDark;
  final double? width, height;

  Color _getBoxContainerColor() {
    if (isDark != null) {
      if (isDark!) {
        return ThemeColors.kThemeColor;
      }
      return ThemeColors.kButtonDarkBlueColor;
    }
    if (boxColor != null) {
      return boxColor!;
    }
    return ThemeColors.kThemeColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? Decorations.kListItemDiameter,
      width: width ?? Decorations.kListItemDiameter,
      decoration: BoxDecoration(
        boxShadow: Decorations.kItemBoxShadow,
        color: _getBoxContainerColor(),
        borderRadius: const BorderRadius.all(
          Radius.circular(Decorations.kItemsRadius),
        ),
      ),
      child: child,
    );
  }
}
