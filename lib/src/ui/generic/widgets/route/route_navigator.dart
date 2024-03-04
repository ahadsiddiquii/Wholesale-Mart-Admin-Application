import 'package:flutter/material.dart';

import '../../../configs/router/routes.dart';

class RouteNavigator {
  static void navigatorPush(
    BuildContext context,
    String route, {
    bool animatedNavigation = true,
    bool namedRoute = true,
  }) {
    if (animatedNavigation && namedRoute) {
      Navigator.pushNamed(
        context,
        route,
      );
    } else {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return CustomRouter.routes[route]!(context);
          },
          transitionDuration: Duration.zero,
        ),
      );
    }
  }
}
