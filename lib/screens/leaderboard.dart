import 'package:flutter/material.dart';




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
            title: Text("Leaderboard",
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

          )

      ) ,
    );
  }
}
