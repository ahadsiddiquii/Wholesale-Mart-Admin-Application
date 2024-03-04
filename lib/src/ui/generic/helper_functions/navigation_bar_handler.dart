import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class NavigationBarHandler {
  NavigationBarHandler._();
  static final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  static AdvancedDrawerController getAdvancedDrawerController() {
    return _advancedDrawerController;
  }

  static void openDrawer() {
    try {
      _advancedDrawerController.showDrawer();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void closeDrawer() {
    try {
      _advancedDrawerController.hideDrawer();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
