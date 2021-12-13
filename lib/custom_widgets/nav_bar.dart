import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class NavBar extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<NavBar> {
  @override

  int _pageIndex = 0;
  PageController pageController = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
      ),

      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>
      [
        BottomNavigationBarItem(icon: Icon(IconlyLight.home)),
        BottomNavigationBarItem(icon: Icon(IconlyLight.search)),
        BottomNavigationBarItem(icon: Icon(IconlyLight.notification)),
        BottomNavigationBarItem(icon: Icon(IconlyLight.heart)),
        BottomNavigationBarItem(icon: Icon(IconlyLight.profile)),
        
      ],
      currentIndex: _pageIndex,
      ),
    );
  }
}