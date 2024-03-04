import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configs/screen_config.dart';
import '../../exports/constants_exports.dart'
    show Decorations, FontSizes, Spaces, ThemeColors;
import '../../exports/models_exports.dart' show ItemDetails;
import '../../exports/widget_exports.dart'
    show CustomText, HeightSpacer, InkWellWrapper;

class GridItemCategory extends StatelessWidget {
  const GridItemCategory({
    super.key,
    required this.gridItemDetails,
  });
  final ItemDetails gridItemDetails;

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: () => gridItemDetails.onTap,
      child: Container(
        width: ScreenConfig.screenSizeWidth * 0.3,
        height: ScreenConfig.screenSizeWidth * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Decorations.kContainerRadius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              gridItemDetails.itemImage,
            ),
            HeightSpacer(
              space: Spaces.fieldSpacingVertical,
            ),
            CustomText(
              gridItemDetails.itemName,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: FontSizes.size14Medium(
                color: ThemeColors.kFontSecondaryGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
