import 'package:flutter/material.dart';

import '../../exports/widget_exports.dart';

class WMSStepperWidget extends StatelessWidget {
  const WMSStepperWidget({
    super.key,
    required this.step1,
    required this.step2,
    required this.step3,
  });

  final Widget step1, step2, step3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        step1,
        const WidthSpacer(),
        step2,
        const WidthSpacer(),
        step3,
      ],
    );
  }
}
