import 'package:flutter/material.dart';

import '../../../exports/constants_exports.dart';

class WMSListItem extends StatelessWidget {
  const WMSListItem({
    super.key,
    this.isDark = false,
    this.addMargin = true,
    required this.child,
    this.padding,
  });

  final bool isDark, addMargin;
  final Widget child;
  final EdgeInsets? padding;

  Color _getColor() {
    if (isDark) {
      return ThemeColors.kButtonDarkBlueColor;
    }
    return ThemeColors.kThemeColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: addMargin ? Decorations.kBorderMarginValue : 0,
        vertical: Decorations.kItemsListGapping,
      ),
      padding: const EdgeInsets.only(
        left: 3,
      ),
      decoration: BoxDecoration(
        boxShadow: Decorations.kItemBoxShadow,
        color: _getColor(),
        borderRadius: const BorderRadius.all(
          Radius.circular(Decorations.kItemsRadius),
        ),
      ),
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 3,
            ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(Decorations.kItemsRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}
