import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  int _currentindex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 158, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: Text('Inter IIT',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white)
                  ),
                ),
                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 188, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: Text('Spirit',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white)
                  ),
                ),
                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 143, 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: Text('Spardha',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white)
                  ),
                ),
                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 12, 92, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: Text('Cross Country',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white)
                  ),
                ),
                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 139, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: Text('All Others',
                      style: TextStyle(
                          fontSize: 24,
                        color: Colors.white)
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
