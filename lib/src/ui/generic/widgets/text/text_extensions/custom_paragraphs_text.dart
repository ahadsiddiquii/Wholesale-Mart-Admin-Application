import 'package:flutter/material.dart';

import '../../../exports/constants_exports.dart';
import '../../../exports/widget_exports.dart';

class CustomParagraphText extends StatelessWidget {
  const CustomParagraphText(
    this.text, {
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text,
      style: FontSizes.size14Regular(
        color: ThemeColors.kFontSecondaryGreyColor,
      ),
    );
  }
}
