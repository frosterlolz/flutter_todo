import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(tabs: [
                Tab(
                  text: 'Новые',
                ),
                Tab(
                  text: 'Выполненные',
                )
              ])
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.home),
            Icon(Icons.error_outline)
          ],
        ),
      ),);
  }
}

