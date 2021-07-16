import 'package:athletics_app/screens/AthleteOfMonth.dart';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:athletics_app/screens/AthleteOfYear.dart';

import 'achievements.dart';
import 'homescreen.dart';
import 'members.dart';



class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {

  final leaderboardCollection =FirebaseFirestore.instance.collection("leaderboard");
  int _currentindex=0;
  //List<String> _year = ['2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2024','2025','2026','2027','2028','2029','2030','2031','2032','2033','2034','2035','2036','2037','2038','2039','2040'];
  var selectedYear;

  List<String> _month = ['January', 'February' , 'March' , 'April' , 'May' , 'June' , 'July' , 'August' , 'September' , 'October' , 'November' , 'December' ];
  String _selectedMonth;

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
              children: [
                SizedBox(height: 80),
                Container(
                  height: 78,
                  width: 185,
                  decoration: BoxDecoration(
                    color: Color(0xFF143B40),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),
                  ),
                 // padding: EdgeInsets.fromLTRB(47, 26, 47, 15),
                  child: Center(
                    child: Text("Calender",
                      style:TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 86,
                  width: 185,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(45, 22, 34, 15),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("leaderboard").snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot){
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator());
                      }
                      else{
                        List<DropdownMenuItem> leaderboarditems=[];
                        for(int i=0;i<snapshot.data.docs.length;i++){
                          DocumentSnapshot snap=snapshot.data.docs[i];
                          leaderboarditems.add(
                            DropdownMenuItem(
                                child: Text(
                                  snap.id,
                                ),
                                value:"${snap.id}",
                            )
                          );
                        }
                        return DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Center(
                              child: Text("Year",
                                style:TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                              items: leaderboarditems,
                          onChanged: (yearValue){
                                setState(() {
                                  selectedYear=yearValue;
                                });
                          },
                          value: selectedYear,
                            isExpanded: false,
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  height: 78,
                  width: 185,
                  decoration: BoxDecoration(
                    color: Color(0xFF143B40),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),
                  ),
                  //padding: EdgeInsets.fromLTRB(47, 26, 47, 15),
                  child: Center(
                    child: Text("Calender",
                      style:TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 86,
                  width: 185,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(45, 17, 0, 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text("Month",
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                      elevation: 10,
                      value: _selectedMonth,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMonth = newValue;
                        });
                      },
                      items: _month.map((month) {
                        return DropdownMenuItem(
                          child: new Text(month,
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          value: month,
                        );
                      }).toList(),
                    ),
                  ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new AthleteOfYear()),
                        );//navigate
                      },*/
/*child: DropdownButtonHideUnderline(
child: DropdownButton(
hint: Center(
child: Text("Year",
style:TextStyle(
fontSize: 23,
color: Colors.black,
),
),
),
value: _selectedYear,
onChanged: (newValue) {
setState(() {
_selectedYear = newValue;
});
},
items: _year.map((year) {
return DropdownMenuItem(
child: Center(
child: new Text(year,
style: TextStyle(
fontSize: 23,
),
),
),
value: year,
);
}).toList(),
),
),*/