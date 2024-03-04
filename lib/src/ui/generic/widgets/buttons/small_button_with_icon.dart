import 'package:flutter/material.dart';

import '../../exports/constants_exports.dart';
import '../../exports/widget_exports.dart';
import '../containers/count_box/count_in_round_red_circle_box.dart';

// ignore: must_be_immutable
class SmallButtonWithIcon extends StatelessWidget {
  SmallButtonWithIcon({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.color = ThemeColors.kThemeColor,
    this.radius = 5,
    this.height = 55,
    this.showRedCirclePadding = false,
    this.redCircleCount,
  });
  final String icon, text;
  final VoidCallback? onTap;
  final Color color;
  final double radius, height;
  final bool showRedCirclePadding;
  final int? redCircleCount;

  EdgeInsets paddingWhenRedCircle = const EdgeInsets.only(
    top: 8.0,
    left: 8.0,
    right: 8.0,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWellWrapper(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding:
                  showRedCirclePadding ? paddingWhenRedCircle : EdgeInsets.zero,
              child: Container(
                  height: height,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      radius,
                    ),
                    color: color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 22,
                        height: 22,
                        child: Image.asset(
                          icon,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const WidthSpacer(),
                      CustomText(
                        text,
                        style: FontSizes.size16Medium(
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ),
            if (redCircleCount != null)
              CountInRoundRedCircleBox(
                count: redCircleCount!,
                radius: 12,
              ),
          ],
        ),
      ),
    );
  }
}
