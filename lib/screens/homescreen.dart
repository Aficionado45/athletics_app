import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

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
        leading: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, 'homescreen');
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
              Navigator.pushNamed(context, 'user');
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
                  Navigator.pushNamed(context, 'gallery');
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
                        fontWeight: FontWeight.bold,
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
                  Navigator.pushNamed(context, 'alumni');
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
                      fontWeight: FontWeight.bold,
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
                  Navigator.pushNamed(context, 'record');
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
                      fontWeight: FontWeight.bold,
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
                  Navigator.pushNamed(context, 'memberlist');
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
                      fontWeight: FontWeight.bold,
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
                  Navigator.pushNamed(context, 'achievement');
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
                      fontWeight: FontWeight.bold,
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
                  Navigator.pushNamed(context, 'leaderboard');
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
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ),),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'homescreen');
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
                Navigator.pushNamed(context, 'leaderboard');
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
                Navigator.pushNamed(context, 'achievement');
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
                Navigator.pushNamed(context, 'memberlist');
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
    );
  }
}
