import 'package:flutter/material.dart';

class KeyboardHandler {
  KeyboardHandler._();
  static bool isKeyBoardOpened(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
}
