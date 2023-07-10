import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_theme_mode_cubit/cubit/setting_state.dart';
import 'package:simple_theme_mode_cubit/views/apptheme.dart';

SettingCubit setting = SettingCubit()..onDecideThemeChange();

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.lightTheme());

  static SettingCubit get(context) => BlocProvider.of(context);

  void toggleTheme() {
    if (state.themeData == AppTheme.lightTheme) {
      _saveThemeMode(1); // Save Dark Mode
      emit(SettingState.darkTheme());
    } else {
      _saveThemeMode(0); // Save Dark Mode
      emit(SettingState.lightTheme());
    }
  }

  Future<void> _saveThemeMode(int value) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setInt('theme_option', value);
  }

  Future<int> getThemeMode() async {
    try {
      var pref = await SharedPreferences.getInstance();
      int option = pref.getInt('theme_option') ?? 0;
      return option;
    } catch (e) {
      return 1;
    }
  }

  void onDecideThemeChange() async {
    final themeValue = await getThemeMode();
    if (themeValue == 0) {
      emit(SettingState.lightTheme());
    } else if (themeValue == 1) {
      emit(SettingState.darkTheme());
    }
  }
}
