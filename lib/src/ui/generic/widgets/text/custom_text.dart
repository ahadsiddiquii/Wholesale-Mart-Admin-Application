// Flutter imports:
import 'package:flutter/material.dart';

import '../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.forceStrutHeight = false,
    this.needsTranslation = true,
    this.softWrap,
  });
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool forceStrutHeight;
  final bool needsTranslation;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      TranslationBlocHelper.getLocalizedText(
        text,
        needsTranslation: needsTranslation,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      strutStyle: StrutStyle(
        forceStrutHeight: forceStrutHeight && needsTranslation,
      ),
      style: style,
      softWrap: softWrap,
    );
  }
}
