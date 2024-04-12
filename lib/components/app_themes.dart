import 'package:flutter/material.dart';

/// class qui contient les themes couleur de l'app
class AppThemes {
  /// theme jour
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 15, 5, 67),
      background: const Color.fromARGB(255, 237, 237, 237),
      primary: const Color.fromARGB(255, 2, 45, 88),
      secondary: const Color.fromARGB(255, 255, 255, 255),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 36, 36, 80),
  );

  /// theme nuit
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 15, 5, 67),
      background: const Color.fromARGB(255, 8, 8, 32),
      primary: const Color.fromARGB(255, 255, 255, 255),
      secondary: const Color.fromARGB(255, 255, 255, 255),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 2, 2, 18),
  );
}
