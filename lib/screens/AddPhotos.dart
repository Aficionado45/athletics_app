import 'dart:io';
import 'dart:typed_data';
import 'package:athletics_app/screens/photogallery.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({Key key}) : super(key: key);

  @override
  _AddPhotosState createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  UploadTask task;
  File file;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    final fileName = file != null ? basename(file.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        title: Text(


          'Add Photos',

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
                      builder: (context) => new gallery()));
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

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file.path);
    final destination = '/TeamPhotos/$fileName';

    FirebaseApi.uploadFile(destination, file);
    setState(() {});
  }

//   Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
//     stream: task.snapshotEvents,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         final snap = snapshot.data;
//         final progress = snap.bytesTransferred / snap.totalBytes;
//         final percentage = (progress * 100).toStringAsFixed(2);
//
//         return Text(
//           '$percentage %',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         );
//       } else {
//         return GestureDetector(onTap: (){
//           Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> new gallery()));
//         },child: Container());
//       }
//     },
//   );
// }
// class ButtonWidget extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final VoidCallback onClicked;
//
//   const ButtonWidget({
//     Key key,
//      this.icon,
//      this.text,
//      this.onClicked,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       primary: Color(0xFF143B40),
//       minimumSize: Size.fromHeight(50),
//     ),
//     child: buildContent(),
//     onPressed: onClicked,
//   );
//
//   Widget buildContent() => Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Icon(icon, size: 28),
//       SizedBox(width: 16),
//       Text(
//         text,
//         style: TextStyle(fontSize: 21, color: Colors.white),
//       ),
//     ],
//   );
// }
}
class FirebaseApi {
  static UploadTask uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
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