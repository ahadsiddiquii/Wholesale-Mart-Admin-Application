import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../configs/router/routes.dart';
import '../../../../configs/screen_config.dart';
import '../../../../generic/assets/animation_assets.dart';
import '../../../../generic/context/app_context.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    appContext.context = context;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: ScreenConfig.screenSizeWidth * 1.2,
          height: ScreenConfig.screenSizeHeight * 1.3,
          child: LottieBuilder.asset(
            AnimationAssets.DHA_MART_SPLASH_ANIMATION,
            repeat: false,
            fit: BoxFit.fill,
            onLoaded: (value) {
              Future.delayed(
                const Duration(seconds: 6),
                () {
                  Navigator.pushReplacementNamed(
                    context,
                    CustomRouter.onboardingScreenRouteName,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
