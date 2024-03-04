import 'package:flutter/material.dart';

import '../../../exports/constants_exports.dart';
import '../../../exports/widget_exports.dart';

class CustomHeadingText extends StatelessWidget {
  const CustomHeadingText(
    this.text, {
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text,
      style: FontSizes.size20SemiBold(
        color: ThemeColors.kFontSecondaryGreyColor,
      ),
    );
  }
}
