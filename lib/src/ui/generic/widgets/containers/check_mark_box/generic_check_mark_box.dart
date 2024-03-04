import 'package:flutter/material.dart';

import '../../../../generic/exports/constants_exports.dart'
    show Decorations, ThemeColors;
import '../../../../generic/exports/widget_exports.dart' show InkWellWrapper;

class GenericCheckMarkBox extends StatefulWidget {
  const GenericCheckMarkBox({
    super.key,
    this.afterCheckFunction,
    this.isCheckedFromProductList,
    this.productId,
  });

  final VoidCallback? afterCheckFunction;
  final bool? isCheckedFromProductList;
  final String? productId;
  @override
  State<GenericCheckMarkBox> createState() => _GenericCheckMarkBoxState();
}

class _GenericCheckMarkBoxState extends State<GenericCheckMarkBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        if (widget.afterCheckFunction != null) {
          widget.afterCheckFunction!();
        }
      },
      child: SizedBox(
        height: Decorations.kFieldIconHeight * 5,
        width: Decorations.kFieldIconHeight * 1.5,
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            width: Decorations.kFieldIconHeight,
            height: Decorations.kFieldIconHeight,
            decoration: BoxDecoration(
              color: isChecked
                  ? ThemeColors.kButtonDarkBlueColor
                  : ThemeColors.kIconButtonLightGreyColor,
              borderRadius: BorderRadius.circular(
                Decorations.kIconButtonBorderRadius,
              ),
              // border: Border.all(
              //   color: ThemeColors.kButtonDarkBlueColor,
              //   width: 2.0,
              // ),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: Decorations.kButtonIconSize,
            ),
          ),
        ),
      ),
    );
  }
}
