import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/profile.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.lightBlue[700], // основной цвет приложения
  ),
  initialRoute: '/',
  //home: MainScreen(), // основная страница
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home(),
    '/profile': (context) => Profile(),
  },
));