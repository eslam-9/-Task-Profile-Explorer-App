import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorManager {
  ColorManager._();

  static const Color primary = Color(0xFF0A84FF);
  static const Color background = Color(0xFFF5F6FA);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color heartRed = Color(0xFFFF2D55);
  static const Color outline = Color(0xFFE5E7EB);

  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Gotham',
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: primary,
        surface: surface,
        background: background,
      ),
      scaffoldBackgroundColor: background,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: background,
        foregroundColor: textPrimary,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
      ),
    );
  }
}
