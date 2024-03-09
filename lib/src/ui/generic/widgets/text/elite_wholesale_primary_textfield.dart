import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';
import '../../exports/constants_exports.dart'
    show Decorations, FontSizes, ThemeColors;
import '../../exports/widget_exports.dart' show InkWellWrapper;

class EliteWholesalePrimaryTextField extends StatefulWidget {
  const EliteWholesalePrimaryTextField({
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.keyboadType,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.isPasswordField = false,
    this.showFieldShadow = false,
    this.isDescriptionField = false,
    this.isDirectionality = true,
    required this.hintText,
    this.needsTranslation = true,
    this.controller,
    this.onTap,
    this.readOnly,
    this.customPadding,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  final TextEditingController? controller;
  final IconData? prefixIcon, suffixIcon;
  final bool isPasswordField, showFieldShadow;
  final VoidCallback? onEditingComplete, onTap, suffixIconOnTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboadType;
  final bool isDescriptionField;
  final bool? readOnly;
  final bool isDirectionality;
  final EdgeInsets? customPadding;
  final TextCapitalization textCapitalization;
  final String hintText;
  final bool needsTranslation;

  @override
  State<EliteWholesalePrimaryTextField> createState() =>
      _EliteWholesalePrimaryTextFieldState();
}

class _EliteWholesalePrimaryTextFieldState
    extends State<EliteWholesalePrimaryTextField> {
  bool isOnChangedEnabled = false;

  bool isVisible = false;

  bool _getObscureText() {
    if (widget.isPasswordField) {
      if (isVisible) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Widget? _getSuffixIcon() {
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      if (widget.isPasswordField) {
        return InkWellWrapper(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Container(
              width: Decorations.kFieldIconWidth,
              height: Decorations.kFieldIconHeight,
              padding: const EdgeInsets.symmetric(
                vertical: Decorations.kFieldIconVerticalPadding - 3,
                horizontal: Decorations.kFieldIconHorizontalPadding,
              ),
              child: Icon(
                isVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: ThemeColors.kThemeColor,
                size: Decorations.kFieldIconHeight + 2,
              )),
        );
      }

      if (widget.suffixIcon != null) {
        return InkWellWrapper(
          onTap: widget.suffixIconOnTap ??
              () {
                widget.controller!.clear();
                setState(() {});
              },
          child: Icon(
            widget.prefixIcon,
            size: Decorations.kFieldIconHeight,
            color: ThemeColors.kFontHintColor,
          ),
          // Container(
          //   width: Decorations.kFieldIconWidth,
          //   height: Decorations.kFieldIconHeight,
          //   padding: const EdgeInsets.symmetric(
          //     vertical: Decorations.kFieldIconVerticalPadding - 3,
          //     horizontal: Decorations.kFieldIconHorizontalPadding,
          //   ),
          //   child: SvgPicture.asset(
          //     widget.suffixIconImage!,
          //   ),
          // ),
        );
      }
    }

    return null;
  }

  bool _getReadOnly() {
    if (widget.readOnly != null && widget.readOnly!) {
      return true;
    }
    if (widget.onTap != null) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: (widget.isDirectionality &&
              TranslationBlocHelper.isSelectedLanguageRtl())
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: widget.showFieldShadow ? Decorations.kItemBoxShadow : null,
          borderRadius: BorderRadius.circular(
            Decorations.kWideButtonBorderRadius,
          ),
        ),
        child: TextFormField(
          obscureText: _getObscureText(),
          textCapitalization: widget.textCapitalization,
          controller: widget.controller,
          style: FontSizes.size14Light(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: _getSuffixIcon(),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: Decorations.kFieldIconHeight,
                    color: ThemeColors.kFontHintColor,
                  )
                : null,
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
                  vertical: Decorations.kTextFieldVerticalContentPadding,
                  horizontal: 20,
                ),
            enabledBorder: Decorations.fieldOutlineBorder,
            focusedBorder: Decorations.fieldOutlineBorder,
            errorBorder: Decorations.fieldOutlineBorder,
            focusedErrorBorder: Decorations.fieldOutlineBorder,
            disabledBorder: Decorations.fieldOutlineBorder,
            errorStyle: FontSizes.size14Light(
              color: ThemeColors.kErrorRedColor,
            ),
          ),
          onTap: widget.onTap,
          readOnly: _getReadOnly(),
          validator: widget.validator != null
              ? (val) {
                  setState(() {
                    isOnChangedEnabled = true;
                  });
                  return widget.validator!(val);
                }
              : null,
          onChanged: (value) {
            setState(() {});

            if (isOnChangedEnabled) {
              widget.onChanged!(value);
            }
          },
          onEditingComplete: widget.onEditingComplete,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboadType,
          cursorColor: ThemeColors.kThemeColor,
          minLines: widget.isDescriptionField ? 6 : null,
          maxLines: widget.isDescriptionField ? null : 1,
        ),
      ),
    );
  }
}
