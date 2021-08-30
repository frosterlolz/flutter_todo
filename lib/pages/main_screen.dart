import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'Новости';

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(builder: (context) =>Scaffold(
        //drawer: NavBar(),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text(_title),
          centerTitle: true,
        ),
      body: Text('НОВОСТИ')
    ),
    ),
    );
  }
}
