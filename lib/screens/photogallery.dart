import 'package:athletics_app/screens/AddPhotos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:athletics_app/screens/userinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ImagePage.dart';
import 'achievements.dart';
// import 'package:transparent_image/transparent_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'homescreen.dart';
import 'leaderboard.dart';
import 'members.dart';

class gallery extends StatefulWidget {
  @override
  _galleryState createState() => _galleryState();
}

class _galleryState extends State<gallery> {
    Future<List<FirebaseFile>> futureFiles;
    Uint8List imagefile;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('TeamPhotos/');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey[850],
    appBar: AppBar(
      backgroundColor: Color(0xFF143B40),
      title: Text(
        'Gallery',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: FlatButton(
        onPressed: () {
          Navigator.pop(
            context);
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
    body: FutureBuilder<List<FirebaseFile>>(
      future: futureFiles,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred!'));
            } else {
              final files = snapshot.data;

              return GridView.builder(
                padding: EdgeInsets.all(4),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 4,crossAxisSpacing: 4),
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                          return buildFile(context, file);
                      },
              );
            }
        }
      },
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
                      Navigator.pushReplacement(
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
                    Navigator.pushReplacement(
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
                    Navigator.pushReplacement(
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
                    Navigator.pushReplacement(
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
  );

  Widget buildFile(BuildContext context, FirebaseFile file) =>
      GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ImagePage(file: file),
        )),
        child: Container(
        child: CachedNetworkImage(
          imageUrl: file.url,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                  ),
            ),
          ),
          placeholder: (context, url) => Center(child:Text('No Data')),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),)

  );

}


class FirebaseApi {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
      final ref = result.items[index];
      final name = ref.name;
      final file = FirebaseFile(ref: ref, name: name, url: url);

      return MapEntry(index, file);
    })
        .values
        .toList();
  }

  static Future downloadFile(Reference ref) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${ref.name}');

    await ref.writeToFile(file);
  }
}

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile({
    this.ref,
    this.name,
    this.url,
  });
}

