part of 'theme_cubit.dart';

/// State for theme management
class ThemeState extends Equatable {
  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.useDynamicColor = true,
    this.lightDynamicColorScheme,
    this.darkDynamicColorScheme,
  });

  /// Current theme mode
  final ThemeMode themeMode;

  /// Whether to use dynamic color (Material You)
  final bool useDynamicColor;

  /// Dynamic light color scheme (if available)
  final ColorScheme? lightDynamicColorScheme;

  /// Dynamic dark color scheme (if available)
  final ColorScheme? darkDynamicColorScheme;

  /// Check if dynamic color is available
  bool get hasDynamicColor =>
      lightDynamicColorScheme != null && darkDynamicColorScheme != null;

  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? useDynamicColor,
    ColorScheme? lightDynamicColorScheme,
    ColorScheme? darkDynamicColorScheme,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      useDynamicColor: useDynamicColor ?? this.useDynamicColor,
      lightDynamicColorScheme:
          lightDynamicColorScheme ?? this.lightDynamicColorScheme,
      darkDynamicColorScheme:
          darkDynamicColorScheme ?? this.darkDynamicColorScheme,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        useDynamicColor,
        lightDynamicColorScheme,
        darkDynamicColorScheme,
      ];
}
