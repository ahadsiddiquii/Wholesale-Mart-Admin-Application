import 'package:flutter/material.dart';

import '../../../constants/font_sizes.dart';
import '../../../constants/spaces.dart';
import '../../../constants/theme_colors.dart';
import '../../../exports/widget_exports.dart';

class GenericIconTextBox extends StatelessWidget {
  const GenericIconTextBox({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

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
            Icon(
              icon,
              color: ThemeColors.kFontPrimaryBlueColor,
              size: 40,
            ),
            HeightSpacer(
              space: Spaces.smallestSpacingVertical,
            ),
            CustomText(
              text,
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
