import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData berry() {
    return ThemeData.from(
      colorScheme: const ColorScheme(
        primary: Color(0xff50312F),
        primaryVariant: Color(0xff4d2f2d),
        secondary: Color(0xff3F6C45),
        secondaryVariant: Color(0xff50312F),
        surface: Colors.white,
        background: Color(0xffE4EA8C),
        error: Color(0xffB00020),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData smartModern() {
    return ThemeData.from(
      colorScheme: const ColorScheme(
        primary: Color(0xff2F2E33),
        primaryVariant: Color(0xffd5d6d2),
        secondary: Color(0xff3a5199),
        secondaryVariant: Color(0xff2f4380),
        surface: Colors.white,
        background: Colors.white,
        error: Color(0xffB00020),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData conservative() {
    return ThemeData.from(
      colorScheme: const ColorScheme(
        primary: Color(0xff335252),
        primaryVariant: Color(0xffd5d6d2), //
        secondary: Color(0xffaa4b41),
        secondaryVariant: Color(0xff2f4380), //
        surface: Colors.white,
        background: Color(0xffd4dde1),
        error: Color(0xffB00020),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
    );
  }
}
