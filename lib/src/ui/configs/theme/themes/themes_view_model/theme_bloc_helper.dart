import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generic/enums/theme_enum.dart';
import '../themes_model/theme_bloc/theme_bloc.dart';

class ThemeBlocHelper {
  ThemeBlocHelper._();

  static ThemeFlavor getCurrentThemeFlavor(
    BuildContext context,
  ) {
    final themeState = BlocProvider.of<ThemeBloc>(context).state;
    if (themeState is ThemeFetched) {
      return themeState.theme;
    }

    return ThemeFlavor.Default;
  }

  static void changeTheme(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    final themeState = themeBloc.state;
    if (themeState is ThemeFetched) {
      if (themeState.theme.name == ThemeFlavor.Dark.name) {
        themeBloc.add(
          SwitchAppTheme(
            updatedFlavor: ThemeFlavor.Default,
          ),
        );
      }
      if (themeState.theme.name == ThemeFlavor.Default.name) {
        themeBloc.add(
          SwitchAppTheme(
            updatedFlavor: ThemeFlavor.Dark,
          ),
        );
      }
    }
  }
}
