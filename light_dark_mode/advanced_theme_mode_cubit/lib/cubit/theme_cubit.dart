import 'package:advanced_theme_mode_cubit/cubit/theme_state.dart';
import 'package:advanced_theme_mode_cubit/theme/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeCubit changeThemeCubit = ThemeCubit()..onDecideThemeChange();

class ThemeCubit extends Cubit<ChangeThemeState> {
  ThemeCubit() : super(ChangeThemeState.lightTheme(type: ThemeType.light));

  void changeToLightTheme() {
    _saveOptionValue(0);
    emit(ChangeThemeState.lightTheme(type: ThemeType.light));
  }

  void changeToDarkTheme() {
    _saveOptionValue(1);
    emit(ChangeThemeState.darkTheme(type: ThemeType.dark));
  }

  Future<void> _saveOptionValue(int optionValue) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setInt('theme_option', optionValue);
  }

  Future<int> getOption() async {
    try {
      var pref = await SharedPreferences.getInstance();
      int option = pref.getInt('theme_option') ?? 0;
      return option;
    } catch (e) {
      return 1;
    }
  }

  Future<ThemeType> getThemeType() async {
    var option = await getOption();
    return ThemeType.values[option];
  }

  void onDecideThemeChange() async {
    final optionValue = await getOption();
    if (optionValue == 0) {
      changeToLightTheme();
    } else if (optionValue == 1) {
      changeToDarkTheme();
    }
  }
}
