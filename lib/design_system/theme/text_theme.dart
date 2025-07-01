import 'package:flutter/material.dart';
import '../tokens/typography.dart';

/// Text theme configuration for Material 3
class AppTextTheme {
  /// Create light text theme
  static TextTheme lightTextTheme = _baseTextTheme.apply(
    bodyColor: const Color(0xFF1C1B1F), // onSurface
    displayColor: const Color(0xFF1C1B1F), // onSurface
  );

  /// Create dark text theme
  static TextTheme darkTextTheme = _baseTextTheme.apply(
    bodyColor: const Color(0xFFE6E0E9), // onSurface
    displayColor: const Color(0xFFE6E0E9), // onSurface
  );

  /// Base text theme using our typography tokens
  static const TextTheme _baseTextTheme = TextTheme(
    // Display styles
    displayLarge: AppTypography.displayLarge,
    displayMedium: AppTypography.displayMedium,
    displaySmall: AppTypography.displaySmall,

    // Headline styles
    headlineLarge: AppTypography.headlineLarge,
    headlineMedium: AppTypography.headlineMedium,
    headlineSmall: AppTypography.headlineSmall,

    // Title styles
    titleLarge: AppTypography.titleLarge,
    titleMedium: AppTypography.titleMedium,
    titleSmall: AppTypography.titleSmall,

    // Label styles
    labelLarge: AppTypography.labelLarge,
    labelMedium: AppTypography.labelMedium,
    labelSmall: AppTypography.labelSmall,

    // Body styles
    bodyLarge: AppTypography.bodyLarge,
    bodyMedium: AppTypography.bodyMedium,
    bodySmall: AppTypography.bodySmall,
  );

  /// Create custom text theme with specific color
  static TextTheme createTextTheme(Color textColor) {
    return _baseTextTheme.apply(
      bodyColor: textColor,
      displayColor: textColor,
    );
  }
}

/// Extension to add semantic text styles
extension SemanticTextStyles on TextTheme {
  /// Error text style
  TextStyle get error => bodyMedium!.copyWith(
        color: const Color(0xFFBA1A1A), // error color
        fontWeight: AppTypography.medium,
      );

  /// Success text style
  TextStyle get success => bodyMedium!.copyWith(
        color: const Color(0xFF4CAF50), // success color
        fontWeight: AppTypography.medium,
      );

  /// Warning text style
  TextStyle get warning => bodyMedium!.copyWith(
        color: const Color(0xFFFF9800), // warning color
        fontWeight: AppTypography.medium,
      );

  /// Info text style
  TextStyle get info => bodyMedium!.copyWith(
        color: const Color(0xFF2196F3), // info color
        fontWeight: AppTypography.medium,
      );

  /// Caption style (deprecated in Material 3, using bodySmall)
  TextStyle get caption => bodySmall!;

  /// Overline style (deprecated in Material 3, using labelSmall)
  TextStyle get overline => labelSmall!.copyWith(
        letterSpacing: 1.5,
        fontWeight: AppTypography.medium,
      );

  /// Button text style
  TextStyle get button => labelLarge!.copyWith(
        fontWeight: AppTypography.medium,
      );
}
