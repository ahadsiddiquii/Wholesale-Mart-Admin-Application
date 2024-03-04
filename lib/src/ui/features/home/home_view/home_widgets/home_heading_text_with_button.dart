import 'package:flutter/widgets.dart';

import '../../../../generic/exports/constants_exports.dart';
import '../../../../generic/exports/widget_exports.dart';

class HomeHeadingTextWithButton extends StatelessWidget {
  const HomeHeadingTextWithButton({
    super.key,
    required this.heading,
    this.buttonText = 'View all',
    this.onTap,
  });

  final String heading, buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Decorations.kBorderMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            heading,
            style: FontSizes.size16Medium(
              color: ThemeColors.kFontSecondaryGreyColor,
            ),
          ),
          InkWellWrapper(
            onTap: onTap,
            child: CustomText(
              buttonText,
              style: FontSizes.size14Regular(
                color: ThemeColors.kFontSecondaryGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
