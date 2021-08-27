import 'package:flutter_todo/model/user.dart';

class UserPreferences {
  static const myUser = User(
    imagePath: 'assets/images/wedding.jpg',
    name: 'Михаил Котляров',
    email: 'developer@icloud.com',
    about: 'Some info about our program. I guess it helps u to understand... dont know what ;D',
    isDarkMode: false,
  );
}