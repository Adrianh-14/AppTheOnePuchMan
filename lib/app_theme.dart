import 'package:flutter/material.dart';

class AppTheme {
  static const Color midnightCanvas = Color(0xFF040714);
  static const Color abyss = Color(0xFF010104);
  static const Color eclipse = Color(0xFF0E0B14);
  static const Color carbon = Color(0xFF1E1F24);
  static const Color slateVeil = Color(0xFF282A36);
  static const Color luminous = Color(0xFFFAFAFA);
  static const Color pearl = Color(0xFFE5E7EB);
  static const Color mist = Color(0xFFB7B8BD);
  static const Color fog = Color(0xFFC0C0C0);
  static const Color deepInk = Color(0xFF02172A);
  static const Color electricCyan = Color(0xFF33DDFF);
  static const Color tealPulse = Color(0xFF02D6E8);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: midnightCanvas,
      primaryColor: electricCyan,
      colorScheme: const ColorScheme.dark(
        surface: midnightCanvas,
        primary: electricCyan,
        secondary: tealPulse,
        onSurface: luminous,
      ),
      fontFamily: null,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          height: 1.2,
          color: luminous,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.7,
          height: 1.2,
          color: luminous,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          height: 1.4,
          color: luminous,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.45,
          height: 1.4,
          color: luminous,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.5,
          color: luminous,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.35,
          height: 1.5,
          color: mist,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3,
          height: 1.38,
          color: fog,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
          height: 1.5,
          color: deepInk,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: abyss,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.45,
          height: 1.4,
          color: luminous,
        ),
        iconTheme: IconThemeData(color: luminous),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: abyss,
        selectedItemColor: electricCyan,
        unselectedItemColor: mist,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3,
        ),
      ),
      cardTheme: CardThemeData(
        color: carbon,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: pearl.withValues(alpha: 0.08)),
        ),
      ),
    );
  }
}
