import 'package:athletics_app/screens/Alumni.dart';
import 'package:athletics_app/screens/photogallery.dart';
import 'package:athletics_app/screens/records.dart';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'achievements.dart';
import 'leaderboard.dart';
import 'members.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text(
          'Athletics App',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,


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
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: FractionalOffset.centerLeft,
                width: 420,
                height: 59),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 320,
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new gallery()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 40.0),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,

                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 320,
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child:FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Alumni()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.whatshot_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 40.0),
                    Text(
                      'Alumni',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,

                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 320,
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child:FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Records()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.article_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 40.0),
                    Text(
                      'Records',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,

                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 320,
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child:FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Members()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.group_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 40.0),
                    Text(
                      'Members',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,

                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 320,
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child:FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Achievement()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 40.0),
                    Text(
                      'Achievements',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,

                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF143B40),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: FractionalOffset.centerLeft,
              width: 320,
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child:FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Leaderboard()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.leaderboard,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 40.0),
                    Text(
                      'Leaderboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,

                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
