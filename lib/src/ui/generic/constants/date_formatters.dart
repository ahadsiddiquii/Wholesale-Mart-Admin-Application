import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatters {
  DateFormatters._();

  static String convertStringDateToDateTimeIsoString(String date) {
    String dateString = '';
    try {
      dateString = DateTime.parse(date).toIso8601String();
    } catch (e) {
      debugPrint(e.toString());
    }
    return dateString;
  }

  static String formatToDDMMMYYYYhmma(DateTime dateToConvert) {
    final String formattedDate =
        DateFormat('dd-MMM-yyyy, h:mm a').format(dateToConvert);
    return formattedDate;
  }

  static String formatToDDMMM(DateTime dateToConvert) {
    final String formattedDate = DateFormat('dd MMM').format(dateToConvert);
    return formattedDate;
  }

  static String formatToYYYYMMDDWithDashes(DateTime dateToConvert) {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(dateToConvert);
    return formattedDate;
  }

  static String formatToDDMMMMYYYY(DateTime dateToConvert) {
    final String formattedDate =
        DateFormat('dd MMMM yyyy').format(dateToConvert);
    return formattedDate;
  }

  static String formatToDDMMMMYYYYWithSlashes(DateTime dateToConvert) {
    final String formattedDate =
        DateFormat('dd/MMMM/yyyy').format(dateToConvert);
    return formattedDate;
  }

  static String formatToDDMMMYYYYWithSlashes(DateTime dateToConvert) {
    final String formattedDate =
        DateFormat('dd/MMM/yyyy').format(dateToConvert);
    return formattedDate;
  }

  static String formatToDDMMYYYYWithSlashes(DateTime dateToConvert) {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(dateToConvert);
    return formattedDate;
  }

  static String formatToMMYYWithSlashes(DateTime dateToConvert) {
    final String formattedDate = DateFormat('MM/yy').format(dateToConvert);
    return formattedDate;
  }

  static String secondsToMinSec(int seconds) {
    final int minutes = (seconds % 3600) ~/ 60;
    final int remainingSeconds = seconds % 60;

    final String formattedTime =
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  static String secondsToHrsMinSec(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int remainingSeconds = seconds % 60;

    final String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}
