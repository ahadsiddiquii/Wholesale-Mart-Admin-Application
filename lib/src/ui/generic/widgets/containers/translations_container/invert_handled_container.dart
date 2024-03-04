import 'package:flutter/material.dart';

import '../../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';

class InvertHandledContainer extends StatelessWidget {
  const InvertHandledContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: TranslationBlocHelper.isSelectedLanguageRtl() ? 2 : 0,
      child: child,
    );
  }
}
