import 'package:flutter/material.dart';

class AppContext {
  factory AppContext() {
    return _singleton;
  }

  AppContext._internal();
  static final AppContext _singleton = AppContext._internal();

  // Store the app context
  BuildContext? context;

  // Store a global GlobalKey
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext? getContext() {
    if (scaffoldKey.currentContext != null) {
      return scaffoldKey.currentContext!;
    }

    if (context != null) {
      return context!;
    }
    return null;
  }

  void runContextSafeFunction(Function function) {
    if (appContext.getContext() != null) {
      function();
    } else {
      debugPrint('Null Context Found');
    }
  }
}

final AppContext appContext = AppContext();
