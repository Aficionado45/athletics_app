import 'package:athletics_app/authentication_service.dart';
import 'package:athletics_app/screens/Alumni.dart';
import 'package:athletics_app/screens/members.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) =>context.read<AuthenticationService>().authStateChanges,
      ),
    ],
    child:MaterialApp(
      home: AuthenticationWrapper(),
      initialRoute: 'record',
      routes:{
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
    ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser=context.watch<User>();
    if(firebaseUser!=null){
      return HomeScreen();
    }
    return login();

  }
}



