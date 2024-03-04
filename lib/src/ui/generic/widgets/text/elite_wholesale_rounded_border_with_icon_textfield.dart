import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';
import '../../exports/constants_exports.dart'
    show Decorations, FontSizes, ThemeColors;

class EliteWholesaleRoundedWithBorderWithIconTextField extends StatefulWidget {
  const EliteWholesaleRoundedWithBorderWithIconTextField({
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.keyboadType,
    this.inputFormatters,
    this.prefixIconImage,
    this.iconIsNotSvg = false,
    this.overrideOnChange = false,
    this.isMobileField = false,
    this.isPasswordField = false,
    this.needsTranslation = true,
    this.isDescriptionField = false,
    this.isDirectionality = true,
    required this.hintText,
    this.controller,
    this.onTap,
    this.readOnly,
    this.customPadding,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  final TextEditingController? controller;
  final String? prefixIconImage;
  final bool iconIsNotSvg;
  final bool overrideOnChange;
  final bool isPasswordField, needsTranslation;
  final VoidCallback? onEditingComplete, onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboadType;
  final bool isMobileField;
  final bool isDescriptionField;
  final bool? readOnly;
  final bool isDirectionality;
  final EdgeInsets? customPadding;
  final TextCapitalization textCapitalization;

  final String hintText;

  @override
  State<EliteWholesaleRoundedWithBorderWithIconTextField> createState() =>
      _EliteWholesaleRoundedWithBorderWithIconTextFieldState();
}

class _EliteWholesaleRoundedWithBorderWithIconTextFieldState
    extends State<EliteWholesaleRoundedWithBorderWithIconTextField> {
  bool _getReadOnly() {
    if (widget.readOnly != null && widget.readOnly!) {
      return true;
    }
    if (widget.onTap != null) {
      return true;
    }

    return false;
  }

  bool isOnChangedEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: (widget.isDirectionality &&
                  TranslationBlocHelper.isSelectedLanguageRtl())
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: TextFormField(
                  obscureText: widget.isPasswordField,
                  textCapitalization: widget.textCapitalization,
                  controller: widget.controller,
                  style: FontSizes.size14Light(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: widget.prefixIconImage != null
                        ? Container(
                            width: Decorations.kFieldIconWidth + 10,
                            height: Decorations.kFieldIconHeight,
                            padding: const EdgeInsets.symmetric(
                              vertical: Decorations.kFieldIconVerticalPadding,
                              horizontal:
                                  Decorations.kFieldIconHorizontalPadding + 12,
                            ),
                            child: widget.iconIsNotSvg
                                ? Image.asset(
                                    widget.prefixIconImage!,
                                    fit: BoxFit.contain,
                                  )
                                : SvgPicture.asset(
                                    widget.prefixIconImage!,
                                  ),
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
                          vertical:
                              Decorations.kTextFieldVerticalContentPadding,
                          horizontal: 20,
                        ),
                    enabledBorder: Decorations.fieldOutlineBlueBorder,
                    focusedBorder: Decorations.fieldOutlineBlueBorder,
                    errorBorder: Decorations.fieldOutlineBlueBorder,
                    focusedErrorBorder: Decorations.fieldOutlineBlueBorder,
                    disabledBorder: Decorations.fieldOutlineBlueBorder,
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
                  onChanged: (widget.overrideOnChange)
                      ? widget.onChanged
                      : isOnChangedEnabled
                          ? widget.onChanged
                          : null,
                  onEditingComplete: widget.onEditingComplete,
                  onSaved: widget.onSaved,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboadType,
                  cursorColor: ThemeColors.kFontSecondaryBlueColor,
                  minLines: widget.isDescriptionField ? 6 : null,
                  maxLines: widget.isDescriptionField ? 8 : 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
