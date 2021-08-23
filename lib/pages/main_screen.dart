import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'My first Dart Project';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(title: const Text(_title), centerTitle: true), // HEADER
        body: Column(
          children: [
            Text('Main Screen', style: TextStyle(color: Colors.white),),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/todo'); // pushNamed открывает страницу поверх (andremoveuntil- стрелки не будет) (то что сейчас - )
            },
              child: Text('Перейти далее'),)
          ],
        ),
    );
  }
}
