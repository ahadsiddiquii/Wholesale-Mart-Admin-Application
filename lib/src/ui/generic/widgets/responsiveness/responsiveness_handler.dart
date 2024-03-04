import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../exports/constants_exports.dart';
import '../../exports/space_exports.dart';

class ResponsiveHandler {
  ResponsiveHandler._();
  static int getStaggeredGridCount(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isTablet) {
      return 5;
    }
    return 3;
  }

  static double getMenuItemHeight(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isTablet) {
      return Decorations.kCategoryItemHeight + 50;
    }
    return Decorations.kCategoryItemHeight + 15;
  }
}
