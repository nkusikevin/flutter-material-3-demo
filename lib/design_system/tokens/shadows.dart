import 'package:flutter/material.dart';

/// Material 3 Shadow tokens for elevation system
class AppShadows {
  // Material 3 Elevation levels
  static const double elevation0 = 0.0;
  static const double elevation1 = 1.0;
  static const double elevation2 = 3.0;
  static const double elevation3 = 6.0;
  static const double elevation4 = 8.0;
  static const double elevation5 = 12.0;

  // Custom shadows for specific use cases
  static const List<BoxShadow> shadow1 = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity black
      blurRadius: 2.0,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> shadow2 = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity black
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity black
      blurRadius: 2.0,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> shadow3 = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity black
      blurRadius: 20.0,
      offset: Offset(0, 8),
    ),
    BoxShadow(
      color: Color(0x14000000), // 8% opacity black
      blurRadius: 6.0,
      offset: Offset(0, 3),
    ),
  ];

  static const List<BoxShadow> shadow4 = [
    BoxShadow(
      color: Color(0x1F000000), // 12% opacity black
      blurRadius: 28.0,
      offset: Offset(0, 12),
    ),
    BoxShadow(
      color: Color(0x17000000), // 9% opacity black
      blurRadius: 10.0,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> shadow5 = [
    BoxShadow(
      color: Color(0x24000000), // 14% opacity black
      blurRadius: 40.0,
      offset: Offset(0, 16),
    ),
    BoxShadow(
      color: Color(0x1F000000), // 12% opacity black
      blurRadius: 12.0,
      offset: Offset(0, 6),
    ),
  ];

  // Get shadow by elevation level
  static List<BoxShadow> getShadowByElevation(double elevation) {
    if (elevation <= 1) return shadow1;
    if (elevation <= 3) return shadow2;
    if (elevation <= 6) return shadow3;
    if (elevation <= 8) return shadow4;
    return shadow5;
  }

  // Component-specific shadows
  static const List<BoxShadow> cardShadow = shadow1;
  static const List<BoxShadow> bottomSheetShadow = shadow4;
  static const List<BoxShadow> dialogShadow = shadow5;
  static const List<BoxShadow> fabShadow = shadow3;
  static const List<BoxShadow> appBarShadow = shadow2;

  // Focus and hover shadows for interactive elements
  static const List<BoxShadow> focusShadow = [
    BoxShadow(
      color: Color(0x33000000), // 20% opacity black
      blurRadius: 8.0,
      offset: Offset(0, 0),
      spreadRadius: 2.0,
    ),
  ];

  static const List<BoxShadow> hoverShadow = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity black
      blurRadius: 12.0,
      offset: Offset(0, 4),
    ),
  ];
}
