import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/loginscreeen.dart';
import 'screens/photogallery.dart';
import 'screens/userinfo.dart';
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
         'welcome':(context) => Welcome(),
        'user':(context) => MemberInfo(),
        'gallery':(context) => gallery(),
        'login':(context) => login(),

      },
    );
  }
}


