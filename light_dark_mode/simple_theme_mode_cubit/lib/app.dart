import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_theme_mode_cubit/cubit/setting_cubit.dart';
import 'package:simple_theme_mode_cubit/cubit/setting_state.dart';
import 'package:simple_theme_mode_cubit/views/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..onDecideThemeChange(),
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Simple Theme Mode Cubit',
            theme: state.themeData,
            home: const MyHomePage(title: 'Simple Theme Mode Cubit'),
          );
        },
      ),
    );
  }
}
