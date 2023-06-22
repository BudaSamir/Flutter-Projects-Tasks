import 'package:advanced_theme_mode_cubit/theme/dark_theme.dart';
import 'package:advanced_theme_mode_cubit/theme/light_theme.dart';
import 'package:flutter/material.dart';

abstract class BaseTheme {
  Brightness? get brightness;
  Color? get primaryColor;
  Color? get darkPrimaryColor;
  Color? get accentColor;
  Color? get darkAccentColor;
  Map<String, Color> get customColor;
  ThemeData? get lightTheme;
  ThemeData? get darkTheme;
}

ThemeData getModuleLightTheme() {
  return AppLightTheme().lightTheme;
}

Map<String, Color> getLightThemeCustomColors() {
  return AppLightTheme().customColor;
}

ThemeData getModuleDarkTheme() {
  return AppDarkTheme().darkTheme;
}

Map<String, Color> getDarkThemeCustomColors() {
  return AppDarkTheme().customColor;
}
