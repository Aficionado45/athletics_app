

import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String>signIn({String email,String password})async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    }
    on FirebaseAuthException catch (e){
      return e.message;
    }
  }

}