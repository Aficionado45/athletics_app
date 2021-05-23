import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:gallery(),
  ));
}

class gallery extends StatefulWidget {
  @override
  _galleryState createState() => _galleryState();
}

class _galleryState extends State<gallery> {
  int _currentindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text("Gallery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
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
            icon: Icon(
              Icons.account_circle_rounded,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
        body:Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/athlete.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                    child: Icon(Icons.home_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),

                  backgroundColor: Color(0xFF143B40),
                  // ignore: deprecated_member_use
                  title:Text(''),

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard,
                    size: 30,
                    color: Colors.white,
                  ),
                  // ignore: deprecated_member_use
                  title:Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events_rounded,
                    size: 30,
                    color: Colors.white,
                  ),

                  // ignore: deprecated_member_use
                  title:Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people,
                    size: 30,
                    color: Colors.white,
                  ),
                  // ignore: deprecated_member_use
                  title:Text(''),
                ),
              ],
            ),

          ),
        ),
      ),



    );
  }
}
