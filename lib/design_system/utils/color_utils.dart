import 'package:flutter/material.dart';

/// Color utility functions
class ColorUtils {
  /// Check if a color is light or dark
  static bool isLightColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5;
  }

  /// Get contrasting text color for a background color
  static Color getContrastingTextColor(Color backgroundColor) {
    return isLightColor(backgroundColor) ? Colors.black : Colors.white;
  }

  /// Create a color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Lighten a color by a percentage
  static Color lighten(Color color, double percentage) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + percentage).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darken a color by a percentage
  static Color darken(Color color, double percentage) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - percentage).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Create a color palette from a base color
  static Map<int, Color> createMaterialColorSwatch(Color color) {
    final hsl = HSLColor.fromColor(color);

    return {
      50: hsl.withLightness(0.95).toColor(),
      100: hsl.withLightness(0.9).toColor(),
      200: hsl.withLightness(0.8).toColor(),
      300: hsl.withLightness(0.7).toColor(),
      400: hsl.withLightness(0.6).toColor(),
      500: color,
      600: hsl.withLightness(0.4).toColor(),
      700: hsl.withLightness(0.3).toColor(),
      800: hsl.withLightness(0.2).toColor(),
      900: hsl.withLightness(0.1).toColor(),
    };
  }

  /// Blend two colors
  static Color blendColors(Color color1, Color color2, double ratio) {
    return Color.lerp(color1, color2, ratio) ?? color1;
  }

  /// Get color with disabled opacity
  static Color getDisabledColor(Color color) {
    return color.withOpacity(0.38);
  }

  /// Get hover color for interactive elements
  static Color getHoverColor(Color color) {
    return ColorUtils.withOpacity(color, 0.08);
  }

  /// Get focus color for interactive elements
  static Color getFocusColor(Color color) {
    return ColorUtils.withOpacity(color, 0.12);
  }

  /// Get pressed color for interactive elements
  static Color getPressedColor(Color color) {
    return ColorUtils.withOpacity(color, 0.12);
  }

  /// Convert hex string to Color
  static Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Convert Color to hex string
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }
}
