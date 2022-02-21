
import 'dart:collection';
import 'dart:ffi';

import 'package:athletics_app/screens/Attendance.dart';
import 'package:athletics_app/screens/DailyPracticeRecords.dart';
import 'package:athletics_app/screens/Statistics.dart';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'achievements.dart';
import 'homescreen.dart';
import 'leaderboard.dart';
import 'memberAchievement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'members.dart';
User loggedInUser;
class precord extends StatefulWidget {
  @override
  _precordState createState() => _precordState();
}

class _precordState extends State<precord> {
  final _auth=FirebaseAuth.instance;
  var _controller = TextEditingController();
  final userCollection =FirebaseFirestore.instance.collection("users");
  String name,batch,uid,image_url;
  String title;
  List<String> daily;
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
      batch=ds.get('batch');
      image_url=ds.get('image_url');
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF143B40),
          title: Text(
            "Daily Record",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          // ignore: deprecated_member_use
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
                    height: 30),
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
                    height: 30),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF143B40),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.topLeft,
                  width: 350,
                  height: 340,
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
                          height: 45),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        alignment: FractionalOffset.centerLeft,
                        width: 320,
                        height: 210,             //change it back to 55
                        padding: EdgeInsets.all(10),
                        child:TextField(
                          controller: _controller,
                          onChanged: (value){
                            setState(() {
                              title=value;
                            });
                          },
                          autocorrect: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            hintText: 'Daily Events',

                          ),

                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(onPressed:  ()  async{
                        _controller.clear();
                        String UID= FirebaseAuth.instance.currentUser.uid;
                        DocumentSnapshot data=await Firestore.instance.collection("users").document(UID).get();
                        List<dynamic> list=data['daily'];
                        print(list);
                        var now = new DateTime.now();
                        var formatter = new DateFormat('dd-MM-yyyy');
                        String formattedDate = formatter.format(now);
                        String record= formattedDate.toString() +" "+title;
                        list.add(record);
                        Map<String,dynamic> d=HashMap();
                        d['daily']=list;
                        await FirebaseFirestore.instance.collection('users').document(FirebaseAuth.instance.currentUser.uid).update(d);
                      }, child: Text('Add'))

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
      ),
    );

  }

}
