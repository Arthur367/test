import 'package:intl/intl.dart';

class StringToIntOrDouble {
  static int? _stringToInt(String number) => int.parse(number);
  static String? _stringFromInt(int number) => number.toString();

  static double? stringToDouble(String number) => double.parse(number);
  static String? _stringFromDouble(double number) => number.toString();
}

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
