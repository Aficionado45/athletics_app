import 'package:athletics_app/screens/achievements.dart';
import 'package:athletics_app/screens/adminmem.dart';
import 'package:athletics_app/screens/reset.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:athletics_app/screens/leaderboard.dart';
import 'package:athletics_app/screens/precord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'homescreen.dart';
import 'members.dart';

User loggedInUser;
_launchURL1() async {
  const url = 'https://www.facebook.com/athletics.iitg';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url = 'https://www.instagram.com/athletics_iitg/';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

class adInfo extends StatefulWidget {
  @override
  _adState createState() => _adState();
}

class _adState extends State<adInfo> {
  final _auth=FirebaseAuth.instance;
  final userCollection =FirebaseFirestore.instance.collection("users");
  String name,email,uid;
  void getCurrentUser()async{
    try{
      final user=_auth.currentUser;
      if(user!=null){
        loggedInUser=user;
      }
    }catch(e){
      print(e);
    }
  }

  void initState(){
    super.initState();
    getCurrentUser();
  }
Future<void> userdata() async{
    final uid= loggedInUser.uid;
    DocumentSnapshot ds= await userCollection.doc(uid).get();
    name=ds.get('name');
    email=ds.get('email');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text(
          'Admin Panel',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new HomeScreen()),
            );
          },

        ),

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/athlete.jpeg"), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Icon(
                Icons.account_circle_rounded,
                size: 68,
              ),
            ),

            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 350,
              height: 58,

              padding: EdgeInsets.fromLTRB(19, 0, 0, 0),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new adminmem()));
                },
                child: Text(
                  'Add/Remove Profiles',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 350,
              height: 58,

              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              // ignore: deprecated_member_use
              child: Row(
                children: [
                  FlatButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Athelete of the month',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(70, 0, 0, 0)),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.center,
              width: 350,
              height: 58,

              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushNamed(context,'login');
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: _launchURL1,
                    child: Container(
                        child: Image.asset(
                      'assets/fb.jpg',
                      height: 52,
                      width: 52,
                    )),
                  ),

                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: _launchURL2,
                    child: Container(
                        child: Image.asset(
                      'assets/insta.png',
                      height: 40,
                      width: 40,
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
