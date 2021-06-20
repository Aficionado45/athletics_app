import 'package:athletics_app/screens/Attendance.dart';
import 'package:athletics_app/screens/DailyPracticeRecords.dart';
import 'package:athletics_app/screens/Statistics.dart';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'achievements.dart';
import 'homescreen.dart';
import 'leaderboard.dart';
import 'memberAchievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'members.dart';

class MemberScreen extends StatefulWidget {

  final String uid;
  MemberScreen(this.uid, {Key key}): super(key: key);

  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final userCollection =FirebaseFirestore.instance.collection("users");
  String name,batch;

  Future<void> userdata() async{
    DocumentSnapshot ds= await userCollection.doc(widget.uid).get();
    name=ds.get('name');
    batch=ds.get('batch');

  }

    @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF143B40),
          title: Text(
            "Member",
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
                new MaterialPageRoute(builder: (context) => new Members()),
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
          child: SingleChildScrollView(
            child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.centerLeft,
                  width: 400,
                  height: 10),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF143B40),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: FractionalOffset.centerLeft,
                width: 350,
                height: 120,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 40,
                    ),

                    // Icons.image,
                    // color: Colors.white,
                    // size: 30,
                    SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        ),
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
                        SizedBox(height: 15),
                        FutureBuilder(
                          future: userdata(),
                          builder: (context,snapshot){
                            if(snapshot.connectionState!=ConnectionState.done)
                              return Text("Loading");
                            return Text("$batch",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.centerLeft,
                  width: 400,
                  height: 30),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF143B40),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: FractionalOffset.topLeft,
                width: 350,
                height: 380,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        alignment: FractionalOffset.centerLeft,
                        width: 420,
                        height: 35),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: FractionalOffset.centerLeft,
                      width: 320,
                      height: 55,             //change it back to 55
                      padding: EdgeInsets.fromLTRB(25, 12, 0, 20),

                      child:FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new MemberAchievement(widget.uid)),
                          );
                        },
                        child: Text(
                          'Achievement',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[850],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: FractionalOffset.centerLeft,
                      width: 320,
                      height: 55,
                      padding: EdgeInsets.fromLTRB(25, 12, 0, 20),
                      child:FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Attendance(widget.uid)),
                          );
                        },
                        child: Text(
                          'Attendance',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[850],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: FractionalOffset.centerLeft,
                      width: 320,
                      height: 55,
                      padding: EdgeInsets.fromLTRB(25, 12, 0, 20),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Statistics(widget.uid)),
                          );
                        },
                        child: Text(
                          'Statistics',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[850],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: FractionalOffset.centerLeft,
                      width: 320,
                      height: 55,
                      padding: EdgeInsets.fromLTRB(25, 12, 0, 20),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new DailyPracticeRecords(widget.uid)),
                          );
                        },
                        child: Text(
                          'Daily Practice Records',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[850],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      ),
    );
  }
}
