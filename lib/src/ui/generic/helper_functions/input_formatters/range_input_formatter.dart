import 'package:flutter/services.dart';

class RangeTextInputFormatter extends TextInputFormatter {
  RangeTextInputFormatter({required this.min, required this.max});
  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int enteredValue = int.tryParse(newValue.text) ?? 0;
    if (enteredValue < min) {
      return TextEditingValue(
        text: min.toString(),
        selection: TextSelection.collapsed(offset: min.toString().length),
      );
    } else if (enteredValue > max) {
      return TextEditingValue(
        text: max.toString(),
        selection: TextSelection.collapsed(offset: max.toString().length),
      );
    }
    return newValue;
  }
}
