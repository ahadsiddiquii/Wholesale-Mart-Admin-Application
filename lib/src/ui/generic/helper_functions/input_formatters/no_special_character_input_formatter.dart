import 'package:flutter/services.dart';

class NoSpecialCharacterInput extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Use a regular expression to filter out any characters that are not digits
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), ''); //remove all special characters
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
