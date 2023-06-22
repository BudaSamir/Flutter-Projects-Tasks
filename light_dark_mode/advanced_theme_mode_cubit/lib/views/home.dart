import 'package:advanced_theme_mode_cubit/cubit/theme_cubit.dart';
import 'package:advanced_theme_mode_cubit/cubit/theme_state.dart';
import 'package:advanced_theme_mode_cubit/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ChangeThemeState>(
      bloc: changeThemeCubit,
      builder: (context, themeState) {
        return Scaffold(
          backgroundColor: themeState.customColors[AppColors.white],
          body: SafeArea(
            child: Container(
              color: themeState.customColors[AppColors.white],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Testing The dark/light mode',
                      style: TextStyle(
                        color: themeState.customColors[AppColors.black],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        changeThemeCubit.changeToLightTheme();
                      },
                      child: Text(
                        'Light Theme',
                        style: TextStyle(
                          color: themeState
                              .customColors[AppColors.buttonTextColor],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        changeThemeCubit.changeToDarkTheme();
                      },
                      child: Text(
                        'Dark Theme',
                        style: TextStyle(
                          color: themeState
                              .customColors[AppColors.buttonTextColor],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
