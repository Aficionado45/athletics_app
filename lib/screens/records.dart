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
          title: Text("Records",
            style: TextStyle(
              color:Colors.white,
            ),
          ),
          centerTitle: true,
          // ignore: deprecated_member_use
          leading: FlatButton(
            onPressed: () { /* Write listener code here */ },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 36,
              color: Colors.white,// add custom icons also
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_rounded,
                size: 36,
                color: Colors.white,

              ),
            ),
          ],
        ),
        bottomNavigationBar:
        Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(255, 255, 255, 255),
              primaryColor: Colors.red,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(
                      color: Colors
                          .black))),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: 0,
                items: [
                  BottomNavigationBarItem(

                    icon:
                    Icon(Icons.home_rounded,
                      size: 30,
                    ),

                    backgroundColor: Color(0xFF143B40),
                    // ignore: deprecated_member_use
                    title:Text(''),

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.leaderboard,
                      size: 30,
                    ),
                    // ignore: deprecated_member_use
                    title:Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_events_rounded,
                      size: 30,
                    ),

                    // ignore: deprecated_member_use
                    title:Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people,
                      size: 30,
                    ),
                    // ignore: deprecated_member_use
                    title:Text(''),
                  ),
                ],
              ),

            ),
          ),
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
