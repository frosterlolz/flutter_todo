import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo/pages/customscrollview.dart';
import 'package:flutter_todo/themes.dart';
import 'package:flutter_todo/utils/user_preferences.dart';




// void main() => runApp(MaterialApp(
//   theme: ThemeData(
//     primaryColor: Colors.blue.shade300, // основной цвет приложения
//     dividerColor: Colors.black,
//   ),
//   // home: EditProfilePage(),
//   initialRoute: '/',
//   home: Profile(),
//   //home: MainScreen(), // основная страница
//   routes: {
//     // '/': (context) => MainScreen(),
//
//     '/profile': (context) => Profile(),
//     '/customScroller': (context) => BottomNavBar(),
//     '/test': (context) => Test(),
//   },
// ));


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          home: BottomNavBar(),
        ),
      ),
    );
  }
}
