import 'package:flutter/material.dart';

import '../../../constants/font_sizes.dart';
import '../../../constants/spaces.dart';
import '../../../constants/theme_colors.dart';
import '../../../exports/widget_exports.dart';

class NoGenericTextFound extends StatelessWidget {
  const NoGenericTextFound({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            HeightSpacer(
              space: Spaces.defaultSpacingVertical * 2,
            ),
            const Icon(
              Icons.close_rounded,
              color: ThemeColors.kFontPrimaryBlueColor,
              size: 40,
            ),
            CustomText(
              'No $text found',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FontSizes.size14Light(
                color: ThemeColors.kFontPrimaryBlueColor,
              ),
            ),
            const HeightSpacer(),
          ],
        ),
      ],
    );
  }
}
