import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/profile.dart';
import 'package:flutter_todo/pages/customscrollview.dart';
import 'package:flutter_todo/pages/test.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blue.shade300, // основной цвет приложения
    dividerColor: Colors.black,
  ),
  // home: EditProfilePage(),
  initialRoute: '/',
  //home: MainScreen(), // основная страница
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home(),
    '/profile': (context) => Profile(),
    '/customScroller': (context) => BottomNavBar(),
    '/test': (context) => Test(),
  },
));

// продолжить с ВИДЕО https://www.youtube.com/watch?v=ZfSiFtT0z_I