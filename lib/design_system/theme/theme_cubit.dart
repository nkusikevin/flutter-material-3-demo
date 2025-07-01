import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState()) {
    _initializeTheme();
  }

  Future<void> _initializeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    final useDynamicColor = prefs.getBool('useDynamicColor') ?? true;

    ColorScheme? lightDynamic;
    ColorScheme? darkDynamic;

    if (useDynamicColor) {
      try {
        final corePalette = await DynamicColorPlugin.getCorePalette();
        if (corePalette != null) {
          lightDynamic = corePalette.toColorScheme();
          darkDynamic = corePalette.toColorScheme(brightness: Brightness.dark);
        }
      } catch (e) {
        // Dynamic colors not available
      }
    }

    emit(state.copyWith(
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      useDynamicColor: useDynamicColor,
      lightDynamicColorScheme: lightDynamic,
      darkDynamicColorScheme: darkDynamic,
    ));
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', mode == ThemeMode.dark);

    emit(state.copyWith(themeMode: mode));
  }

  Future<void> toggleTheme() async {
    final newMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await updateThemeMode(newMode);
  }

  Future<void> toggleDynamicColors() async {
    final newUseDynamicColor = !state.useDynamicColor;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('useDynamicColor', newUseDynamicColor);

    ColorScheme? lightDynamic;
    ColorScheme? darkDynamic;

    if (newUseDynamicColor) {
      try {
        final corePalette = await DynamicColorPlugin.getCorePalette();
        if (corePalette != null) {
          lightDynamic = corePalette.toColorScheme();
          darkDynamic = corePalette.toColorScheme(brightness: Brightness.dark);
        }
      } catch (e) {
        // Dynamic colors not available
      }
    }

    emit(state.copyWith(
      useDynamicColor: newUseDynamicColor,
      lightDynamicColorScheme: lightDynamic,
      darkDynamicColorScheme: darkDynamic,
    ));
  }

  bool get isDynamicColorAvailable {
    return state.lightDynamicColorScheme != null &&
        state.darkDynamicColorScheme != null;
  }
}
