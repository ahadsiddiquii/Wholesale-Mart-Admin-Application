import 'package:flutter/material.dart';

import '../../../configs/screen_config.dart';
import '../../exports/constants_exports.dart' show Decorations;

class DecoratedBorderContainer extends StatelessWidget {
  DecoratedBorderContainer({
    super.key,
    required this.child,
    this.color,
  });
  final Widget child;
  final Color? color;

  final double _mainHeight = ScreenConfig.screenSizeHeight * 0.4;
  final double _horizontalDashesLength = 30;
  final double _verticalDashesLength = 60;
  final double _borderDashesThickness = 6;
  final double _borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              _borderRadius,
            ),
            color: color,
          ),
          height: _mainHeight,
          margin: Decorations.kBorderPickingOrderItemMargin,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                _borderRadius - 5,
              ),
              color: Colors.white,
            ),
            margin: EdgeInsets.all(
              _borderDashesThickness,
            ),
          ),
        ),
        Container(
          height: _mainHeight,
          margin: EdgeInsets.symmetric(
            horizontal: Decorations.kBorderPickingOrderItemValue +
                _horizontalDashesLength,
          ),
          color: Colors.white,
        ),
        Container(
          height: _mainHeight - _verticalDashesLength,
          margin: Decorations.kBorderPickingOrderItemMargin,
          color: Colors.white,
        ),
        Container(
          height: _mainHeight - 20,
          margin: EdgeInsets.symmetric(
            horizontal: Decorations.kBorderPickingOrderItemValue + 10,
          ),
          child: child,
        ),
      ],
    );
  }
}
