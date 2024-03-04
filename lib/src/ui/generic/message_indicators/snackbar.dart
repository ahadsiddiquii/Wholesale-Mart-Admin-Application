// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../exports/widget_exports.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void snackBarTrigger({
    required BuildContext context,
    required String message,
    bool needsTranslation = true,
  }) {
    try {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(_showSnackbar(
        message,
        needsTranslation,
      ));
    } catch (e) {
      final String errorString = 'CustomSnackBar: snackBarTrigger, caught: $e';
      debugPrint(
        errorString,
      );
    }
  }

  static SnackBar _showSnackbar(String text, bool needsTranslation) {
    return SnackBar(
      content: Directionality(
        textDirection: TextDirection.ltr,
        child: CustomText(
          text,
          needsTranslation: needsTranslation,
          textAlign: TextAlign.center,
        ),
      ),
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    );
  }
}
