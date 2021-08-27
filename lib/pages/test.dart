import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test>  with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [TabBar(tabs: [Tab(text: 'Новые',), Tab(text: 'Выполненные',)])],
              ),
            ),
          ],


        body: TabBarView(
          children: [
            Home(),
            Icon(Icons.error_outline)
          ],
        ),
        ),
      ),
    );
  }
}
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [TabBar(tabs: [Tab(text: 'Новые',), Tab(text: 'Выполненные',)])],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Icon(Icons.home),
//             Icon(Icons.error_outline)
//           ],
//         ),
//       ),);


