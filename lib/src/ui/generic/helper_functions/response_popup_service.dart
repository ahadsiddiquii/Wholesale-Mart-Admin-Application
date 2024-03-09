import 'package:flutter/material.dart';

import '../../configs/router/routes.dart';
import '../context/app_context.dart';
import '../exports/assets_exports.dart';
import '../exports/widget_exports.dart';

class ResponsePopUpService {
  ResponsePopUpService._();

  static void showVerificationSuccessfullPopUp({
    String? heading,
    String? message,
    String? buttonText,
    VoidCallback? buttonFunction,
  }) {
    appContext.runContextSafeFunction(() {
      eliteWholeSaleDialogBoxWithWidgets(
        context: appContext.getContext()!,
        heading: heading ?? 'Verified',
        iconPath: IconAssets.DIALOG_TICK_ICON,
        text: message,
        button1: buttonFunction ??
            () {
              Navigator.pushNamedAndRemoveUntil(
                appContext.getContext()!,
                CustomRouter.homeScreenRouteName,
                (route) => false,
              );
            },
        button1Text: buttonText ?? 'Continue to home',
      );
    });
  }

  static void showVerificationFailedPopUp({
    String? heading,
    String? message,
    String? buttonText,
    VoidCallback? buttonFunction,
  }) {
    appContext.runContextSafeFunction(() {
      eliteWholeSaleDialogBoxWithWidgets(
        context: appContext.getContext()!,
        heading: heading ?? 'Verification failed',
        iconData: Icons.cancel_rounded,
        text: message,
        button1: buttonFunction ??
            () {
              Navigator.pop(
                appContext.getContext()!,
              );
            },
        button1Text: buttonText ?? 'Go back',
      );
    });
  }
}
