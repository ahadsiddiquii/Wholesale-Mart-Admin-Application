import 'package:flutter/material.dart';

import '../../../../generic/exports/constants_exports.dart'
    show Decorations, ThemeColors;

class GenericCheckMarkIcon extends StatelessWidget {
  const GenericCheckMarkIcon({
    super.key,
    required this.isChecked,
  });

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Decorations.kFieldIconHeight,
      height: Decorations.kFieldIconHeight,
      decoration: BoxDecoration(
        color: isChecked
            ? ThemeColors.kButtonDarkBlueColor
            : ThemeColors.kIconButtonLightGreyColor,
        borderRadius: BorderRadius.circular(
          Decorations.kIconButtonBorderRadius,
        ),
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: Decorations.kButtonIconSize,
      ),
    );
  }
}
