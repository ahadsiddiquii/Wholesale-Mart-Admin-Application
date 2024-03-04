import 'package:flutter/services.dart';

import '../../configs/translation/translations/translations_view_model/translation_bloc_helper.dart';
import 'input_formatters/no_special_character_input_formatter.dart';

class FieldValidator {
  FieldValidator._();

  static RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');

  //Email
  static List<TextInputFormatter> emailInputFormatter() {
    return [
      FilteringTextInputFormatter.deny(RegExp(r'\s')),
      LengthLimitingTextInputFormatter(50),
    ];
  }

  static String? emailFieldValidator(
    String val,
  ) {
    // final bool emailValid = RegExp(
    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //     .hasMatch(val);
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText(
          'Please enter your username or email'
          // OnboardingScreensText.PLEASEENTERYOURUSERNAMEOREMAIL
          );
    }

    if (val.length < 4) {
      return TranslationBlocHelper.getLocalizedText(
          'Please enter a valid username or email'
          // OnboardingScreensText.PLEASEENTERAVALIDUSERNAMEOREMAILADDRESS,
          );
    }

    return null;
  }

  //Password Login
  static String? passwordFieldSigninValidator(String val) {
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText('Please enter your password'
          // OnboardingScreensText.PLEASEENTERYOURPASSWORD
          );
    }

    return null;
  }

  //Password Register
  static String? passwordFieldSignUpValidator(String val) {
    final bool passwordValid = passwordRegExp.hasMatch(val);
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText(
        'Please enter your password',
        // OnboardingScreensText.PLEASEENTERYOURPASSWORD
      );
    }

    if (!passwordValid) {
      return 'Please enter a valid password';
      // OnboardingScreensText.PLEASEENTERAVALIDPASSWORD;
      // return TranslationBlocHelper.getLocalizedText(
      //     OnboardingScreensText.PLEASEENTERAVALIDPASSWORD);
    }

    return null;
  }

  //Password Re-enter
  static String? passwordFieldSignUpReEnterValidator(
    String val,
    String oldPassword,
  ) {
    final bool passwordValid = passwordRegExp.hasMatch(val);
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText(
        'Please enter your password',
        // OnboardingScreensText.PLEASEENTERYOURPASSWORD
      );
    }

    if (val != oldPassword) {
      return 'Password does not match';
      // OnboardingScreensText.PASSWORDSDOESNOTMATCH;
    }

    if (!passwordValid) {
      return 'Please enter a valid password';
      // OnboardingScreensText.PLEASEENTERAVALIDPASSWORD;
      // return TranslationBlocHelper.getLocalizedText(
      //     OnboardingScreensText.PLEASEENTERAVALIDPASSWORD);
    }

    return null;
  }

  //password conditional validator

  static String? passwordFieldConditionalValidator(String val) {
    if (val.isEmpty) {
      return null;
    }
    final bool passwordValid = passwordRegExp.hasMatch(val);

    if (!passwordValid) {
      return 'Please enter a valid password';
      // OnboardingScreensText.PLEASEENTERAVALIDPASSWORD;
      // return TranslationBlocHelper.getLocalizedText(
      //     OnboardingScreensText.PLEASEENTERAVALIDPASSWORD);
    }

    return null;
  }

  //STORE NAME
  static List<LengthLimitingTextInputFormatter> storeNameInputFormatter() {
    return [LengthLimitingTextInputFormatter(25)];
  }

  static String? storeNameValidator(String val) {
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText(
          'Please enter your store name'
          // OnboardingScreensText.PLEASEENTERYOURSTORENAME
          );
    }

    return null;
  }

  static String? genericTextValidator(String val, String errorMessage) {
    if (val.isEmpty) {
      return errorMessage;
    }

    return null;
  }

  // FIRST NAME AND LAST NAME
  static List<LengthLimitingTextInputFormatter> nameInputFormatter() {
    return [LengthLimitingTextInputFormatter(25)];
  }

  //Zip
  static List<LengthLimitingTextInputFormatter> zipInputFormatter() {
    return [LengthLimitingTextInputFormatter(11)];
  }

  //State
  static List<LengthLimitingTextInputFormatter> stateInputFormatter() {
    return [LengthLimitingTextInputFormatter(2)];
  }

  static String? firstNameValidator(String val) {
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText(
        'Please enter your first name',
        // OnboardingScreensText.PLEASEENTERYOURFIRSTNAME
      );
    }

    return null;
  }

  static String? lastNameValidator(String val) {
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText(
        'Please enter your last name',
        // OnboardingScreensText.PLEASEENTERYOURLASTNAME
      );
    }

    return null;
  }

  static String? productDetailsValidator(String val) {
    if (val.isEmpty) {
      return TranslationBlocHelper.getLocalizedText(
        // OnboardingScreensText.PLEASEENTERPRODUCTDETAILS,
        'Please enter product details',
      );
    }

    return null;
  }

  //Otp
  static List<TextInputFormatter> otpInputFormatter() {
    return [
      LengthLimitingTextInputFormatter(4),
      FilteringTextInputFormatter.allow(
        RegExp(r'^\d+(?:\d+)?$'),
      ),
    ];
  }

  //Phone Number
  static List<TextInputFormatter> phoneNumberFormatter() {
    return [
      LengthLimitingTextInputFormatter(10),
      NoSpecialCharacterInput(),
    ];
  }

  static String? phoneNumberValidator(
    String val, {
    String? errorMessage,
  }) {
    if (val.isEmpty || val.length < 7) {
      //Todo: Add translation when needed
      return errorMessage ?? 'Please enter a valid phone number';
      // OnboardingScreensText.PLEASEENTERAVALIDPHONENUMBER;
    }

    return null;
  }

  //Cvv input formatter
  static List<LengthLimitingTextInputFormatter> cvvInputFormatter() {
    return [LengthLimitingTextInputFormatter(3)];
  }

  //Item Details formatter
  static List<TextInputFormatter> itemValueInputFormatter({
    int lengthToLimit = 8,
  }) {
    return [
      FilteringTextInputFormatter.allow(RegExp('[0-9\u0660-\u0669]')),
      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
      LengthLimitingTextInputFormatter(
        lengthToLimit,
      ),
      FilteringTextInputFormatter.digitsOnly
    ];
  }

  //Text limiter

  static String getLimitedText(
    String text,
    int maxLength,
  ) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength - 1)}...';
    }
  }
}
