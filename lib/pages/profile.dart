import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: ListView(
          // удаляет все отступы из listview
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
            decoration: BoxDecoration(
            color: Colors.blue,
        ), child: Text('Здесь можно разместить логотип!'),
        ),
            ListTile(

              title: const Text('Главная'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
            ListTile(
              title: const Text('Мои задачи'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false);
              },
            )
          ],
        )
      ),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(Profile._title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
              },
              icon: const Icon(Icons.account_circle_outlined),
              tooltip: 'Профиль',
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
