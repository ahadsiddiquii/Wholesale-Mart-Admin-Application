import 'package:flutter/material.dart';

import '../../../../configs/translation/translations/translations_model/global_translation.dart';
import '../../../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';
import '../../../../generic/exports/constants_exports.dart' show Decorations;
import '../../../../generic/exports/widget_exports.dart'
    show CustomAppbar, EliteWholesaleCustomDivider;
import '../language_screens_text.dart';
import '../language_widgets/language_tile.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: LanguageScreensText.CHANGELANGUAGE,
      ),
      body: Container(
        margin: Decorations.kBorderMargin,
        child: ListView.separated(
            itemCount: translations.getAllSupportedLanguageFullNames().length,
            separatorBuilder: (context, index) {
              return const EliteWholesaleCustomDivider();
            },
            itemBuilder: (context, index) {
              final String languageName =
                  translations.getAllSupportedLanguageFullNames()[index];
              return LanguageTile(
                title: languageName,
                isSelected: translations.isSelected(
                  languageName: languageName,
                ),
                onTap: () {
                  TranslationBlocHelper.switchLanguage(
                    context,
                    language: translations.getLocationCodeByName(
                      languageName: languageName,
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
