import 'package:athletics_app/screens/achievements.dart';
import 'package:athletics_app/screens/loginscreeen.dart';
import 'package:athletics_app/screens/profilePic.dart';
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

class MemberInfo extends StatefulWidget {
  @override
  _MemberInfoState createState() => _MemberInfoState();
}

class _MemberInfoState extends State<MemberInfo> {
  final _auth=FirebaseAuth.instance;
  final userCollection =FirebaseFirestore.instance.collection("users");
  String name,email,uid,image_url;
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
    setState(() {
      name=ds.get('name');
      email=ds.get('email');
      image_url=ds.get('image_url');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text(
          'User Info',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(
              context
            );
          },
          child: Icon(
            Icons.arrow_back_sharp,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new MemberInfo()),
              );
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
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
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new profilePic(uid)),
              );
            },
            child: CircleAvatar(

              backgroundImage: NetworkImage("$image_url"),
              radius: 60,
            ),
          ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 350,
              height: 58,

              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              // ignore: deprecated_member_use
              child: Row(
                children: [
                  FutureBuilder(
                    future: userdata(),
                    builder: (context,snapshot){
                      // if(snapshot.connectionState!=ConnectionState.done)
                      //   return Text("Loading");
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
              width: 350,
              height: 58,

              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              // ignore: deprecated_member_use
              child: Row(
                children: [
                  FutureBuilder(
                    future: userdata(),
                    builder: (context,snapshot){
                      // if(snapshot.connectionState!=ConnectionState.done)
                      //   return Text("Loading");
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
                          builder: (context) => new ResetScreen()));
                },
                child: Text(
                  'Change Password',
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
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new precord()),
                      );
                    },
                    child: Text(
                      'Daily Records',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(70, 0, 0, 0)),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, new MaterialPageRoute(
                          builder: (context) => new precord()),
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.white, // add custom icons also
                    ),
                  )
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

              child: FlatButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => login()
                      ),
                  );
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
              alignment: FractionalOffset.center,
              width: 303,
              height: 58,
              color: Colors.transparent,
              child: Text(
                'Follow us on',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF143B40),
                  fontSize: 21,
                ),
              ),
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(255, 255, 255, 255),
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.black))),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new HomeScreen()),
                        );
                      },
                      icon: Icon(Icons.home),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                  ),

                  backgroundColor: Color(0xFF143B40),
                  // ignore: deprecated_member_use
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Leaderboard()),
                      );
                    },
                    icon: Icon(Icons.leaderboard),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  // ignore: deprecated_member_use
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Achievement()),
                      );
                    },
                    icon: Icon(Icons.emoji_events_rounded),
                    color: Colors.white,
                    iconSize: 30,
                  ),

                  // ignore: deprecated_member_use
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Members()),
                      );
                    },
                    icon: Icon(Icons.group_rounded),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  // ignore: deprecated_member_use
                  title: Text(''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
