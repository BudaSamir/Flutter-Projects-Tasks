import 'package:flutter/material.dart';
import 'package:simple_theme_mode_cubit/cubit/setting_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final settingCubit = SettingCubit.get(context);
              settingCubit.toggleTheme();
            },
            child: const Text("Change Mode Settings")),
      ),
    );
  }
}
