import 'package:flutter/material.dart';

class AppTheme {
  // Antigravity.google style palette (Light Theme)
  static const Color bg = Color(0xFFFAFAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF1F3F4);
  static const Color border = Color(0xFFE8EAED);
  
  // Google Brand Colors (Used as subtle gradients and accents)
  static const Color googleBlue = Color(0xFF4285F4);
  static const Color googleGreen = Color(0xFF34A853);
  static const Color googleRed = Color(0xFFEA4335);
  static const Color googleYellow = Color(0xFFFBBC04);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color textMuted = Color(0xFF70757A);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.light(
        primary: googleBlue,
        secondary: googleGreen,
        surface: surface,
        onSurface: textPrimary,
      ),
      fontFamily: 'Google Sans Flex',
      fontFamilyFallback: const ['sans-serif'],
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.w700, letterSpacing: -1.0),
        displayMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w600, letterSpacing: -0.5),
        displaySmall: TextStyle(color: textPrimary, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w500),
        titleLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(color: textSecondary, height: 1.6),
        bodyMedium: TextStyle(color: textSecondary, height: 1.5),
      ),
      useMaterial3: true,
    );
  }

  // Linear gradients for background or cards
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [googleBlue, googleGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [googleRed, googleYellow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient borderGradient = LinearGradient(
    colors: [
      Color(0x1F000000),
      Color(0x0A000000),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
