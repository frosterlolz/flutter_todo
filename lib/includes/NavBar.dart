import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';


var count = Home;

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  accountEmail: Text('developer@icloud.com'),
                  accountName: Text('Developer'),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset('assets/images/wedding.jpg',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      )
                    ),
                  ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/NavBarBack.jpg'),
                  )
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_rounded),
                title: const Text('Главная'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box_rounded),
                title: const Text('Профиль'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
                },
              ),
              ListTile(
                leading: Icon(Icons.business_center_rounded),
                title: const Text('Мои задачи'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false);
                },
                trailing: ClipOval(
                  child: Container(
                    color: Colors.red,
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        '4',
                        style: TextStyle(color: Colors.white, fontSize: 12),),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.expand),
                title: const Text('Скроллер'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/customScroller', (route) => false);
                },
              ),
            ],
          )
    );
  }
}

