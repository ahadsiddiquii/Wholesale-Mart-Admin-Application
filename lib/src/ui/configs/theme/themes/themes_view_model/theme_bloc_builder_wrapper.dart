import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes_model/theme_bloc/theme_bloc.dart';

class ThemeBuilderWrapper extends StatelessWidget {
  const ThemeBuilderWrapper({
    super.key,
    required this.child,
  });

  final MaterialApp child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return child;
    });
  }
}
