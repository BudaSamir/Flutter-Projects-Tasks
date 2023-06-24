import 'package:bottom_nav_bar_cubit/cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navBarCubit = NavBarCubit.get(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navBarCubit.bottomNavIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          navBarCubit.changeBottomNavIndex(index: index);
        },
        items: navBarCubit.items,
      ),
      body: navBarCubit.navBarScreens[navBarCubit.bottomNavIndex],
    );
  }
}
