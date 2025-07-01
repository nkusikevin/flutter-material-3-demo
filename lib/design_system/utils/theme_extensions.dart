import 'package:flutter/material.dart';
import '../tokens/spacing.dart';
import '../theme/color_schemes.dart';

/// Extensions to easily access theme values
extension ThemeExtensions on BuildContext {
  /// Get the current theme
  ThemeData get theme => Theme.of(this);

  /// Get the current color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the current text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Check if dark mode is active
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Get semantic colors
  Color get successColor => colorScheme.success;
  Color get warningColor => colorScheme.warning;
  Color get infoColor => colorScheme.info;
}

/// Extensions to easily access spacing values
extension SpacingExtensions on BuildContext {
  /// Get responsive padding based on screen size
  EdgeInsets get screenPadding {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) {
      return const EdgeInsets.all(AppSpacing.lg);
    } else if (width < 840) {
      return const EdgeInsets.all(AppSpacing.xl);
    } else {
      return const EdgeInsets.all(AppSpacing.xxl);
    }
  }

  /// Get content padding
  EdgeInsets get contentPadding => const EdgeInsets.all(AppSpacing.lg);

  /// Get card padding
  EdgeInsets get cardPadding => const EdgeInsets.all(AppSpacing.cardPadding);

  /// Get button padding
  EdgeInsets get buttonPadding => const EdgeInsets.symmetric(
        horizontal: AppSpacing.buttonPadding,
        vertical: AppSpacing.md,
      );
}

/// Extensions for common UI patterns
extension UIExtensions on BuildContext {
  /// Show a snackbar with design system styling
  void showAppSnackBar(
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
        duration: duration,
      ),
    );
  }

  /// Show an error snackbar
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colorScheme.error,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  /// Show a success snackbar
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colorScheme.success,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
