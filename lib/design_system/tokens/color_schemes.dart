import 'package:flutter/material.dart';

/// Material 3 Light Color Scheme
/// Based on Material Design 3 color tokens
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6750A4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  onPrimaryContainer: Color(0xFF21005D),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  onSecondaryContainer: Color(0xFF1D192B),
  tertiary: Color(0xFF7D5260),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  onTertiaryContainer: Color(0xFF31111D),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFEF7FF),
  onSurface: Color(0xFF1D1B20),
  surfaceContainerHighest: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  outline: Color(0xFF79757F),
  outlineVariant: Color(0xFFCAC4D0),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF322F35),
  onInverseSurface: Color(0xFFF5EFF7),
  inversePrimary: Color(0xFFD0BCFF),
  surfaceTint: Color(0xFF6750A4),
);

/// Material 3 Dark Color Scheme
/// Based on Material Design 3 color tokens
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  onPrimaryContainer: Color(0xFFEADDFF),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: Color(0xFF4A4458),
  onSecondaryContainer: Color(0xFFE8DEF8),
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  onTertiaryContainer: Color(0xFFFFD8E4),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF141218),
  onSurface: Color(0xFFE6E0E9),
  surfaceContainerHighest: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  outline: Color(0xFF938F99),
  outlineVariant: Color(0xFF49454F),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFFE6E0E9),
  onInverseSurface: Color(0xFF322F35),
  inversePrimary: Color(0xFF6750A4),
  surfaceTint: Color(0xFFD0BCFF),
);

/// Extension to add semantic colors to ColorScheme
extension SemanticColors on ColorScheme {
  /// Success color - typically green
  Color get success {
    return brightness == Brightness.light
        ? const Color(0xFF2E7D32) // Green 800
        : const Color(0xFF4CAF50); // Green 500
  }

  /// Text color for success backgrounds
  Color get onSuccess {
    return brightness == Brightness.light ? Colors.white : Colors.black;
  }

  /// Success container color
  Color get successContainer {
    return brightness == Brightness.light
        ? const Color(0xFFE8F5E8) // Light green
        : const Color(0xFF1B5E20); // Dark green
  }

  /// Text color for success container backgrounds
  Color get onSuccessContainer {
    return brightness == Brightness.light
        ? const Color(0xFF1B5E20)
        : const Color(0xFFC8E6C9);
  }

  /// Warning color - typically orange/amber
  Color get warning {
    return brightness == Brightness.light
        ? const Color(0xFFEF6C00) // Orange 800
        : const Color(0xFFFF9800); // Orange 500
  }

  /// Text color for warning backgrounds
  Color get onWarning {
    return brightness == Brightness.light ? Colors.white : Colors.black;
  }

  /// Warning container color
  Color get warningContainer {
    return brightness == Brightness.light
        ? const Color(0xFFFFF3E0) // Light orange
        : const Color(0xFFE65100); // Dark orange
  }

  /// Text color for warning container backgrounds
  Color get onWarningContainer {
    return brightness == Brightness.light
        ? const Color(0xFFE65100)
        : const Color(0xFFFFE0B2);
  }

  /// Info color - typically blue
  Color get info {
    return brightness == Brightness.light
        ? const Color(0xFF1976D2) // Blue 700
        : const Color(0xFF2196F3); // Blue 500
  }

  /// Text color for info backgrounds
  Color get onInfo {
    return brightness == Brightness.light ? Colors.white : Colors.black;
  }

  /// Info container color
  Color get infoContainer {
    return brightness == Brightness.light
        ? const Color(0xFFE3F2FD) // Light blue
        : const Color(0xFF0D47A1); // Dark blue
  }

  /// Text color for info container backgrounds
  Color get onInfoContainer {
    return brightness == Brightness.light
        ? const Color(0xFF0D47A1)
        : const Color(0xFFBBDEFB);
  }
}
