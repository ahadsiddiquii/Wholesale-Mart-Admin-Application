import 'package:flutter/material.dart';

import '../../../../generic/exports/constants_exports.dart'
    show FontSizes, Spaces, ThemeColors;
import '../../../../generic/exports/widget_exports.dart'
    show CustomText, HeightSpacer;

class LanguageTile extends StatelessWidget {
  const LanguageTile(
      {required this.title,
      this.subtitle,
      required this.onTap,
      this.isLanguageFromLeft = false,
      this.isSelected = false,
      super.key});
  final String title;
  final String? subtitle;
  final bool isLanguageFromLeft;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Spaces.defaultSpacingVertical,
                    ),
                    child: CustomText(
                      title,
                      style: FontSizes.size18Medium(),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const HeightSpacer(),
                    CustomText(
                      subtitle!,
                    ),
                  ],
                ],
              ),
              if (isSelected)
                const Icon(
                  Icons.check_circle_rounded,
                  color: ThemeColors.kThemeColor,
                )
              else
                const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
