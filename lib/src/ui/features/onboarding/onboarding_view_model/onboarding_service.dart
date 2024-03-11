import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/local_storage_sqflite/local_storage_sqflite.dart';
import '../../../configs/local_storage_sqflite/sqflite_model.dart';
import '../onboarding_model/bloc/onboarding_bloc.dart';

class OnboardingService {
  OnboardingService._();

  //Login User
  static void checkIfLoggedIn(
    BuildContext context,
  ) {
    _CheckIfLoggedInService.

    // BlocProvider.of<OnboardingBloc>(context).add(
    //   CheckIfLoggedIn(
    //     userName: userName,
    //     password: userPassword,
    //   ),
    // );
  }

  //Login User
  static void loginUser(
    BuildContext context, {
    required String userName,
    required String userPassword,
  }) {
    BlocProvider.of<OnboardingBloc>(context).add(
      SignInUser(
        userName: userName,
        password: userPassword,
      ),
    );
  }
}

class _CheckIfLoggedInService {
  _CheckIfLoggedInService._();

  static const String _storageKey = 'CheckIfLoggedIn';
  static const String userNameKey = 'userName';
  static const String passwordKey = 'password';

  static Future<Map<String, dynamic>?> getUserData() async {
    final Data? userData = await LocalStorageSqfLite.getDataByKey(
      _storageKey,
    );
    Map<String, dynamic>? data;
    if (userData != null) {
      data = jsonDecode(
        userData.value,
      );
    }
    return data;
  }

  static void saveUserCredentials(
    String userName,
    String password,
  ) {
    LocalStorageSqfLite.insertData(
      Data(
        key: _storageKey,
        value: jsonEncode(
          {
            userNameKey: userName,
            passwordKey: password,
          },
        ),
      ),
    );
  }

  static void deleteRememberMeData() {
    LocalStorageSqfLite.deleteData(
      _storageKey,
    );
  }
}
