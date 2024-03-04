import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../router/routes.dart';
import '../translations_model/global_translation.dart';
import '../translations_model/translation_bloc/translation_bloc.dart';

class TranslationBlocHelper {
  TranslationBlocHelper._();

  static void switchLanguage(
    BuildContext context, {
    required String language,
  }) {
    final translationBloc = BlocProvider.of<TranslationBloc>(context);
    translationBloc.add(
      SwitchLanguage(
        language: language,
      ),
    );
    Navigator.popUntil(context, (route) => route.isFirst);
    Future.delayed(const Duration(milliseconds: 40), () {
      Navigator.pushReplacementNamed(
        context,
        CustomRouter.homeScreenRouteName,
      );
    });
  }

  static String getLocalizedText(
    String text, {
    bool needsTranslation = true,
  }) {
    if (needsTranslation) {
      return translations.text(text);
    }
    return text;
  }

  static bool isSelectedLanguageRtl() {
    if (translations.isLeftLanguageByCode(
        languageCode: translations.locale.languageCode)) {
      return true;
    }

    return false;
  }
}
