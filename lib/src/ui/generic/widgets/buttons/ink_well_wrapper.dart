import 'package:flutter/material.dart';

import '../../constants/decorations.dart';
import '../../constants/theme_colors.dart';

class InkWellWrapper extends StatelessWidget {
  const InkWellWrapper({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.child,
  });
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: ThemeColors.kThemeColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(
        Decorations.kContainerRadius,
      ),
      onTap: onTap,
      onLongPress: onLongPress,
      child: child,
    );
  }
}
