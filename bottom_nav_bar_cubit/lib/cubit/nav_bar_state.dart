part of 'nav_bar_cubit.dart';

enum NavBarStates {
  initial,
  changeBottomNavIndex,
}

class NavBarState {
  NavBarStates navBarStates;

  NavBarState({this.navBarStates = NavBarStates.initial});

  NavBarState copyWith({NavBarStates? navBarStates}) {
    return NavBarState(navBarStates: navBarStates ?? this.navBarStates);
  }
}
