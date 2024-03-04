import 'package:intl/intl.dart';

class PriceFormatters {
  PriceFormatters._();

  static String formatToTwoDecimalPlaces(
    double amount,
    String symbol,
  ) {
    final String formattedAmount = NumberFormat.currency(
      decimalDigits: 2,
      symbol: symbol,
    ).format(amount);
    return formattedAmount;
  }
}
