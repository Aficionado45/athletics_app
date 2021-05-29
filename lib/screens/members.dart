import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Members extends StatefulWidget {
  const Members({Key key}) : super(key: key);

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
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
              Navigator.pushNamed(context, 'homescreen');
            },
            child: Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: Colors.white, // add custom icons also
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'user');
              },
              icon: Icon(
                Icons.account_circle_rounded,
                size: 30,
                color: Colors.white,
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
                  height: 10),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF143B40),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: FractionalOffset.topLeft,
                width: 320,
                height: 100,
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
                    SizedBox(width: 40.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        ),
                        Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,

                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Batch',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}
