import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF0E3A99),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF1C1C1C),
      onSecondary: Color(0xFF686868),
      error: Color(0xFFFF3232),
      onError: Color(0xFFF0F0F0),
      surface: Color(0xFFF4F7FF),
      onSurface: Color(0xFFB9B9B9),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF457AED),
      onPrimary: Color(0xFF001440),
      secondary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFD6D6D6),
      error: Color(0xFFFF3232),
      onError: Color(0xFF002D8F),
      surface: Color(0xFF000F30),
      onSurface: Color(0xFFB9B9B9),
    ),
  );
}
