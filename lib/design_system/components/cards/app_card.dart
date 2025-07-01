import 'package:flutter/material.dart';
import '../../tokens/spacing.dart';
import '../../tokens/shadows.dart';

/// App Card that follows Material 3 design guidelines
class AppCard extends StatelessWidget {
  const AppCard({
    this.child,
    this.onTap,
    this.elevation,
    this.variant = AppCardVariant.elevated,
    this.padding,
    this.margin,
    this.color,
    super.key,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final double? elevation;
  final AppCardVariant variant;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardTheme = theme.cardTheme;

    final cardChild = Padding(
      padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
      child: child,
    );

    final cardColor = color ?? cardTheme.color ?? theme.colorScheme.surface;
    final cardElevation = elevation ?? _getElevation(variant);
    final cardMargin = margin ?? cardTheme.margin;

    return Container(
      margin: cardMargin,
      child: Material(
        color: cardColor,
        elevation: cardElevation,
        shadowColor: theme.colorScheme.shadow,
        surfaceTintColor: theme.colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          side: variant == AppCardVariant.outlined
              ? BorderSide(color: theme.colorScheme.outline)
              : BorderSide.none,
        ),
        child: onTap != null
            ? InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                child: cardChild,
              )
            : cardChild,
      ),
    );
  }

  double _getElevation(AppCardVariant variant) {
    switch (variant) {
      case AppCardVariant.elevated:
        return AppShadows.elevation1;
      case AppCardVariant.filled:
        return AppShadows.elevation0;
      case AppCardVariant.outlined:
        return AppShadows.elevation0;
    }
  }
}

/// Card variants following Material 3 guidelines
enum AppCardVariant {
  elevated, // Default card with elevation
  filled, // Card with filled background, no elevation
  outlined, // Card with outline, no elevation
}
