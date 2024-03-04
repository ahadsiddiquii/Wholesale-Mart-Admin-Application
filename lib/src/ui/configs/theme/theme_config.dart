import 'package:flutter/material.dart';

import '../../generic/constants/theme_colors.dart';
import '../../generic/enums/theme_enum.dart';

class AppThemeConfig {
  final String themeStorageKey = 'theme';
  final ThemeData _theme = ThemeData(
    primaryColor: ThemeColors.kThemeColor,
    scaffoldBackgroundColor: ThemeColors.kScaffoldBackgroundColor,
    fontFamily: 'Poppins',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    primaryColor: ThemeColors.kButtonDarkBlueColor,
    scaffoldBackgroundColor: Colors.grey.shade900,
    fontFamily: 'Poppins',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );

  ThemeData getThemeData(ThemeFlavor flavor) {
    if (flavor == ThemeFlavor.Dark) {
      return _darkTheme;
    }
    return _theme;
  }
}
