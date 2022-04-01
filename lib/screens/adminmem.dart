// import 'dart:html';

import 'package:athletics_app/screens/addmember.dart';
import 'package:athletics_app/screens/admininfo.dart';
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



class adminmem extends StatefulWidget {

  @override
  _adminmemState createState() => _adminmemState();
}

class _adminmemState extends State<adminmem> {

  final userCollection =FirebaseFirestore.instance.collection("users");
  String uid;
  var _controller = TextEditingController();

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
                new MaterialPageRoute(builder: (context) => new adInfo()),
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
                  new MaterialPageRoute(builder: (context) => new addmem()),
                );
              },
              icon: Icon(
                Icons.add,
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
                  padding: EdgeInsets.fromLTRB(28, 10,28, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF143B40),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    child: FlatButton(
                      onPressed:
                          () {
                        uid=doc.id;
                        print(uid);
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new MemberScreen(uid)),
                        );
                      },
                      child: Row(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(doc.data()['image_url']),
                          radius: 40,
                        ),
                        Column(children: [
                          Container(
                            alignment: FractionalOffset.centerLeft,
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                            width: MediaQuery.of(context).size.width / 2.4,
                            height: MediaQuery.of(context).size.height / 11,
                            child: Text(
                              doc.data()['name'],
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Container(
                            alignment: FractionalOffset.centerLeft,
                            padding: EdgeInsets.fromLTRB(15, 1, 0, 25),
                            width: MediaQuery.of(context).size.width / 2.4,
                            height: MediaQuery.of(context).size.height / 16,
                            child: Text(
                              doc.data()['batch'],
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ])
                       , IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {
                              uid=doc.id;
                              final collection = FirebaseFirestore.instance.collection('users');
                              collection
                                  .doc(uid)
                                  .delete()
                                  .then((_) => print('Deleted'))
                                  .catchError((error) => print('Delete failed: $error'));},
                          ),
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
