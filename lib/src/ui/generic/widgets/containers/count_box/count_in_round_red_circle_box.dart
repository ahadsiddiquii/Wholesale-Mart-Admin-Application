import 'package:flutter/material.dart';

import '../../../exports/constants_exports.dart';
import '../../../exports/widget_exports.dart';

class CountInRoundRedCircleBox extends StatelessWidget {
  const CountInRoundRedCircleBox({
    super.key,
    required this.count,
    this.radius = 9,
  });
  final int count;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ThemeColors.kErrorRedColor,
      radius: radius,
      child: CustomText(
        count.toString(),
        style: FontSizes.size10SemiBold(
          color: Colors.white,
        ),
      ),
    );
  }
}
