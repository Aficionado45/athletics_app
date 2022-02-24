import 'package:athletics_app/screens/achievements.dart';
import 'package:athletics_app/screens/admininfo.dart';
import 'package:athletics_app/screens/loginscreeen.dart';
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

class veri extends StatefulWidget {
  @override
  _veriState createState() => _veriState();
}

class _veriState extends State<veri> {
  final _auth=FirebaseAuth.instance;
  final userCollection =FirebaseFirestore.instance.collection("users");
  String name,email,uid,type;
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
    type=ds.get('type');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text(
          'Verifying user',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,


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
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 400,
              height: 58,

              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              // ignore: deprecated_member_use
              child: Row(
                children: [
                  FutureBuilder(
                    future: userdata(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState!=ConnectionState.done)
                        return Text("Loading");
                      return Text("$name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),);
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(110, 0, 0, 0)),

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
              alignment: FractionalOffset.centerLeft,
              width: 400,
              height: 58,

              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              // ignore: deprecated_member_use
              child: Row(
                children: [
                  FutureBuilder(
                    future: userdata(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState!=ConnectionState.done)
                        return Text("Loading");
                      return Text("$email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),);
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(110, 0, 0, 0)),

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
              width: 400,
              height: 58,

              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: (){
                  if(type=='admin'){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new adInfo()),
                    );
                  }
                  else {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new login()),
                    );
                  }
                },
                child: Text(
                  'Continue',
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
