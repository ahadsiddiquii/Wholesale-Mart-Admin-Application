import 'package:flutter/material.dart';

enum CurrentRunningApiPriority {
  none,
  low,
  high,
  critical,
}

class ApiPriorityHandler {
  ApiPriorityHandler._();
  static String _currentExecutingApi = '';
  static void setCurrentExecutingApi(String api) {
    debugPrint(api);
    _currentExecutingApi = api;
  }

  static String getCurrentExecutingApi() {
    debugPrint(_currentExecutingApi);
    return _currentExecutingApi;
  }
}
