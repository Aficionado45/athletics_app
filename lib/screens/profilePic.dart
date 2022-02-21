import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class profilePic extends StatefulWidget {
  final String uid;
  profilePic(this.uid , {Key key}) : super(key: key);

  @override
  _profilePicState createState() => _profilePicState();
}

class _profilePicState extends State<profilePic> {
  UploadTask task;
  File newProfilePic;
  final _auth=FirebaseAuth.instance;
  final email=FirebaseAuth.instance.currentUser.email;
  final userCollection =FirebaseFirestore.instance.collection("users");
  String uid,image_url;
  void getCurrentUser()async{
    try{
      final user=_auth.currentUser;
      if(user!=null){
        loggedInUser=user;
      }
    }catch(e){
      print(e);
    }
  }
  void initState(){
    super.initState();
    getCurrentUser();
  }
  Future<void> userdata() async{
    final uid= loggedInUser.uid;
    DocumentSnapshot ds= await userCollection.doc(uid).get();
    setState(() {
      image_url=ds.get('image_url');
    });

  }
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    final fileName = newProfilePic!= null?  basename(newProfilePic.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text(
          'Select Profile ',

          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),

          // leading: FlatButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       new MaterialPageRoute(builder: (context) => new HomeScreen()),
          //     );
          //   },
          //   child: Icon(
          //     Icons.arrow_back_sharp,
          //     size: 30,
          //     color: Colors.white,
          //   ),
          // ),
        ),),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(

                onPressed: () {
                  selectFile();

                },child: const Text('Select File'),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF143B40),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              ElevatedButton(

                onPressed: () {
                  uploadFile();
                  Navigator.pushReplacement(context, new MaterialPageRoute(
                      builder: (context) => new MemberInfo()));
                },
                child: const Text('Upload File'),style: ElevatedButton.styleFrom(
                  primary: Color(0xFF143B40),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => newProfilePic = File(path));
  }

   uploadFile()  async {
    if (newProfilePic == null) return;

    final fileName = FirebaseAuth.instance.currentUser.email +".jpg";
    final destination = '/Profile_photos/$fileName';
    updateProfilePic(newProfilePic);
    FirebaseApi.uploadFile(destination, newProfilePic);
    updateProfilePic(newProfilePic);


   }
  Future updateProfilePic(picUrl) async {
    String link= await FirebaseStorage.instance.ref("Profile_photos").child(email+".jpg").getDownloadURL();
    print(link);
    Map<String,dynamic> data=HashMap();
    data['image_url']=link;
    await FirebaseFirestore.instance.collection('users').document(FirebaseAuth.instance.currentUser.uid).update(data);

    // FirebaseAuth.instance.currentUser.updateProfile(photoURL: image_url).then((value){
    //   FirebaseFirestore.instance.collection('users').where(uid).getDocuments().then((doc){
    //     Firestore.instance.doc('/users/${doc.docs[0].documentID}').update({'image_url': picUrl}).then((value) {
    //       print('updated');
    //     }).catchError((e){
    //       print(e);
    //     });
    //   }).catchError((e){
    //     print(e);
    //   });
    // }).catchError((e){
    //   print(e);
    // });
  }

}
class FirebaseApi {
  static UploadTask uploadFile(String destination, File newProfilePic) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      ref.putFile(newProfilePic);



    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
