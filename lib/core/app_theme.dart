import 'package:flutter/material.dart';

class AppTheme {
  // Antigravity.google style palette
  static const Color bg = Color(0xFF030307);
  static const Color surface = Color(0xFF0C0C14);
  static const Color surfaceLight = Color(0xFF131322);
  static const Color border = Color(0xFF1E1E2F);
  
  // Google Brand Colors (Used as subtle gradients and accents)
  static const Color googleBlue = Color(0xFF4285F4);
  static const Color googleGreen = Color(0xFF34A853);
  static const Color googleRed = Color(0xFFEA4335);
  static const Color googleYellow = Color(0xFFFBBC04);
  
  // Text Colors
  static const Color textPrimary = Color(0xFFE8EAED);
  static const Color textSecondary = Color(0xFF9AA0A6);
  static const Color textMuted = Color(0xFF5F6368);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.dark(
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
      Color(0x22FFFFFF),
      Color(0x05FFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
