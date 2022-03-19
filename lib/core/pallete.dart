// Pallete created from https://maketintsandshades.com/
// use primary color as the base color

import 'package:flutter/material.dart';

class Palette {
  static const Color kPrimaryColor = Color(0xff344c6b);
  static const Color kAccentColor = Color(0xff344c6b);

  // for dark theme swatch
  static const MaterialColor kToDark = MaterialColor(
    0xff344c6b, // 0% comes here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff2f4460), //10%
      100: Color(0xff2a3d56), //20%
      200: Color(0xff24354b), //30%
      300: Color(0xff1f2e40), //40%
      400: Color(0xff1a2636), //50%
      500: Color(0xff151e2b), //60%
      600: Color(0xff101720), //70%
      700: Color(0xff0a0f15), //80%
      800: Color(0xff05080b), //90%
      900: Color(0xff000000), //100%
    },
  );

  //for light theme swatch
  static const MaterialColor kToLight = MaterialColor(
    0xff344c6b, // 0% comes here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff485e7a), //10%
      100: Color(0xff5d7089), //20%
      200: Color(0xff718297), //30%
      300: Color(0xff8594a6), //40%
      400: Color(0xff9aa6b5), //50%
      500: Color(0xffaeb7c4), //60%
      600: Color(0xffc2c9d3), //70%
      700: Color(0xffd6dbe1), //80%
      800: Color(0xffebedf0), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
