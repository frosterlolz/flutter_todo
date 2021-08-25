import 'package:flutter/material.dart';
import 'package:flutter_todo/includes/NavBar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  static const String _title = 'Личный кабинет';

  @override
  _ProfileState createState() => _ProfileState();
}

enum MainMenu { Profile, Main, ToDo }

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(Profile._title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              tooltip: 'Профиль', onPressed: () {  },
          )
        ],
      ), // HEADER

      body: Column(
        children: [
          Text('Main Screen', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
