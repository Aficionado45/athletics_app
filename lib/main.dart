import 'package:athletics_app/screens/Alumni.dart';
import 'package:athletics_app/screens/members.dart';
import 'package:flutter/material.dart';
import 'screens/records.dart';
import 'screens/welcome.dart';
import 'screens/loginscreeen.dart';
import 'screens/photogallery.dart';
import 'screens/userinfo.dart';
import 'screens/leaderboard.dart';
import 'screens/achievements.dart';
import 'screens/homescreen.dart';
import 'screens/members.dart';
import 'screens/Alumni.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome',
      routes: {
        //Add all the page navigation references here to navigate across screens.
        'user':(context) => MemberInfo(),
        'gallery':(context) => gallery(),
        'login':(context) => login(),
        'welcome':(context) => WelcomeScreen(),
        'record':(context) => Records(),
        'leaderboard':(context) => Leaderboard(),
        'achievement':(context) => Achievement(),
        'homescreen': (context) => HomeScreen(),
        'memberlist' : (context)=> Members(),
        'alumni':(context)=> Alumni(),


      },
    );
  }
}


