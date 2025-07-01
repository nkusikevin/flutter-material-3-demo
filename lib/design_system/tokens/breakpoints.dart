import 'package:flutter/material.dart';

/// Responsive breakpoints for different screen sizes
class AppBreakpoints {
  // Breakpoint values (width in logical pixels)
  static const double mobile = 600;
  static const double tablet = 840;
  static const double desktop = 1200;
  static const double largeDesktop = 1600;

  // Compact, medium, expanded layout classes (Material 3)
  static const double compactMaxWidth = 600;
  static const double mediumMinWidth = 600;
  static const double mediumMaxWidth = 840;
  static const double expandedMinWidth = 840;

  /// Get the current screen type based on width
  static ScreenType getScreenType(double width) {
    if (width < mobile) {
      return ScreenType.mobile;
    } else if (width < tablet) {
      return ScreenType.tablet;
    } else if (width < desktop) {
      return ScreenType.desktop;
    } else {
      return ScreenType.largeDesktop;
    }
  }

  /// Get Material 3 window size class
  static WindowSizeClass getWindowSizeClass(double width) {
    if (width < compactMaxWidth) {
      return WindowSizeClass.compact;
    } else if (width < mediumMaxWidth) {
      return WindowSizeClass.medium;
    } else {
      return WindowSizeClass.expanded;
    }
  }

  /// Check if screen is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }

  /// Check if screen is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < tablet;
  }

  /// Check if screen is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tablet;
  }
}

/// Screen type enumeration
enum ScreenType {
  mobile,
  tablet,
  desktop,
  largeDesktop,
}

/// Material 3 Window Size Classes
enum WindowSizeClass {
  compact, // Phone in portrait, small tablet in portrait
  medium, // Large unfolded inner display, most tablets in portrait, phone in landscape
  expanded, // Most tablets in landscape, desktop
}

/// Extension to get breakpoint information from BuildContext
extension BreakpointExtension on BuildContext {
  ScreenType get screenType => AppBreakpoints.getScreenType(
        MediaQuery.of(this).size.width,
      );

  WindowSizeClass get windowSizeClass => AppBreakpoints.getWindowSizeClass(
        MediaQuery.of(this).size.width,
      );

  bool get isMobile => AppBreakpoints.isMobile(this);
  bool get isTablet => AppBreakpoints.isTablet(this);
  bool get isDesktop => AppBreakpoints.isDesktop(this);
}
