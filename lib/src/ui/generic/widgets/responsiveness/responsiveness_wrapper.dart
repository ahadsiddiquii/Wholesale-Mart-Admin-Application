import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ResponsiveWrapperDisplay extends StatelessWidget {
  const ResponsiveWrapperDisplay({
    super.key,
    this.childForMobile,
    this.childForTablet,
  });
  final Widget? childForTablet;
  final Widget? childForMobile;

  @override
  Widget build(BuildContext context) {
    if (childForMobile != null && ResponsiveBreakpoints.of(context).isMobile) {
      return childForMobile!;
    }
    if (childForTablet != null && ResponsiveBreakpoints.of(context).isTablet) {
      return childForTablet!;
    }
    return const SizedBox();
  }
}
