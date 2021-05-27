import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  String _email, _password;

  checkAuthentication() async{
    _auth.onAuthStateChanged.listen((user) {
      if(user!=null){
        Navigator.pushNamed(context, 'homescreen');
      }
    });
  }
  @override
  void initState()
  {
    super.initState();
    this.checkAuthentication();
  }

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
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty)
                      {return 'Enter Email';}
                    return null;
                    },
                decoration: InputDecoration(
                  labelText: 'Email-ID',
                  prefixIcon: Icon(Icons.email),
                ),
                  onSaved: (value) => _email = value

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
              child: Form(
                key: _formKey,
                child: TextFormField(
                    validator: (value){
                      if(value.isEmpty)
                      {return 'Enter Email';}
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),

                    ),
                    obscureText: true,
                    onSaved: (value) => _password = value

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


              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: (){
                   Navigator.pushNamed(context, 'homescreen');
                },
                child:Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),

                ),
              ),

            ),

          ],
        ),
      ),






    );
  }
}
