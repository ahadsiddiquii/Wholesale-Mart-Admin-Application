import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/ui/configs/app_config.dart';
import 'src/ui/configs/environment_flavours.dart';
import 'src/ui/configs/local_storage_sqflite/local_storage_sqflite.dart';
import 'src/ui/configs/translation/translations/translations_model/global_translation.dart';
import 'src/ui/configs/translation/translations/translations_model/translation_bloc/translation_bloc.dart';

Future<void> main() async {
  //Settings
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Local Database Setup
  await LocalStorageSqfLite.initDatabase();

  //Appconfig initialization
  AppConfig.init(
    environment: EnvironmentFlavours.staging,
    appVersionToShow: '0.0.1',
  );

  //Language initialization
  final List<String> supportedLanguages = [
    'en',
    'es',
    'gu',
    'hi',
    'ur',
  ];
  final List<String> rtlLanguages = [
    'ur',
  ];
  final Map<String, String> supportedLanguagesMapOfNames = {
    'en': 'English',
    'es': 'Español / Spanish',
    'gu': 'ગુજરાતી / Gujarati',
    'hi': 'हिंदी / Hindi',
    'ur': 'اردو / Urdu',
  };
  await translations.init(
    supportedLanguages,
    supportedLanguagesMapOfNames: supportedLanguagesMapOfNames,
    fallbackLanguage: 'en',
    rtlLanguages: rtlLanguages,
  );

  runApp(
    BlocProvider(
      create: (context) => TranslationBloc(
        TranslationState(
          locale: translations.locale,
        ),
      ),
      child: const App(),
    ),
  );
}
