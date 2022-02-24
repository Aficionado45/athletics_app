import 'dart:async';
import 'package:athletics_app/screens/homescreen.dart';
import 'package:athletics_app/screens/reset.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verification.dart';

import 'achievements.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final _auth = FirebaseAuth.instance;
  String email,password,uid,type;
  User loggedInUser;

  void initState() {
    super.initState();
  }
  final userCollection =FirebaseFirestore.instance.collection("users");
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBCECFF),
      body:Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(

        ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                      alignment: FractionalOffset.centerLeft,
                      width: 303,

                      color: Colors.transparent,
                      child:Text('Welcome',
                          style: TextStyle(
                            color: Colors.black,
                          fontSize: 30,

                        ),

                      ),
                    ),
                Container(
                  alignment: FractionalOffset.topLeft,
                  width: 303,

                  color: Colors.transparent,
                  child:Text('Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,

                    ),

                  ),
                ),


                SizedBox(
                  height: 30,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF02386E),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.centerLeft,
                  width: 303,
                  height: 59,
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child:TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (value){
                      if(value.isEmpty)
                        return null;
                      else{
                        email=value;
                      }
                  },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                      labelText: "Email",

                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
               Container(
                 decoration: BoxDecoration(
                   color: Color(0xFF02386E),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                 alignment: FractionalOffset.centerLeft,
                 width: 303,
                 height: 59,
                 padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                 child: TextField(
                   obscureText: true,
                   style: TextStyle(
                     color: Colors.white,
                   ),
                   keyboardType: TextInputType.emailAddress,
                   textAlign: TextAlign.start,
                   onChanged: (value){
                     if(value.isEmpty)
                       return null;
                     else{
                       password=value;
                     }
                   },
                   decoration: InputDecoration(
                     fillColor: Colors.white,
                     labelStyle: TextStyle(
                         color: Colors.white,
                         fontSize: 20
                     ),
                     labelText: "Password",

                   ),
                 ),

               ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: FractionalOffset.centerLeft,
                  width: 303,
                  height: 70,
                  color: Colors.transparent,
                  // ignore: deprecated_member_use
                  child:FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                          builder: (context) => new ResetScreen()));
                    },
                    child:Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),

                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF02386E),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.center,
                  width: 110,
                  height: 40,
                  child: FlatButton(
                    onPressed: () async{
                      try{
                        final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user!=null){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new HomeScreen()),
                          );
                        }
                      }      catch(e){
                        print(e);
                      }

                    },
                    child: Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    ),
                  ),

                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF02386E),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.center,
                  width: 150,
                  height: 40,
                  child: FlatButton(
                    onPressed: () async{
                      try{
                        final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user!=null){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new veri()),
                          );
                        }
                      }      catch(e){
                        print(e);
                      }

                    },
                    child: Text("Admin Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
      );
  }
}
