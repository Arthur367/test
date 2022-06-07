import 'package:flutter/material.dart';

import 'pallete.dart';

class AppTheme {
  // light theme
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Palette.kPrimaryColor,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Palette.kPrimaryColor),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Palette.kToLight,
      ).copyWith(
        secondary: Palette.kAccentColor,
      ),
    );
  }

  // support for darktheme is available
  static ThemeData dark() {
    return ThemeData(
      primaryColor: Palette.kPrimaryColor,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Palette.kPrimaryColor),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Palette.kToDark,
        brightness: Brightness.dark,
      ).copyWith(
        secondary: Palette.kAccentColor,
      ),
    );
  }
}
