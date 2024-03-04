import 'package:flutter/material.dart';

import '../../exports/constants_exports.dart' show ThemeColors;

class EliteWholesaleCustomDivider extends StatelessWidget {
  const EliteWholesaleCustomDivider({
    super.key,
    this.customColor,
  });
  final Color? customColor;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.5,
      thickness: 1,
      color: customColor ?? ThemeColors.kMyAccountDividerColor,
    );
  }
}
