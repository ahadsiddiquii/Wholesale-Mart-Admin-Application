// Dart imports:
import 'dart:async';

import '../../../local_storage_sqflite/local_storage_sqflite.dart';
import '../../../local_storage_sqflite/sqflite_model.dart';

Preferences preferences = Preferences();

class Preferences {
  factory Preferences() {
    return _preferences;
  }
  Preferences._internal();

  /// ----------------------------------------------------------
  /// Generic routine to fetch a preference
  /// ----------------------------------------------------------
  Future<String> _getApplicationSavedInformation(String name) async {
    final Data? languageData = await LocalStorageSqfLite.getDataByKey(name);
    if (languageData != null) {
      return languageData.value;
    } else {
      return '';
    }
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves a preference
  /// ----------------------------------------------------------
  Future<void> _setApplicationSavedInformation(
      String name, String value) async {
    await LocalStorageSqfLite.insertData(Data(
      key: name,
      value: value,
    ));
  }

  /// ----------------------------------------------------------
  /// Method that saves/restores the preferred language
  /// ----------------------------------------------------------
  Future<String> getPreferredLanguage() async {
    final String preferredLanguage =
        await _getApplicationSavedInformation('language');
    return preferredLanguage;
  }

  Future<void> setPreferredLanguage(String lang) async {
    await _setApplicationSavedInformation('language', lang);
  }

  // ------------------ SINGLETON -----------------------
  static final Preferences _preferences = Preferences._internal();
}
