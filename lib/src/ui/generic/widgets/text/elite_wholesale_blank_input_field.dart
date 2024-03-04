import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../configs/screen_config.dart';
import '../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';
import '../../exports/constants_exports.dart'
    show Decorations, FontSizes, ThemeColors;

class EliteWholesaleBlankInputField extends StatelessWidget {
  const EliteWholesaleBlankInputField({
    super.key,
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.keyboadType,
    this.hintText,
    this.customHeight,
    this.customWidth,
    this.cursorHeight,
    this.customFillColor,
    this.customTextAlignment,
    this.textStyle,
    this.darkCursor = false,
    this.contentPadding,
  });
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboadType;
  final String? hintText;
  final double? customHeight, customWidth, cursorHeight;
  final Color? customFillColor;
  final TextAlign? customTextAlignment;
  final TextStyle? textStyle;
  final bool darkCursor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: customHeight ?? Decorations.kAppBarSearchbarHeight,
      width: customWidth ?? ScreenConfig.screenSizeWidth * 0.6,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: textStyle ?? FontSizes.size14Light(),
        keyboardType: keyboadType,
        textAlign: customTextAlignment ?? TextAlign.start,
        cursorColor: darkCursor
            ? ThemeColors.kFontSecondaryBlueColor
            : ThemeColors.kThemeColor,
        cursorHeight: cursorHeight,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          hintStyle: FontSizes.size14Light(
            color: ThemeColors.kFontSearchHintColor,
          ),
          border: InputBorder.none,
          hintText: (hintText != null)
              ? TranslationBlocHelper.getLocalizedText(hintText!)
              : null,
          fillColor: customFillColor ?? Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
