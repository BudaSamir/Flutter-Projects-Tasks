import 'package:bottom_nav_bar_cubit/screens/cart_screen.dart';
import 'package:bottom_nav_bar_cubit/screens/categories_screen.dart';
import 'package:bottom_nav_bar_cubit/screens/favorites_screen.dart';
import 'package:bottom_nav_bar_cubit/screens/home_screen.dart';
import 'package:bottom_nav_bar_cubit/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarState());

  static NavBarCubit get(context) => BlocProvider.of(context, listen: true);

  int bottomNavIndex = 0;
  List<Widget> navBarScreens = const [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'category'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), label: 'ShoppingCart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  void changeBottomNavIndex({required int index}) {
    bottomNavIndex = index;
    emit(NavBarState(navBarStates: NavBarStates.changeBottomNavIndex));
  }
}
