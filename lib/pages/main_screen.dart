import 'package:flutter/material.dart';
import 'package:flutter_todo/includes/NavBar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'My first Dart Project';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text(_title),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);},
              icon: const Icon(Icons.account_circle_outlined),
              tooltip: 'Профиль',
            )
          ],),
      body: Column(
        children: [
          Text('Main Screen', style: TextStyle(color: Colors.white),),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/todo'); // pushNamed открывает страницу поверх (andremoveuntil- стрелки не будет) (то что сейчас - )
          },
            child: Text('Мои дела'),)
        ],
      ),
    );
  }
}
