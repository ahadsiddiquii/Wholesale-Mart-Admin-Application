import 'package:flutter/material.dart';

class DatePickers {
  DatePickers._();
  static Future<DateTime?> selectExpiryDate(BuildContext context) async {
    DateTime? selectedDate;
    final DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate: currentDate,
      lastDate:
          DateTime(currentDate.year + 10), // Limit to 10 years in the future
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      return selectedDate;
    }
    return null;
  }
}
