// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:project_sprout/pages/home_page.dart';
import 'package:project_sprout/pages/profile.dart';
import 'package:project_sprout/pages/reminder.dart';

import '../model_classes/colours.dart';
import '../pages/favourites.dart';
import '../pages/search.dart';

class NavBar extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<NavBar> {


  // Change Index
  void updateIndex(index) {
    setState(() => this.nav_index = index);
  }

  int nav_index = 0;
  final screens = [
    HomePage(),
    const Search(),
    const Reminder(),
    const Favorite(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[nav_index],
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: NavigationBarTheme(
            data: const NavigationBarThemeData(
                indicatorColor: Colors.transparent),
            child: NavigationBar(
                backgroundColor: Colors.transparent,
                selectedIndex: nav_index,
                onDestinationSelected: updateIndex,
                destinations: [
                  const NavigationDestination(
                      icon: Icon(IconlyLight.home),
                      label: '',
                      selectedIcon: Icon(
                        IconlyBold.home,
                        color: Shade.t1,
                      )),
                  const NavigationDestination(
                      icon: Icon(IconlyLight.search),
                      label: '',
                      selectedIcon: Icon(IconlyBold.search, color: Shade.t1)),
                  const NavigationDestination(
                      icon: Icon(IconlyLight.notification),
                      label: '',
                      selectedIcon:
                          Icon(IconlyBold.notification, color: Shade.t1)),
                  const NavigationDestination(
                      icon: Icon(IconlyLight.heart),
                      label: '',
                      selectedIcon: Icon(IconlyBold.heart, color: Shade.t1)),
                  const NavigationDestination(
                      icon: Icon(IconlyLight.profile),
                      label: '',
                      selectedIcon: Icon(IconlyBold.profile, color: Shade.t1)),
                ]),
          ),
        ));
  }
}
