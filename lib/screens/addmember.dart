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

class addmem extends StatefulWidget {
  @override
  _addmemState createState() => _addmemState();
}

class _addmemState extends State<addmem> {
  final _auth=FirebaseAuth.instance;
  final userCollection =FirebaseFirestore.instance.collection("users");
  String name,email,uid,type,batch;
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text(
          'Add member',
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
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: FractionalOffset.centerLeft,
                width: 400,
                height: 5),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF02386E),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 303,
              height: 59,
              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: TextField(
                controller: _controller1,
                obscureText: false,
                style: TextStyle(
                  color: Colors.white,
                ),

                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onChanged: (value){
                  if(value.isEmpty)
                    return null;
                  else{
                   name=value;
                  }
                },
                decoration: InputDecoration(

                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                  labelText: "Name",

                ),
              ),

            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF02386E),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 303,
              height: 59,
              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: TextField(
                controller: _controller2,
                obscureText: false,
                style: TextStyle(
                  color: Colors.white,
                ),

                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onChanged: (value){
                  if(value.isEmpty)
                    return null;
                  else{
                    email=value;
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                  labelText: "Email",

                ),
              ),

            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF02386E),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 303,
              height: 59,
              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: TextField(
                obscureText: false,
                style: TextStyle(
                  color: Colors.white,
                ),
                controller: _controller3,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onChanged: (value){
                  if(value.isEmpty)
                    return null;
                  else{
                    batch=value;
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                  labelText: "Batch",

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
              alignment: FractionalOffset.center,
              width:303,
              height: 58,

              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              // ignore: deprecated_member_use
              child: FlatButton(

                onPressed: (){
                  _controller1.clear();
                  _controller2.clear();
                  _controller3.clear();
                  FirebaseFirestore.instance.runTransaction((transaction) async {
                    await transaction.set(FirebaseFirestore.instance.collection("users").doc(), {
                      'name': name,
                      'email': email,
                      'batch': batch,
                    });
                  });
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


          ],
        ),
      ),

    );
  }
}
