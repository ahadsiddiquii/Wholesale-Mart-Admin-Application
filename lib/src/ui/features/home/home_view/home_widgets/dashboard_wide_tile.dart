import 'package:flutter/material.dart';

import '../../../../generic/constants/spaces.dart';
import '../../../../generic/exports/constants_exports.dart'
    show Decorations, FontSizes;
import '../../../../generic/exports/widget_exports.dart';

class DashboardWideTile extends StatelessWidget {
  const DashboardWideTile({
    super.key,
    this.isLeftTile = false,
    required this.iconString,
    required this.heading,
    required this.text,
  });

  final bool isLeftTile;
  final String iconString, heading, text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: isLeftTile
              ? Decorations.kBorderMarginValue
              : Decorations.kBorderMarginValue / 2,
          right: !isLeftTile
              ? Decorations.kBorderMarginValue
              : Decorations.kBorderMarginValue / 2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Decorations.kWideButtonBorderRadius,
          ),
          boxShadow: Decorations.kItemBoxShadow,
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset(
                iconString,
                fit: BoxFit.contain,
              ),
            ),
            HeightSpacer(
              space: Spaces.smallestSpacingVertical * 3,
            ),
            CustomText(
              heading,
              style: FontSizes.size14Medium(
                color: const Color(0xff989898),
              ),
              textAlign: TextAlign.start,
            ),
            CustomText(
              text,
              style: FontSizes.size14Medium(
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
