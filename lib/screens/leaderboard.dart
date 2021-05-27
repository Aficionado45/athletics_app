import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  int _currentindex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF143B40),
            title: Text(
              'Leaderboard',
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
                onPressed: (){
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
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/calender.jpg',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Calender',
                        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 22.0),
                      )),
                ],
              ),

          ),
          )

     
    );
  }
}
