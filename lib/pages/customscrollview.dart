import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/profile.dart';
import 'package:flutter_todo/pages/test.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    MainScreen(),
    Home(), // задачи
    Profile(),
    Test(),
  ];

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(builder: (context) => Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // iconSize: 10,
            // elevation: 0, // отступ
            items: const <BottomNavigationBarItem>
            [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded,), label: 'Главная',),
              BottomNavigationBarItem(icon: Icon(Icons.business_center_rounded),label: 'Задачи',),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Профиль',),
              BottomNavigationBarItem(icon: Icon(Icons.title), label: 'Test')
            ],
            currentIndex: _selectedIndex,
            // selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        )
      )
    );
  }
}
