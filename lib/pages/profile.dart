import 'package:flutter/material.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/utils/user_preferences.dart';
import 'package:flutter_todo/widget/appbar_widget.dart';
import 'package:flutter_todo/widget/profile_widget.dart';
import 'package:flutter_todo/widget/numbers_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

enum MainMenu { Profile, Main, ToDo }

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24), // отступ
          buildName(user),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
      user.name,
      style: TextStyle(fontWeight:FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Обо мне',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}
