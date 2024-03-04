import 'package:flutter/material.dart';

import '../../../../generic/exports/constants_exports.dart'
    show Decorations, FontSizes, Spaces, ThemeColors;
import '../../../../generic/exports/widget_exports.dart'
    show CustomText, HeightSpacer, InkWellWrapper;
import '../../../../generic/widgets/containers/image_display/cached_image_display.dart';
import '../../category_model/category.dart';

class CategoryItemDisplay extends StatelessWidget {
  const CategoryItemDisplay({
    super.key,
    required this.gridSingleCategory,
    this.largeSizedContainer = false,
    this.tapable = true,
    this.showEditIcon = false,
    this.editFunction,
  });
  final Category gridSingleCategory;
  final bool largeSizedContainer, tapable, showEditIcon;
  final VoidCallback? editFunction;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.kIconButtonGreyColor,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Center(
            child: InkWellWrapper(
              onTap: () {
                if (tapable) {}
              },
              child: Padding(
                padding: const EdgeInsets.all(
                  Decorations.kCategoryItemPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Decorations.kCategoryItemImageBoxHeight,
                      height: Decorations.kCategoryItemImageBoxHeight,
                      child: CachedImageDisplay(
                        image: gridSingleCategory.pictureUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    HeightSpacer(
                      space: Spaces.smallestSpacingVertical,
                    ),
                    CustomText(
                      gridSingleCategory.categoryName,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: FontSizes.size12SemiBold(
                        color: ThemeColors.kFontSecondaryGreyColor,
                        letterSpacing: Decorations.letterSpacingForSmallSizes,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showEditIcon)
            InkWellWrapper(
              onTap: editFunction,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                ),
              ),
            )
        ],
      ),
    );
  }
}
