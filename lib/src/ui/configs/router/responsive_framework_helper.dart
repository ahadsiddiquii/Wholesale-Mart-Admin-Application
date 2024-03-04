import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'routes.dart';

class ResponsiveFrameworkHelper {
  Widget responsiveBreakpointsBuilder(Widget child) {
    return ResponsiveBreakpoints.builder(
      child: child,
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }

  MaxWidthBox responsiveFrameworkMaxWidthBox(
      BuildContext context, Widget child) {
    return MaxWidthBox(
      // A widget that limits the maximum width.
      // This is used to create a gutter area on either side of the content.
      maxWidth: 1200,
      background: Container(color: const Color(0xFFF5F5F5)),
      child: ResponsiveScaledBox(
          // ResponsiveScaledBox renders its child with a FittedBox set to the `width` value.
          // Set the fixed width value based on the active breakpoint.
          width: ResponsiveValue<double>(context, conditionalValues: [
            Condition.equals(name: MOBILE, value: 450),
            Condition.between(start: 800, end: 1100, value: 800),
            Condition.between(start: 1000, end: 1200, value: 1000),
            // There are no conditions for width over 1200
            // because the `maxWidth` is set to 1200 via the MaxWidthBox.
          ]).value,
          child: child),
    );
  }

  Widget bouncingScrollWrapperBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return BouncingScrollWrapper.builder(
      context,
      buildPage(settings.name ?? '', context),
      dragWithMouse: true,
    );
  }

  Widget buildPage(String name, BuildContext context) {
    try {
      final List<String> routerKeys = CustomRouter.routes.keys.toList();
      for (final route in routerKeys) {
        if (route == name) {
          return CustomRouter.routes[name]!(context);
        }
      }
      return const SizedBox.shrink();
    } catch (e) {
      return const SizedBox.shrink();
    }
  }
}
