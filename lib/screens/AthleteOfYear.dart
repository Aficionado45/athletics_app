import 'package:athletics_app/screens/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'leaderboard.dart';
import 'achievements.dart';
import 'homescreen.dart';
import 'members.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'memberScreen.dart';

class AthleteOfYear extends StatefulWidget {


  @override
  _AthleteOfYearState createState() => _AthleteOfYearState();
}

class _AthleteOfYearState extends State<AthleteOfYear> {
  final userCollection =FirebaseFirestore.instance.collection("users");
  String uid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF143B40),
          title: Text(
            'Athlete Of Year',
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/athlete.jpeg"), fit: BoxFit.fill),
          ),

        ),
      ),
    );
  }
}
