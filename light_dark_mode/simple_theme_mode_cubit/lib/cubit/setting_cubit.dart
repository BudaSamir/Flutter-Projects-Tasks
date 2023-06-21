import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_theme_mode_cubit/cubit/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState(themeData: ThemeData.light()));

  static SettingCubit get(context) => BlocProvider.of(context, listen: false);

  void toggleTheme() {
    if (state.themeData == ThemeData.light()) {
      emit(SettingState(themeData: ThemeData.dark()));
    } else {
      emit(SettingState(themeData: ThemeData.light()));
    }
  }
}
