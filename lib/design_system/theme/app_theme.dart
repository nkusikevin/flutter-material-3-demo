import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_schemes.dart';
import 'text_theme.dart';
import '../tokens/spacing.dart';
import '../tokens/shadows.dart';

/// Main theme configuration for the app
class AppTheme {
  /// Create light theme
  static ThemeData light({ColorScheme? colorScheme}) {
    final scheme = colorScheme ?? AppColorSchemes.lightColorScheme;
    return _createTheme(
      colorScheme: scheme,
      brightness: Brightness.light,
    );
  }

  /// Create dark theme
  static ThemeData dark({ColorScheme? colorScheme}) {
    final scheme = colorScheme ?? AppColorSchemes.darkColorScheme;
    return _createTheme(
      colorScheme: scheme,
      brightness: Brightness.dark,
    );
  }

  /// Create theme with given color scheme and brightness
  static ThemeData _createTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
  }) {
    final textTheme = brightness == Brightness.light
        ? AppTextTheme.lightTextTheme
        : AppTextTheme.darkTextTheme;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,

      // System UI overlay style
      appBarTheme: _createAppBarTheme(colorScheme, textTheme),

      // Button themes
      elevatedButtonTheme: _createElevatedButtonTheme(colorScheme),
      filledButtonTheme: _createFilledButtonTheme(colorScheme),
      outlinedButtonTheme: _createOutlinedButtonTheme(colorScheme),
      textButtonTheme: _createTextButtonTheme(colorScheme),

      // FAB theme
      floatingActionButtonTheme: _createFABTheme(colorScheme),

      // Card theme
      cardTheme: _createCardTheme(colorScheme),

      // Input decoration theme
      inputDecorationTheme: _createInputDecorationTheme(colorScheme),

      // Navigation themes
      navigationBarTheme: _createNavigationBarTheme(colorScheme),
      navigationRailTheme: _createNavigationRailTheme(colorScheme),

      // Dialog theme
      dialogTheme: _createDialogTheme(colorScheme),

      // Bottom sheet theme
      bottomSheetTheme: _createBottomSheetTheme(colorScheme),

      // Divider theme
      dividerTheme: _createDividerTheme(colorScheme),

      // List tile theme
      listTileTheme: _createListTileTheme(colorScheme),

      // Switch theme
      switchTheme: _createSwitchTheme(colorScheme),

      // Checkbox theme
      checkboxTheme: _createCheckboxTheme(colorScheme),

      // Radio theme
      radioTheme: _createRadioTheme(colorScheme),

      // Slider theme
      sliderTheme: _createSliderTheme(colorScheme),

      // Chip theme
      chipTheme: _createChipTheme(colorScheme),

      // Progress indicator theme
      progressIndicatorTheme: _createProgressIndicatorTheme(colorScheme),

      // Snackbar theme
      snackBarTheme: _createSnackBarTheme(colorScheme),

      // Tab bar theme
      tabBarTheme: _createTabBarTheme(colorScheme),
    );
  }

  /// AppBar theme
  static AppBarTheme _createAppBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      toolbarHeight: AppSpacing.appBarHeight,
      systemOverlayStyle: colorScheme.brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
    );
  }

  /// Elevated button theme
  static ElevatedButtonThemeData _createElevatedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        elevation: AppShadows.elevation1,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(64, AppSpacing.minTouchTarget),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
      ),
    );
  }

  /// Filled button theme
  static FilledButtonThemeData _createFilledButtonTheme(
    ColorScheme colorScheme,
  ) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(64, AppSpacing.minTouchTarget),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
      ),
    );
  }

  /// Outlined button theme
  static OutlinedButtonThemeData _createOutlinedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        side: BorderSide(color: colorScheme.outline),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(64, AppSpacing.minTouchTarget),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
      ),
    );
  }

  /// Text button theme
  static TextButtonThemeData _createTextButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(64, AppSpacing.minTouchTarget),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
      ),
    );
  }

  /// Floating Action Button theme
  static FloatingActionButtonThemeData _createFABTheme(
    ColorScheme colorScheme,
  ) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
      elevation: AppShadows.elevation3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
      ),
    );
  }

  /// Card theme
  static CardTheme _createCardTheme(ColorScheme colorScheme) {
    return CardTheme(
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
      elevation: AppShadows.elevation1,
      margin: const EdgeInsets.all(AppSpacing.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
    );
  }

  /// Input decoration theme
  static InputDecorationTheme _createInputDecorationTheme(
    ColorScheme colorScheme,
  ) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
    );
  }

  /// Navigation bar theme
  static NavigationBarThemeData _createNavigationBarTheme(
    ColorScheme colorScheme,
  ) {
    return NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      height: AppSpacing.bottomNavHeight,
    );
  }

  /// Navigation rail theme
  static NavigationRailThemeData _createNavigationRailTheme(
    ColorScheme colorScheme,
  ) {
    return NavigationRailThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      selectedIconTheme: IconThemeData(
        color: colorScheme.onSecondaryContainer,
      ),
      unselectedIconTheme: IconThemeData(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }

  /// Dialog theme
  static DialogTheme _createDialogTheme(ColorScheme colorScheme) {
    return DialogTheme(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      elevation: AppShadows.elevation5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXxl),
      ),
    );
  }

  /// Bottom sheet theme
  static BottomSheetThemeData _createBottomSheetTheme(
    ColorScheme colorScheme,
  ) {
    return BottomSheetThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      elevation: AppShadows.elevation4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXxl),
        ),
      ),
    );
  }

  /// Divider theme
  static DividerThemeData _createDividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(
      color: colorScheme.outlineVariant,
      space: 1,
      thickness: 1,
    );
  }

  /// List tile theme
  static ListTileThemeData _createListTileTheme(ColorScheme colorScheme) {
    return ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
    );
  }

  /// Switch theme
  static SwitchThemeData _createSwitchTheme(ColorScheme colorScheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.onPrimary;
        }
        return colorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.surfaceContainerHighest;
      }),
    );
  }

  /// Checkbox theme
  static CheckboxThemeData _createCheckboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return null;
      }),
      checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
    );
  }

  /// Radio theme
  static RadioThemeData _createRadioTheme(ColorScheme colorScheme) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.onSurfaceVariant;
      }),
    );
  }

  /// Slider theme
  static SliderThemeData _createSliderTheme(ColorScheme colorScheme) {
    return SliderThemeData(
      activeTrackColor: colorScheme.primary,
      inactiveTrackColor: colorScheme.surfaceContainerHighest,
      thumbColor: colorScheme.primary,
      overlayColor: colorScheme.primary.withOpacity(0.12),
      valueIndicatorColor: colorScheme.primary,
      valueIndicatorTextStyle: TextStyle(
        color: colorScheme.onPrimary,
      ),
    );
  }

  /// Chip theme
  static ChipThemeData _createChipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surfaceContainerHighest,
      selectedColor: colorScheme.secondaryContainer,
      disabledColor: colorScheme.onSurface.withOpacity(0.12),
      deleteIconColor: colorScheme.onSurfaceVariant,
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      secondaryLabelStyle: TextStyle(color: colorScheme.onSecondaryContainer),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
    );
  }

  /// Progress indicator theme
  static ProgressIndicatorThemeData _createProgressIndicatorTheme(
    ColorScheme colorScheme,
  ) {
    return ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.surfaceContainerHighest,
      circularTrackColor: colorScheme.surfaceContainerHighest,
    );
  }

  /// Snackbar theme
  static SnackBarThemeData _createSnackBarTheme(ColorScheme colorScheme) {
    return SnackBarThemeData(
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: AppShadows.elevation3,
    );
  }

  /// Tab bar theme
  static TabBarTheme _createTabBarTheme(ColorScheme colorScheme) {
    return TabBarTheme(
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 3,
        ),
      ),
    );
  }
}
