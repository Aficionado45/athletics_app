// import 'dart:html';

import 'package:athletics_app/screens/memberScreen.dart';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'achievements.dart';
import 'homescreen.dart';
import 'leaderboard.dart';
import 'memberScreen.dart';
import 'package:path/path.dart';

import 'memberScreen.dart';



class Members extends StatefulWidget {

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {

  final userCollection =FirebaseFirestore.instance.collection("users");
  String uid;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF143B40),
          title: Text(
            "Members",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          // ignore: deprecated_member_use
          leading: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HomeScreen()),
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
                          Navigator.push(
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
                        Navigator.push(
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
                        Navigator.push(
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
                        Navigator.push(
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/athlete.jpeg"), fit: BoxFit.fill),
          ),
          child: StreamBuilder(
              stream:
              FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(

                  children: snapshot.data.docs.map((doc) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF143B40),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        child: FlatButton(
                          onPressed:
                          () {
                            uid=doc.id;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (context) => new MemberScreen(uid)),
                            );
                          },
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/logo.png'),
                              radius: 40,
                            ),

                            Column(children: [
                              Container(
                                alignment: FractionalOffset.centerLeft,
                                padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                                width: MediaQuery.of(context).size.width / 2.4,
                                height: MediaQuery.of(context).size.height / 11,


                              ),
                              Container(
                                alignment: FractionalOffset.centerLeft,
                                padding: EdgeInsets.fromLTRB(15, 1, 15, 25),
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.height / 17,

                              ),
                            ]),
                          ]),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
