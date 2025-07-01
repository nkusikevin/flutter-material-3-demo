import 'package:flutter/material.dart';

/// Typography tokens following Material 3 type scale
class AppTypography {
  // Font family
  static const String fontFamily = 'Roboto';

  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Line heights (expressed as multipliers)
  static const double tightLineHeight = 1.2;
  static const double normalLineHeight = 1.4;
  static const double relaxedLineHeight = 1.6;

  // Letter spacing
  static const double tightLetterSpacing = -0.5;
  static const double normalLetterSpacing = 0.0;
  static const double wideLetterSpacing = 0.5;

  // Material 3 Type Scale - Display
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 57.0,
    fontWeight: regular,
    height: tightLineHeight,
    letterSpacing: tightLetterSpacing,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 45.0,
    fontWeight: regular,
    height: tightLineHeight,
    letterSpacing: normalLetterSpacing,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36.0,
    fontWeight: regular,
    height: normalLineHeight,
    letterSpacing: normalLetterSpacing,
  );

  // Headlines
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.0,
    fontWeight: regular,
    height: normalLineHeight,
    letterSpacing: normalLetterSpacing,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.0,
    fontWeight: regular,
    height: normalLineHeight,
    letterSpacing: normalLetterSpacing,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: regular,
    height: normalLineHeight,
    letterSpacing: normalLetterSpacing,
  );

  // Titles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22.0,
    fontWeight: regular,
    height: normalLineHeight,
    letterSpacing: normalLetterSpacing,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: medium,
    height: normalLineHeight,
    letterSpacing: wideLetterSpacing,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: medium,
    height: normalLineHeight,
    letterSpacing: wideLetterSpacing,
  );

  // Labels
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: medium,
    height: normalLineHeight,
    letterSpacing: wideLetterSpacing,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: medium,
    height: normalLineHeight,
    letterSpacing: wideLetterSpacing,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11.0,
    fontWeight: medium,
    height: normalLineHeight,
    letterSpacing: wideLetterSpacing,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: regular,
    height: relaxedLineHeight,
    letterSpacing: wideLetterSpacing,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: regular,
    height: normalLineHeight,
    letterSpacing: normalLetterSpacing,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: regular,
    height: normalLineHeight,
    letterSpacing: normalLetterSpacing,
  );
}

/// Extension to create TextTheme from typography tokens
extension AppTextThemeExtension on TextTheme {
  static TextTheme get materialTextTheme => const TextTheme(
        displayLarge: AppTypography.displayLarge,
        displayMedium: AppTypography.displayMedium,
        displaySmall: AppTypography.displaySmall,
        headlineLarge: AppTypography.headlineLarge,
        headlineMedium: AppTypography.headlineMedium,
        headlineSmall: AppTypography.headlineSmall,
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
      );
}
