import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';
import '../../exports/constants_exports.dart'
    show Decorations, FontSizes, ThemeColors;

class WMXPortalDropDownTextField extends StatefulWidget {
  const WMXPortalDropDownTextField({
    this.hintText = '',
    this.onChanged,
    this.validator,
    this.keyboadType,
    this.overrideOnChange = false,
    this.needsTranslation = true,
    this.isDirectionality = true,
    this.isTransparent = false,
    this.controller,
    this.onTap,
    this.customPadding,
    required this.dropDownList,
    super.key,
  });

  final SingleValueDropDownController? controller;
  
  final bool overrideOnChange;
  final bool needsTranslation;
  final VoidCallback? onTap;
  final void Function(dynamic)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboadType;
  final bool isDirectionality;
  final bool isTransparent;
  final EdgeInsets? customPadding;
  final List<DropDownValueModel> dropDownList;

  final String hintText;

  @override
  State<WMXPortalDropDownTextField> createState() =>
      _WMXPortalDropDownTextField();
}

class _WMXPortalDropDownTextField extends State<WMXPortalDropDownTextField> {
  bool isOnChangedEnabled = false;

  InputDecoration _getInputDecoration({
    required bool isTransparent,
    bool isSearchDecoration = false,
  }) {
    if (isTransparent) {
      if (isSearchDecoration) {
        return InputDecoration(
          hintText: TranslationBlocHelper.getLocalizedText(
            widget.hintText,
            needsTranslation: widget.needsTranslation,
          ),
          hintStyle: FontSizes.size14Light(
            color: ThemeColors.kFontHintColor,
          ),
          isDense: true,
          contentPadding: widget.customPadding ??
              const EdgeInsets.symmetric(
                vertical: Decorations.kSecondaryTextFieldVerticalContentPadding,
                horizontal: 20,
              ),
          errorStyle: FontSizes.size14Light(
            color: ThemeColors.kErrorRedColor,
          ),
          errorMaxLines: 3,
        );
      }
      return InputDecoration(
        hintText: TranslationBlocHelper.getLocalizedText(
          widget.hintText,
          needsTranslation: widget.needsTranslation,
        ),
        hintStyle: FontSizes.size14Light(
          color: ThemeColors.kFontHintColor,
        ),
        isDense: true,
        contentPadding: widget.customPadding ??
            const EdgeInsets.symmetric(
              vertical: Decorations.kSecondaryTextFieldVerticalContentPadding,
              horizontal: 20,
            ),
        enabledBorder: Decorations.wmsTransparentFieldOutlineBlueBorder,
        focusedBorder: Decorations.wmsTransparentFieldOutlineBlueBorder,
        errorBorder: Decorations.wmsTransparentFieldOutlineBlueBorder,
        focusedErrorBorder: Decorations.wmsTransparentFieldOutlineBlueBorder,
        disabledBorder: Decorations.wmsTransparentFieldOutlineBlueBorder,
        errorStyle: FontSizes.size14Light(
          color: ThemeColors.kErrorRedColor,
        ),
        errorMaxLines: 3,
      );
    }
    return InputDecoration(
      hintText: TranslationBlocHelper.getLocalizedText(
        widget.hintText,
        needsTranslation: widget.needsTranslation,
      ),
      hintStyle: FontSizes.size14Light(
        color: ThemeColors.kFontHintColor,
      ),
      isDense: true,
      contentPadding: widget.customPadding ??
          const EdgeInsets.symmetric(
            vertical: Decorations.kSecondaryTextFieldVerticalContentPadding,
            horizontal: 20,
          ),
      enabledBorder: Decorations.wmsSecondaryFieldOutlineBlueBorder,
      focusedBorder: Decorations.wmsSecondaryFieldOutlineBlueBorder,
      errorBorder: Decorations.wmsSecondaryFieldOutlineBlueBorder,
      focusedErrorBorder: Decorations.wmsSecondaryFieldOutlineBlueBorder,
      disabledBorder: Decorations.wmsSecondaryFieldOutlineBlueBorder,
      errorStyle: FontSizes.size14Light(
        color: ThemeColors.kErrorRedColor,
      ),
      errorMaxLines: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: (widget.isDirectionality &&
              TranslationBlocHelper.isSelectedLanguageRtl())
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: DropDownTextField(
        // initialValue: "name4",
        controller: widget.controller,
        searchKeyboardType: widget.keyboadType,
        enableSearch: true,
        clearOption: false,
        textFieldDecoration: _getInputDecoration(
          isTransparent: widget.isTransparent,
        ),
        searchDecoration: _getInputDecoration(
          isTransparent: widget.isTransparent,
          isSearchDecoration: true,
        ),
        dropDownList: widget.dropDownList,
        validator: widget.validator != null
            ? (val) {
                setState(() {
                  isOnChangedEnabled = true;
                });
                return widget.validator!(val);
              }
            : null,
        onChanged: (widget.overrideOnChange)
            ? widget.onChanged
            : isOnChangedEnabled
                ? widget.onChanged
                : null,
      ),
    );
  }
}
