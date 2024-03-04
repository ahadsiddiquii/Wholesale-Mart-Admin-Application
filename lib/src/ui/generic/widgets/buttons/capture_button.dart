import 'package:flutter/material.dart';

import '../../../configs/screen_config.dart';
import '../../exports/constants_exports.dart'
    show FontSizes, Spaces, ThemeColors;
import '../../exports/widget_exports.dart'
    show CustomText, HeightSpacer, InkWellWrapper;

class CapturingButton extends StatelessWidget {
  CapturingButton({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String title, image;
  final VoidCallback? onTap;

  //Decoration of capturing button
  final double margin = ScreenConfig.screenSizeWidth * 0.1;
  final double padding = 30.0;
  final double boxRadius = 30;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWellWrapper(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(
            margin,
          ),
          padding: EdgeInsets.all(
            padding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              boxRadius,
            ),
            color: ThemeColors.kThemeColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                HeightSpacer(
                  space: Spaces.fieldSpacingVertical,
                ),
                CustomText(
                  title,
                  style: FontSizes.size20Bold(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
