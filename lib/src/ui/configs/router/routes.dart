import 'package:flutter/material.dart';

import '../../features/category/category_view/category_screens/all_category_screen.dart';
import '../../features/home/home_view/home_screens/home_screen.dart';
import '../../features/language/language_view/language_screens/change_language_screen.dart';
import '../../features/onboarding/onboarding_view/onboarding_screens/onboarding_screen.dart';
import '../../features/onboarding/onboarding_view/onboarding_screens/splash_screen.dart';

class CustomRouter {
  CustomRouter._();

  //Feature: Onboarding routes
  static const String splashScreenRouteName = '/';
  static const String onboardingScreenRouteName = '/onboarding';

  //
  //Feature: Order routes
  static const String allCategoryScreenRouteName = '/categories';

  //
  //Feature: Order routes
  static const String homeScreenRouteName = '/home';

  //

  //Feature: Language route
  static const String changeLanguageScreenRouteName = '/change-language';

  static final Map<String, Widget Function(BuildContext)> routes = {
    //Feature: Onboarding router
    splashScreenRouteName: (BuildContext context) => const SplashScreen(),
    onboardingScreenRouteName: (BuildContext context) =>
        const OnboardingScreen(),
    //

    //Feature: Order Router
    homeScreenRouteName: (BuildContext context) => const HomeScreen(),
    //

    //Feature: Language Screen router
    changeLanguageScreenRouteName: (BuildContext context) =>
        const ChangeLanguageScreen(),

    //

    //Feature: Category Screen router
    allCategoryScreenRouteName: (BuildContext context) =>
        const AllCategoryScreen(),
    //
  };
}
