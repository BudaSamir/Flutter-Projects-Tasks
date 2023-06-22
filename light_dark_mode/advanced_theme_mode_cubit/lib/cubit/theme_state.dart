import 'package:advanced_theme_mode_cubit/theme/base_theme.dart';
import 'package:advanced_theme_mode_cubit/theme/enum.dart';
import 'package:flutter/material.dart';

class ChangeThemeState {
  final ThemeData themeData;
  final ThemeType type;
  bool? isDarkTheme;
  final Map<String, Color> customColors;

  ChangeThemeState({
    required this.themeData,
    required this.type,
    required this.customColors,
  }) {
    // IF The Brightness = dark => isDarkTheme = True
    isDarkTheme = themeData.brightness == Brightness.dark;
  }

  factory ChangeThemeState.lightTheme({required ThemeType type}) {
    return ChangeThemeState(
      themeData: getModuleLightTheme(),
      customColors: getLightThemeCustomColors(),
      type: type,
    );
  }
  factory ChangeThemeState.darkTheme({required ThemeType type}) {
    return ChangeThemeState(
      themeData: getModuleDarkTheme(),
      customColors: getDarkThemeCustomColors(),
      type: type,
    );
  }
}
