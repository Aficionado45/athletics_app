import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
  super.initState();
  new Future.delayed(const Duration(seconds: 3), () {
  Navigator.pushNamed(context, 'login');
  });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height:120.0),
              Container(
                width: 200,
                margin: EdgeInsets.fromLTRB(100, 100, 100, 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/logo.jpeg'),
                ),
              ),

              Text('ATHLETICS CLUB',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black38,
                      offset: Offset(3.0,3.0),

                    ),
                  ],
                ),
              ),
              Text('IIT GUWAHATI',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black38,
                      offset: Offset(3.0,3.0),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

