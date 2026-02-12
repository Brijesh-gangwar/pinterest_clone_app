import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // ---------- COLORS ----------
  static const Color scaffoldBg = Colors.black;
  static const Color primaryRed = Colors.red;
  static const Color textWhite = Colors.white;

  // ---------- TEXT SIZES ----------
  static const double appBarTitleSize = 20;
  static const double headingSize = 26;
  static const double bodySize = 16;
  static const double smallTextSize = 13;
  static const double buttonTextSize = 18;

  // ---------- RADIUS ----------
  static const double radiusLarge = 30;
  static const double radiusMedium = 15;

  // ---------- PADDING ----------
  static const EdgeInsets screenPadding =
      EdgeInsets.symmetric(horizontal: 24);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: scaffoldBg,

    // ---------- APP BAR ----------
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: textWhite,
        fontSize: appBarTitleSize,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: textWhite),
    ),

    // ---------- TEXT THEME ----------
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: headingSize,
        fontWeight: FontWeight.bold,
        color: textWhite,
      ),
      bodyLarge: TextStyle(
        fontSize: bodySize,
        color: textWhite,
      ),
      bodySmall: TextStyle(
        fontSize: smallTextSize,
        color: Colors.white70,
      ),
      labelLarge: TextStyle(
        fontSize: buttonTextSize,
        fontWeight: FontWeight.bold,
        color: textWhite,
      ),
    ),

    // ---------- BUTTON THEME ----------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLarge),
        ),
        minimumSize: const Size(double.infinity, 55),
        textStyle: const TextStyle(
          fontSize: buttonTextSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // ---------- INPUT THEME ----------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade900,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusMedium),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Colors.white38),
      labelStyle: const TextStyle(color: Colors.white70),
    ),
  );
}
