import 'dart:ui';

import 'package:advanced_theme_mode_cubit/theme/base_theme.dart';
import 'package:advanced_theme_mode_cubit/theme/theme_colors.dart';
import 'package:flutter/src/material/theme_data.dart';

class AppDarkTheme extends BaseTheme {
  AppDarkTheme._();
  static final AppDarkTheme _appDarkTheme = AppDarkTheme._();
  factory AppDarkTheme() => _appDarkTheme;

  // Get The Dark Mode Primary Color
  @override
  Color? get primaryColor => LightThemeColors.primaryColor;
  // Get The Dark Mode Accent Color
  @override
  Color? get accentColor => LightThemeColors.accentColor;
  // GEt The Dark Mode Brightness
  @override
  Brightness? get brightness => Brightness.dark;

  @override
  ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      brightness: brightness,
      scaffoldBackgroundColor: DarkThemeColors.black,
      backgroundColor: DarkThemeColors.black,
    );
  }

  @override
  Map<String, Color> get customColor => {
        AppColors.white: DarkThemeColors.black,
        AppColors.black: DarkThemeColors.white,
        AppColors.buttonTextColor: DarkThemeColors.buttonTextColor,
      };

  // This For Light Mode
  @override
  Color? get darkAccentColor => null;
  @override
  Color? get darkPrimaryColor => null;
  @override
  ThemeData? get lightTheme => null;
}
