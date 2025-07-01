import 'package:flutter/material.dart';
import '../../utils/responsive_utils.dart';
import '../../tokens/breakpoints.dart';

/// Adaptive navigation component that switches between bottom nav and rail
class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    this.extended = false,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<AppNavigationDestination> destinations;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    // Use bottom navigation for compact screens, rail for others
    if (ResponsiveUtils.shouldUseBottomNavigation(context)) {
      return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations
            .map((dest) => NavigationDestination(
                  icon: dest.icon,
                  selectedIcon: dest.selectedIcon,
                  label: dest.label,
                ))
            .toList(),
      );
    } else {
      return NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        extended: extended || context.screenType == ScreenType.largeDesktop,
        destinations: destinations
            .map((dest) => NavigationRailDestination(
                  icon: dest.icon,
                  selectedIcon: dest.selectedIcon,
                  label: Text(dest.label),
                ))
            .toList(),
      );
    }
  }
}

/// Navigation destination for the app navigation
class AppNavigationDestination {
  const AppNavigationDestination({
    required this.icon,
    required this.label,
    this.selectedIcon,
  });

  final Widget icon;
  final Widget? selectedIcon;
  final String label;
}
