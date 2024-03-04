// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'language_preference.dart';

const String _kDefaultLanguage = 'en';
String _kFallbackLanguage = 'en';

class GlobalTranslations {
  factory GlobalTranslations() {
    return _translations;
  }
  GlobalTranslations._internal();
  Locale? _locale;
  Map<dynamic, dynamic>? _localizedValues;
  Map<dynamic, dynamic>? _fallbackValues;
  Map<String, String> _cache = {};
  List<String> _supportedLanguages = [];
  Map<String, String> _supportedLanguagesMapOfNames = {};
  List<String> _leftLanguages = [];

  ///
  /// Returns the list of supported locales
  ///
  Iterable<Locale> supportedLocales() =>
      _supportedLanguages.map<Locale>((lang) => Locale(lang, ''));

  List<String> getAllSupportedLanguages() {
    return _supportedLanguages;
  }

  List<String> getAllSupportedLanguageFullNames() {
    final List<String> supportedLanguageNames = [];
    _supportedLanguagesMapOfNames
        .forEach((key, value) => supportedLanguageNames.add(value));
    return supportedLanguageNames;
  }

  bool isLeftLanguage({required String languageName}) {
    bool foundLeftLanguage = false;
    _supportedLanguagesMapOfNames.forEach((key, value) {
      if (value == languageName && _leftLanguages.contains(key)) {
        foundLeftLanguage = true;
      }
    });
    return foundLeftLanguage;
  }

  bool isLeftLanguageByCode({required String languageCode}) {
    bool foundLeftLanguage = false;
    _supportedLanguagesMapOfNames.forEach((key, value) {
      if (key == languageCode && _leftLanguages.contains(key)) {
        foundLeftLanguage = true;
      }
    });
    return foundLeftLanguage;
  }

  bool isSelected({required String languageName}) {
    bool isSelected = false;
    _supportedLanguagesMapOfNames.forEach((key, value) {
      if (value == languageName && _locale!.languageCode == key) {
        isSelected = true;
      }
    });
    return isSelected;
  }

  String getLocationCodeByName({required String languageName}) {
    String locationCode = ' ';
    _supportedLanguagesMapOfNames.forEach((key, value) {
      if (value == languageName) {
        locationCode = key;
      }
    });
    return locationCode;
  }

  ///
  /// Return the translation that corresponds to the [key]
  ///
  /// The [key] might be a sequence of [key].[sub-key].[sub-key]
  ///
  String text(String key, {Map<String, String>? params}) {
    // Return the requested string
    String value = '** $key not found';

    if (_localizedValues != null) {
      // Get the translated string
      final String? translatedString =
          _getLocalizedValue(key, _localizedValues!);
      if (translatedString != null) {
        value = translatedString;
      }

      //check if the translation was not found,
      ///In that case look the translation in the fallback language
      if (value == '** $key not found') {
        if (_fallbackValues != null) {
          final String? fallbackTranslatedString =
              _getLocalizedValue(key, _fallbackValues!);
          if (fallbackTranslatedString != null) {
            value = fallbackTranslatedString;
          }
        }
      }
    }
    if (params != null) {
      /// If parametes is not null then replace all these params in the string
      value = mapParamsToTranslatedString(value, params);
    }
    // return value;
    return (value == '** $key not found') ? key : value;
  }

  String mapParamsToTranslatedString(String value, Map<String, String> params) {
    params.forEach((key, value1) {
      value = value.replaceAll('{{$key}}', value1);
    });
    return value;
  }

  String? _getLocalizedValue(String key, Map<dynamic, dynamic> values) {
    // Return the requested string
    String string = '** $key not found';

    // Check if the requested [key] is in the cache
    if (_cache[key] != null) {
      return _cache[key];
    }

    // Iterate the key until found or not
    bool found = true;
    final List<String> keyParts = key.split('.');
    final int keyPartsLen = keyParts.length;
    int index = 0;
    final int lastIndex = keyPartsLen - 1;

    while (index < keyPartsLen && found) {
      final value = values[keyParts[index]];

      if (value == null) {
        // Not found => STOP
        found = false;
        break;
      }

      // Check if we found the requested key
      if (value is String && index == lastIndex) {
        string = value;

        // Add to cache
        _cache[key] = string;
        break;
      }

      // go to next subKey
      values = value;
      index++;
    }
    return string;
  }

  String get currentLanguage => _locale == null ? '' : _locale!.languageCode;
  Locale get locale => _locale!;

  ///
  /// One-time initialization
  /// ["en", "fr", "hi", "zh", "ru"]
  ///
  Future<void> init(
    List<String>? supportedLanguages, {
    Map<String, String>? supportedLanguagesMapOfNames,
    String? fallbackLanguage,
    List<String>? rtlLanguages,
  }) async {
    if (supportedLanguages == null) {
      throw Exception('You must provide supported languages');
    }
    _supportedLanguages = supportedLanguages;
    if (supportedLanguagesMapOfNames == null) {
      throw Exception('You must provide full supported language names');
    }
    if (rtlLanguages != null) {
      _leftLanguages = rtlLanguages;
    }
    _supportedLanguagesMapOfNames = supportedLanguagesMapOfNames;
    if (fallbackLanguage != null &&
        _supportedLanguages.contains(fallbackLanguage)) {
      _kFallbackLanguage = fallbackLanguage;
      // Load the fallback language strings
      try {
        final String jsonContent = await rootBundle
            .loadString('assets/locale/locale_$_kFallbackLanguage.json');
        _fallbackValues = json.decode(jsonContent);
      } catch (e) {
        debugPrint('Unable to load fallback json $e');
      }
    }
    if (_locale == null) {
      await setNewLanguage();
    }
    return;
  }

  ///
  /// Routine to change the language
  ///
  Future<void> setNewLanguage([String? newLanguage]) async {
    String? language = newLanguage;
    language ??= await preferences.getPreferredLanguage();

    // If not in the preferences, get the current locale (as defined at the device settings level)
    if (language == '') {
      final String currentLocale = Platform.localeName.toLowerCase();
      if (currentLocale.length > 2) {
        if (currentLocale[2] == '-' || currentLocale[2] == '_') {
          language = currentLocale.substring(0, 2);
        }
      }
    }

    // Check if we are supporting the language
    // if not consider the default one
    if (!_supportedLanguages.contains(language)) {
      language = _kDefaultLanguage;
    }

    // Set the Locale
    _locale = Locale(language, '');

    // Load the language strings
    // String jsonContent = await rootBundle
    //     .loadString("assets/locale/locale_${_locale!.languageCode}.json");
    final String jsonContent = await rootBundle
        .loadString('assets/locale/intl_${_locale!.languageCode}.json');
    _localizedValues = json.decode(jsonContent);

    // Clear the cache
    _cache = {};

    return;
  }

  /// ==========================================================
  /// Singleton Factory
  ///
  static final GlobalTranslations _translations =
      GlobalTranslations._internal();
}

GlobalTranslations translations = GlobalTranslations();
