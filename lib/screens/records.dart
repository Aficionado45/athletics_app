import 'package:athletics_app/screens/userinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'achievements.dart';
import 'homescreen.dart';
import 'leaderboard.dart';
import 'members.dart';

_launchURL1() async {
  const url = 'https://drive.google.com/drive/folders/1wG0M66F_kbf9vsxh-SjREeAWC82afEjU?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'https://drive.google.com/drive/folders/1CzxD1xFHyIhiwuEgvxo-fTs65U3wVHf_?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'https://drive.google.com/drive/folders/1D6KH7U4eJmZGFgriLNHJI46-mVPWToHH?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'https://drive.google.com/drive/folders/19kgHu051J_N0oJMSPKiJGk_Ax_cJmvlh?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {
  const url = 'https://drive.google.com/drive/folders/13JBtBXvHYMai0Sdm90XcWM-DFvHGED_L?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}



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
            'Records',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HomeScreen()),
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
              image: AssetImage("assets/background.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 128, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: FlatButton(
                    onPressed: _launchURL1,
                    child: Text('Inter IIT',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white)
                    ),
                  ),
                ),

                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 155, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: FlatButton(
                    onPressed: _launchURL2,
                    child: Text('Spirit',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white)
                    ),
                  ),
                ),

                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 122, 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: FlatButton(
                    onPressed: _launchURL3,
                    child: Text('Spardha',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white)
                    ),
                  ),
                ),

                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 12, 59, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),
                  child: FlatButton(
                    onPressed: _launchURL4,
                    child: Text('Cross Country',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white)
                    ),
                  ),
                ),

                Container(
                  height: 59,
                  width: 306,
                  padding: EdgeInsets.fromLTRB(62, 13, 106, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF143B40),
                  ),

                  child: FlatButton(
                    onPressed: _launchURL5,
                    child: Text('All Others',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white)
                    ),
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
