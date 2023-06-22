import 'package:advanced_theme_mode_cubit/theme/base_theme.dart';
import 'package:advanced_theme_mode_cubit/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AppLightTheme extends BaseTheme {
  AppLightTheme._(); // Private Contracture
  static final AppLightTheme _appLightTheme = AppLightTheme._(); // singleton
  factory AppLightTheme() => _appLightTheme; // return The Same Instance

  // Get The Light Mode Primary Color
  @override
  Color? get primaryColor => LightThemeColors.primaryColor;

  // Get The Light Mode Accent Color
  @override
  Color? get accentColor => LightThemeColors.accentColor;

  // Get The Light Mode Brightness
  @override
  Brightness? get brightness => Brightness.light;

  @override
  ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      brightness: brightness,
      scaffoldBackgroundColor: LightThemeColors.white,
      backgroundColor: LightThemeColors.white,
    );
  }

  @override
  Map<String, Color> get customColor => {
        AppColors.white: LightThemeColors.white,
        AppColors.black: LightThemeColors.black,
        AppColors.buttonTextColor: LightThemeColors.buttonTextColor,
      };

  // those For Dark Mode
  @override
  Color? get darkAccentColor => null;
  @override
  Color? get darkPrimaryColor => null;
  @override
  ThemeData? get darkTheme => null;
}
