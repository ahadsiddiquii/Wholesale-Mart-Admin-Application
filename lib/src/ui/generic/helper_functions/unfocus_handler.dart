import 'package:flutter/material.dart';

class UnfocusHandler {
  UnfocusHandler._();
  static void unFocusPrimaryFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
