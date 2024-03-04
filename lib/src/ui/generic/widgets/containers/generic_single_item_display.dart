import 'package:flutter/material.dart';

import '../../../configs/screen_config.dart';
import '../../exports/constants_exports.dart';
import '../../exports/widget_exports.dart';

class SingleItemDisplay extends StatelessWidget {
  const SingleItemDisplay({
    super.key,
    required this.headerText,
    required this.name,
    required this.address,
    required this.city,
    this.zip,
    this.phone,
    this.showArrow = true,
  });

  final String headerText;
  final String name;
  final String address;
  final String city;
  final String? zip;
  final String? phone;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Decorations.kBorderMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ScreenConfig.screenSizeWidth * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(),
                CustomText(
                  '$headerText: $name',
                  maxLines: 2,
                  style: FontSizes.size14SemiBold(
                    color: Colors.black,
                  ),
                ),
                if (address.isNotEmpty)
                  CustomText(
                    '${GenericUsedText.ADDRESS}: $address',
                    maxLines: 2,
                    style: FontSizes.size14Regular(
                      color: ThemeColors.kFontPrimaryBlueColor,
                      height: Decorations.lineSpacingForCompactBoxes,
                    ),
                  ),
                if (city.isNotEmpty)
                  CustomText(
                    '${GenericUsedText.CITY}: $city',
                    maxLines: 2,
                    style: FontSizes.size14Regular(
                      color: ThemeColors.kFontPrimaryBlueColor,
                      height: Decorations.lineSpacingForCompactBoxes,
                    ),
                  ),
                if (zip != null && zip!.isNotEmpty)
                  CustomText(
                    '${GenericUsedText.ZIP}: $zip',
                    maxLines: 2,
                    style: FontSizes.size14Regular(
                      color: ThemeColors.kFontPrimaryBlueColor,
                      height: Decorations.lineSpacingForCompactBoxes,
                    ),
                  ),
                if (phone != null && phone!.isNotEmpty)
                  CustomText(
                    '${GenericUsedText.PHONE}: $phone',
                    maxLines: 2,
                    style: FontSizes.size14Regular(
                      color: ThemeColors.kFontPrimaryBlueColor,
                      height: Decorations.lineSpacingForCompactBoxes,
                    ),
                  ),
                const HeightSpacer(),
              ],
            ),
          ),
          if (showArrow)
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ThemeColors.kFontPrimaryBlueColor,
            )
        ],
      ),
    );
  }
}
