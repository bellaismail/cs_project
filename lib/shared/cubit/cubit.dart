import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:untitled6/module/bmi/bmi_screen.dart';
import 'package:untitled6/module/home/home_page.dart';
import 'package:untitled6/shared/cubit/states.dart';

import '../../module/setting/setting/setting.dart';
import '../../module/sports/sport/Fitness_Screen.dart';
import '../../module/steps/dahboard.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem>bottomNavigationBarItem=[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded,),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.calculate_rounded,),
      label: 'BMI',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.fireFlameCurved,),
      label: 'Calories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.directions_run_outlined,),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings,),
      label: 'setting',
    ),
  ];

  List<Widget>screen=[
    const DailyScreen(),
    BMICalculatorScreen() ,
    const dashboard(),
    FitnessScreen(),
    Setting(),
  ];

  // List<PersistentBottomNavBarItem> bottomNavigationBarItem = [
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(CupertinoIcons.home,),
  //     opacity: .8,
  //     title: 'Home',
  //     activeColorPrimary: CupertinoColors.activeGreen,
  //     inactiveColorPrimary: CupertinoColors.inactiveGray,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(Icons.calculate_rounded),
  //     title: 'BMI',
  //     activeColorPrimary: CupertinoColors.activeGreen,
  //     inactiveColorPrimary: CupertinoColors.inactiveGray,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(FontAwesomeIcons.fireFlameCurved),
  //     title: 'Calories',
  //     activeColorPrimary: CupertinoColors.activeGreen,
  //     inactiveColorPrimary: CupertinoColors.inactiveGray,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(FontAwesomeIcons.running),
  //     title: 'Sport',
  //     activeColorPrimary: CupertinoColors.activeGreen,
  //     inactiveColorPrimary: CupertinoColors.inactiveGray,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(Icons.settings),
  //     title: 'Setting',
  //     activeColorPrimary: CupertinoColors.activeGreen,
  //     inactiveColorPrimary: CupertinoColors.inactiveGray,
  //   ),
  // ];

  // List<Widget> screen() {
  //   return [
  //     const DailyScreen(),
  //     BMICalculatorScreen(),
  //     const dashboard(),
  //     FitnessScreen(),
  //     Setting(),
  //   ];
  // }

  void changeBottomNavigationBar(index) {
    currentIndex = index;
    emit(NewsBottomNavStates());
  }

  void changeSufiux() {
    emit(PasswordStates());
  }

  void changeAge() {
    emit(ChangeAge());
  }
}
