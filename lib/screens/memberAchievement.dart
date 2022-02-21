import 'dart:ffi';


import 'package:athletics_app/screens/userinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'achievements.dart';
import 'homescreen.dart';
import 'leaderboard.dart';
import 'memberScreen.dart';
import 'members.dart';

class MemberAchievement extends StatefulWidget {
  final String uid;
  MemberAchievement(this.uid, {Key key}): super(key: key);

  @override
  _MemberAchievementState createState() => _MemberAchievementState();
}



class _MemberAchievementState extends State<MemberAchievement> {
  final userCollection =FirebaseFirestore.instance.collection("users");
  String name,batch,image_url;
  List <String> achieve=[];
  Future<void> userdata() async{
    DocumentSnapshot ds= await userCollection.doc(widget.uid).get();
    setState(() {
      name=ds.get('name');
      batch=ds.get('batch');
      achieve=List.from(ds.get('achieve'));
      image_url=ds.get('image_url');
    });


  }

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF143B40),
          title: Text(
            'Achievement',
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
                        backgroundImage: NetworkImage("$image_url"),
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
                              // if(snapshot.connectionState!=ConnectionState.done)
                              //   return Text("Loading");
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
                              // if(snapshot.connectionState!=ConnectionState.done)
                              //   return Text("Loading");
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
                    height: 30
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF143B40),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.topLeft,
                  width: 350,
                  height: 350,
                  padding: EdgeInsets.fromLTRB(25, 12, 0, 20),
                  child: FutureBuilder(
                    future: userdata(),
                    builder: (context, snapshot) {
                      // if (snapshot.connectionState != ConnectionState.done)
                      //   return Text("Loading");
                      return ListView.builder(
                        itemCount: achieve.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('${achieve[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
