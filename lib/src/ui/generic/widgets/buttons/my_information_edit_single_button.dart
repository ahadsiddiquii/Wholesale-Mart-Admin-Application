import 'package:flutter/material.dart';

import '../../exports/constants_exports.dart';
import '../../exports/widget_exports.dart';

class MyInfomationEditSingleButton extends StatelessWidget {
  const MyInfomationEditSingleButton({
    super.key,
    required this.buttonText,
    this.function,
  });
  final String buttonText;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.only(
          top: Decorations.kItemsVerticalPadding,
          bottom: Decorations.kItemsVerticalPadding * 1.5,
          left: Decorations.kTextFieldHorizontalContentPadding,
          right: Decorations.kTextFieldHorizontalContentPadding,
        ),
        decoration: BoxDecoration(
          color: ThemeColors.kButtonDarkBlueColor,
          borderRadius: Decorations.kUserProfileTextButtonBorderRadius,
        ),
        child: Center(
          child: CustomText(
            buttonText,
            style: FontSizes.size10Light(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
