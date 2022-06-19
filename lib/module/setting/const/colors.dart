import 'package:flutter/material.dart';
bool isDark = true;
class MyThemes {
  static final lightTheme = ThemeData (
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.green,
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.green,

  );
}