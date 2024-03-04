import 'package:flutter/material.dart';

import '../../../configs/screen_config.dart';

class PaddingBorder extends StatelessWidget {
  const PaddingBorder({
    super.key,
    required this.child,
    this.verticalPadding,
    this.horizontalPadding,
  });

  final Widget child;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? ScreenConfig.screenSizeWidth * 0.05,
        vertical: verticalPadding ?? 0,
      ),
      child: child,
    );
  }
}
