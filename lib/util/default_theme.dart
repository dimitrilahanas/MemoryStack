import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light, 
      primary: Color(0xFF0a0a0a), 
      onPrimary: Color(0xFF252525), 
      secondary: Colors.white, 
      onSecondary: Color(0xFFE7E7E7), 
      error: Colors.red, 
      onError: Colors.yellow, 
      surface: Color(0xFFf5f5f5), 
      onSurface: Colors.white
    )
  );

  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark, 
      primary: Color(0xFFf0f0f0), 
      onPrimary: Color(0xFF1f1f1f), 
      secondary: Color(0xFF1a1a1a), 
      onSecondary: Color(0xFF1f1f1f), 
      error: Colors.red, 
      onError: Colors.yellow, 
      surface: Color(0xFF1f1f1f), 
      onSurface: Colors.black
    )
  );
}