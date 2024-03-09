import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/category/category_model/all_categories_bloc/all_categories_bloc.dart';
import '../features/category/category_model/category_cud_bloc/category_cud_bloc.dart';
import '../features/onboarding/onboarding_model/bloc/onboarding_bloc.dart';
import 'theme/themes/themes_model/theme_bloc/theme_bloc.dart';

class BlocInitializer extends StatelessWidget {
  const BlocInitializer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(CheckedSavedTheme()),
        ),
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) => AllCategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryCudBloc(),
        ),
      ],
      child: child,
    );
  }
}
