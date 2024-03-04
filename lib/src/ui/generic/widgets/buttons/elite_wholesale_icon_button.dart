import 'package:flutter/material.dart';

import '../../constants/decorations.dart';
import '../../constants/theme_colors.dart';

class EliteWholeSaleIconButton extends StatelessWidget {
  const EliteWholeSaleIconButton({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    required this.icon,
    required this.onTap,
    this.iconSize = 0,
    this.isGreyButton = false,
    this.customBorderRadius,
  });
  final double? buttonHeight;
  final double? buttonWidth;
  final IconData icon;
  final VoidCallback onTap;
  final double iconSize;
  final bool isGreyButton;
  final double? customBorderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: buttonHeight ?? Decorations.kIconButtonHeight,
        width: buttonWidth ?? Decorations.kIconButtonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            customBorderRadius ?? Decorations.kIconButtonBorderRadius,
          ),
          color: isGreyButton
              ? ThemeColors.kMyAccountDividerColor
              : ThemeColors.kButtonDarkBlueColor,
        ),
        child: Icon(
          icon,
          size: Decorations.kIconButtonIconSize + iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
