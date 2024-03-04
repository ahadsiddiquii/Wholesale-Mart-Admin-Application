import 'package:flutter/material.dart';

import '../assets/icon_assets.dart';
import '../context/app_context.dart';
import '../exports/widget_exports.dart';

class ApiErrorHandlerService {
  ApiErrorHandlerService._();

  //ignore: prefer_final_fields
  static List<String> _keysForPopUp = [];

  static void triggerApiErrorPopUp({
    VoidCallback? function,
    String? keyForPopUp,
  }) {
    if (keyForPopUp != null && !_keysForPopUp.contains(keyForPopUp)) {
      _keysForPopUp.add(keyForPopUp);
      appContext.runContextSafeFunction(() {
        eliteWholeSaleDialogBoxWithWidgets(
          context: appContext.getContext()!,
          heading: 'Error!',
          iconPath: IconAssets.DIALOG_CROSS_ICON,
          text: 'Something went wrong, please press try again to continue.',
          button1: () {
            if (_keysForPopUp.contains(keyForPopUp)) {
              _keysForPopUp.remove(
                keyForPopUp,
              );
              Navigator.pop(
                appContext.getContext()!,
              );
            }
            if (function != null) {
              function();
            }
          },
          button1Text: 'Try Again',
        );
      });
    }
  }
}
