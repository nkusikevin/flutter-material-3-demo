import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/design_system/design_system.dart';
import 'package:my_app/design_system_showcase/design_system_showcase.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Design System Demo',
          debugShowCheckedModeBanner: false,
          themeMode: themeState.themeMode,
          theme: AppTheme.light(
            colorScheme: themeState.useDynamicColor
                ? themeState.lightDynamicColorScheme
                : null,
          ),
          darkTheme: AppTheme.dark(
            colorScheme: themeState.useDynamicColor
                ? themeState.darkDynamicColorScheme
                : null,
          ),
          home: const DesignSystemShowcasePage(),
        );
      },
    );
  }
}
