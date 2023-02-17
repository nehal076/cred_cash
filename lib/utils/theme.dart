import 'package:cred/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryColor = 0xFF191A19;
  static const int _textColor = 0xFF6B7280;
  static MaterialColor primarySwatchDark = const MaterialColor(
    _primaryColor,
    {
      50: Color(0xFF191A19),
      100: Color(0xFF191A19),
      200: Color(0xFF191A19),
      300: Color(0xFF191A19),
      400: Color(0xFF191A19),
      500: Color(0xFF191A19),
      600: Color(0xFF191A19),
      700: Color(0xFF191A19),
      800: Color(0xFF191A19),
      900: Color(0xFF191A19)
    },
  );
  static const MaterialColor textSwatch =
      MaterialColor(_textColor, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(_textColor),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  });
  static ThemeData darkTheme = ThemeData(
    primarySwatch: primarySwatchDark,
    fontFamily: 'Gilroy',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w300,
      ),
      displayMedium: TextStyle(
        color: AppColors.textColor,
      ),
      displaySmall: TextStyle(
        color: AppColors.textColor,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textColor,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textColor,
      ),
      titleLarge: TextStyle(
        color: AppColors.textColor,
      ),
      titleMedium: TextStyle(
        color: AppColors.textColor,
      ),
      titleSmall: TextStyle(
        color: AppColors.textColor,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        color: AppColors.textColor,
      ),
      bodySmall: TextStyle(
        color: AppColors.textColor,
      ),
      labelSmall: TextStyle(
        color: AppColors.textColor,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        color: Color(0xff586970),
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      surfaceTint: Color(0xFF6750A4),
      onErrorContainer: Color(0xFF410E0B),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFF9DEDC),
      onTertiaryContainer: Color(0xff693F00),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xffFFF4E3),
      tertiary: Color(0xffA6A6A6),
      shadow: Color(0xFF000000),
      error: Color(0xFFB3261E),
      outline: Color(0xFF79747E),
      onBackground: Color(0xFF1C1B1F),
      background: Color(0xFFFFFBFE),
      onInverseSurface: Color(0xff00ACA4),
      inverseSurface: Color(0xFF313033),
      onSurfaceVariant: Color(0xFF49454F),
      onSurface: Color(0xFF1C1B1F),
      surfaceVariant: Color(0xFFE7E0EC),
      surface: Color(0xFFFFFBFE),
      onSecondaryContainer: Color(0xFF1D192B),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xfff4f4f4),
      secondary: Color(0xffFE8800),
      inversePrimary: Color(0xFFD0BCFF),
      onPrimaryContainer: Color(0xff1A1A1A),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFFFFF),
      primary: Color(0xFF6750A4),
    ),
  );
}
