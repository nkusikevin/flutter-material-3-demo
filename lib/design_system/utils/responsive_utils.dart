import 'package:flutter/material.dart';
import 'package:my_app/design_system/tokens/breakpoints.dart';

class ResponsiveUtils {
  static bool isCompact(BuildContext context) {
    return MediaQuery.of(context).size.width < AppBreakpoints.compactMaxWidth;
  }

  static bool isMedium(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppBreakpoints.mediumMinWidth &&
        width < AppBreakpoints.mediumMaxWidth;
  }

  static bool isExpanded(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppBreakpoints.expandedMinWidth;
  }

  static bool isLarge(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppBreakpoints.desktop;
  }

  static bool isExtraLarge(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppBreakpoints.largeDesktop;
  }

  /// Determines if bottom navigation should be used instead of navigation rail
  static bool shouldUseBottomNavigation(BuildContext context) {
    return isCompact(context);
  }

  /// Get the appropriate number of grid columns based on screen size
  static int getGridColumns(
    BuildContext context, {
    int compact = 1,
    int medium = 2,
    int expanded = 3,
    int large = 4,
    int extraLarge = 5,
  }) {
    if (isExtraLarge(context)) return extraLarge;
    if (isLarge(context)) return large;
    if (isExpanded(context)) return expanded;
    if (isMedium(context)) return medium;
    return compact;
  }

  /// Get responsive font size based on screen size
  static double getResponsiveFontSize(
    BuildContext context, {
    required double base,
    double? compact,
    double? medium,
    double? expanded,
  }) {
    if (isExpanded(context) && expanded != null) return expanded;
    if (isMedium(context) && medium != null) return medium;
    if (isCompact(context) && compact != null) return compact;
    return base;
  }

  /// Get responsive spacing based on screen size
  static double getResponsiveSpacing(
    BuildContext context, {
    required double base,
    double? compact,
    double? medium,
    double? expanded,
  }) {
    if (isExpanded(context) && expanded != null) return expanded;
    if (isMedium(context) && medium != null) return medium;
    if (isCompact(context) && compact != null) return compact;
    return base;
  }

  /// Get adaptive padding based on screen size
  static EdgeInsets getAdaptivePadding(BuildContext context) {
    if (isCompact(context)) {
      return const EdgeInsets.all(16);
    } else if (isMedium(context)) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(32);
    }
  }

  /// Get the screen type as an enum
  static ResponsiveScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= AppBreakpoints.largeDesktop)
      return ResponsiveScreenType.extraLarge;
    if (width >= AppBreakpoints.desktop) return ResponsiveScreenType.large;
    if (width >= AppBreakpoints.expandedMinWidth)
      return ResponsiveScreenType.expanded;
    if (width >= AppBreakpoints.mediumMinWidth)
      return ResponsiveScreenType.medium;
    return ResponsiveScreenType.compact;
  }
}

/// Screen type enumeration for responsive utils (renamed to avoid conflicts)
enum ResponsiveScreenType {
  compact,
  medium,
  expanded,
  large,
  extraLarge,
}

/// Responsive wrapper widget that provides adaptive padding
class ResponsiveWrapper extends StatelessWidget {
  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding,
  });

  final Widget child;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? AppBreakpoints.desktop,
        ),
        padding: padding ?? ResponsiveUtils.getAdaptivePadding(context),
        child: child,
      ),
    );
  }
}

/// Responsive builder widget that builds different layouts for different screen sizes
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.large,
    this.extraLarge,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? large;
  final Widget? extraLarge;

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveUtils.getScreenType(context);

    switch (screenType) {
      case ResponsiveScreenType.extraLarge:
        return extraLarge ?? large ?? desktop ?? tablet ?? mobile;
      case ResponsiveScreenType.large:
        return large ?? desktop ?? tablet ?? mobile;
      case ResponsiveScreenType.expanded:
        return desktop ?? tablet ?? mobile;
      case ResponsiveScreenType.medium:
        return tablet ?? mobile;
      case ResponsiveScreenType.compact:
        return mobile;
    }
  }
}
