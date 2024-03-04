// Flutter imports:
import 'package:flutter/material.dart';

class ScreenConfig {
  late MediaQueryData _mediaQueryData;
  late double _screenWidth;
  late double _screenHeight;
  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double _safeBlockHorizontal;
  late double _safeBlockVertical;
  static late ThemeData theme;
  static late double screenSizeWidth;
  static late double screenSizeHeight;
  static late double devicePixelRatio;
  static late double textScaleFactor;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    _safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 100;
    _safeBlockVertical = (_screenHeight - _safeAreaVertical) / 100;
    theme = Theme.of(context);
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    screenSizeWidth = _safeBlockHorizontal * 100;
    screenSizeHeight = _safeBlockVertical * 100;
    textScaleFactor = _mediaQueryData.textScaleFactor;
  }
}
