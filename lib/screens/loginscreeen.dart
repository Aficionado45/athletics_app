import 'dart:async';
import 'package:athletics_app/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';



class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController emailcontroller= TextEditingController();
  final TextEditingController passwordcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/athlete.jpeg"),
            fit: BoxFit.fill,
          ),
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
                            color: Color(0xFF143B40),
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
                      color: Color(0xFF143B40),
                      fontSize: 30,

                    ),

                  ),
                ),


                SizedBox(
                  height: 30,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF143B40),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.centerLeft,
                  width: 303,
                  height: 59,
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child:TextField(
                    controller: emailcontroller,
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                  color: Color(0xFF143B40),
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
                   controller: passwordcontroller,
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
                    onPressed: (){},
                    child:Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color(0xFF143B40),
                        fontSize: 18,
                      ),

                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF143B40),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: FractionalOffset.center,
                  width: 110,
                  height: 40,
                  child: FlatButton(
                    onPressed: (){
                      context.read<AuthenticationService>().signIn(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim(),
                      );
                    },
                    child: Text("Login",
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
