class StringToIntOrDouble {
  static int? _stringToInt(String number) => int.parse(number);
  static String? _stringFromInt(int number) => number.toString();

  static double? stringToDouble(String number) => double.parse(number);
  static String? _stringFromDouble(double number) => number.toString();
}
