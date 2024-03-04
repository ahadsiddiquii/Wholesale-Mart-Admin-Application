import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../assets/image_assets.dart';
import '../constants/spaces.dart';
import '../constants/theme_colors.dart';
import '../exports/widget_exports.dart';

class CircleRoundedLoader extends StatelessWidget {
  const CircleRoundedLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeightSpacer(),
        SizedBox(
          height: 40,
          width: 145,
          child: Image.asset(
            ImageAssets.DHA_MART_LOGO,
            fit: BoxFit.contain,
          ),
        ),
        HeightSpacer(
          space: Spaces.defaultSpacingVertical * 1.25,
        ),
        LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 40,
        ),
      ],
    );
  }
}

class CircleRoundedLoaderWithoutText extends StatelessWidget {
  const CircleRoundedLoaderWithoutText({
    super.key,
    this.diameter,
    this.color,
  });
  final double? diameter;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HeightSpacer(),
        SizedBox(
          height: diameter ?? 40,
          width: diameter ?? 40,
          child: CircularProgressIndicator(
            color: color ?? ThemeColors.kButtonDarkBlueColor,
          ),
        ),
        const HeightSpacer(),
      ],
    );
  }
}
