import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';

class WmsAutoSizeText extends StatelessWidget {
  const WmsAutoSizeText(this.text,
      {super.key,
      this.style,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.minFontSize = 10,
      this.maxFontSize = 20,
      this.forceStrutHeight = false,
      this.needsTranslation = true,
      this.softWrap});
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final double minFontSize, maxFontSize;
  final TextOverflow? overflow;
  final bool forceStrutHeight;
  final bool needsTranslation;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      TranslationBlocHelper.getLocalizedText(
        text,
        needsTranslation: needsTranslation,
      ),
      maxLines: maxLines,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
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
