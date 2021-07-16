import 'package:athletics_app/screens/loginscreeen.dart';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'achievements.dart';
import 'homescreen.dart';
import 'leaderboard.dart';
import 'members.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  @override
  String _email;
  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/athlete.jpeg"), fit: BoxFit.fill),

        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30,0),
                    height: 70,
                    width: MediaQuery.of(context).size.height / 1.8,
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                          TextStyle(color: Colors.white, fontSize: 18),
                          filled: true,
                          fillColor: Color(0xFF143B40),
                          contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE8E8E8)),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        textColor: Colors.white,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF143B40),
                                  Color(0xFF143B40),
                                ],
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: const Text('Send Request',
                              style:
                              TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                        onPressed: () {
                          _auth.sendPasswordResetEmail(email: _email);
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            )));
  }
}