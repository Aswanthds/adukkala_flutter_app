import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: const MaterialColor(0xFFFF6B6B, {
        50: Color(0xFFFFEBEB),
        100: Color(0xFFFFCCCC),
        200: Color(0xFFFFAAAA),
        300: Color(0xFFFF8888),
        400: Color(0xFFFF7777),
        500: Color(0xFFFF6B6B),
        600: Color(0xFFEE5A5A),
        700: Color(0xFFDD4444),
        800: Color(0xFFCC3333),
        900: Color(0xFFBB1111),
      }),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFFFF6B6B),
        secondary: const Color(0xFFEE5A24),
        surface: const Color(0xFFF8F9FA),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
        displayMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color(0xFF333333),
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF333333),
        ),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF333333)),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF666666)),
        bodySmall: TextStyle(fontSize: 12, color: Color(0xFF888888)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B6B),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 3,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFF6B6B),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
