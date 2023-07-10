import 'package:flutter/material.dart';
import 'package:simple_theme_mode_cubit/views/apptheme.dart';

class SettingState {
  ThemeData themeData;
  SettingState({required this.themeData});

  factory SettingState.lightTheme() {
    return SettingState(themeData: AppTheme.lightTheme);
  }
  factory SettingState.darkTheme() {
    return SettingState(themeData: AppTheme.darkTheme);
  }
}
