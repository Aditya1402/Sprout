import 'package:flutter/material.dart';
import 'package:sprout/firebase/userInfo.dart';
import 'package:sprout/pages/SearchPage.dart';
import 'package:sprout/pages/homePage.dart';
import 'package:sprout/pages/profile.dart';
import 'package:sprout/pages/reminder.dart';
import '../model_data/colors.dart';
class NavHome extends StatefulWidget {


  @override
  _NavHomeState createState() => _NavHomeState();

}

class _NavHomeState extends State<NavHome> {
  int index = 0;
final screens = [
   HomePage(),
   const SearchPage(),
   Reminder(),
   const ProfilePage(),
];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar:
      NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Shade.moss
        ),
        child: NavigationBar(
          height: 56,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: index,
          onDestinationSelected: (index)=>
              setState(() =>this.index=index),
          destinations:  [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home',selectedIcon: Icon(Icons.home),),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search',selectedIcon: Icon(Icons.search),),
            NavigationDestination(icon: Icon(Icons.notifications_outlined), label: 'Reminders',selectedIcon: Icon(Icons.notifications),),
            NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile',selectedIcon: Icon(Icons.person),),
          ],
        ),
      ),
    );
  }
}
