/// Spacing tokens for consistent spacing throughout the app
class AppSpacing {
  // Base spacing unit (4dp)
  static const double _baseUnit = 4.0;

  // Micro spacing
  static const double xs = _baseUnit; // 4dp
  static const double sm = _baseUnit * 2; // 8dp
  static const double md = _baseUnit * 3; // 12dp
  static const double lg = _baseUnit * 4; // 16dp
  static const double xl = _baseUnit * 5; // 20dp
  static const double xxl = _baseUnit * 6; // 24dp
  static const double xxxl = _baseUnit * 8; // 32dp

  // Component specific spacing
  static const double buttonPadding = lg; // 16dp
  static const double cardPadding = lg; // 16dp
  static const double screenPadding = lg; // 16dp
  static const double sectionSpacing = xxl; // 24dp
  static const double itemSpacing = md; // 12dp

  // Layout spacing
  static const double scaffoldPadding = lg; // 16dp
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 80.0;
  static const double fabMargin = lg; // 16dp

  // Grid spacing
  static const double gridSpacing = sm; // 8dp
  static const double listItemSpacing = xs; // 4dp

  // Border radius
  static const double radiusXs = _baseUnit / 2; // 2dp
  static const double radiusSm = xs; // 4dp
  static const double radiusMd = sm; // 8dp
  static const double radiusLg = md; // 12dp
  static const double radiusXl = lg; // 16dp
  static const double radiusXxl = xl; // 20dp
  static const double radiusRound = 100.0; // Full round

  // Icon sizes
  static const double iconXs = lg; // 16dp
  static const double iconSm = xl; // 20dp
  static const double iconMd = xxl; // 24dp
  static const double iconLg = 32.0; // 32dp
  static const double iconXl = 40.0; // 40dp
  static const double iconXxl = 48.0; // 48dp

  // Minimum touch target size (Material 3)
  static const double minTouchTarget = 48.0;
}
