import 'dart:ffi';
import 'dart:typed_data';

import 'package:athletics_app/screens/userinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'achievements.dart';
import 'dataHolder.dart';
// import 'package:transparent_image/transparent_image.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'homescreen.dart';
import 'leaderboard.dart';
import 'members.dart';


CollectionReference imgRef;

class gallery extends StatefulWidget {
  @override
  _galleryState createState() => _galleryState();
}

class _galleryState extends State<gallery> {
  int _currentindex = 0;


  Widget makeItemGrid(){
    return GridView.builder(
      padding: EdgeInsets.all(4),
      itemCount: 44,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 4,crossAxisSpacing: 4),
      itemBuilder: (context,index){
        return ImageGridItem(index+1);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        // constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/athlete.jpeg"),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: makeItemGrid(
        ),

      ),



    );

  }
}

class ImageGridItem extends StatefulWidget {
  int _index;
  ImageGridItem(int index){
    this._index=index;
  }

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  Uint8List imagefile;
  Reference photorefernce = FirebaseStorage.instance.ref().child("TeamPhotos");

  getImage(){
    if(!requestedIndexes.contains(widget._index)){
      int Max_size = 30*1024*1024;

      photorefernce.child("image_${widget._index}.jpg").getData(Max_size).then((data){
        this.setState(() {
          imagefile =data;
        });
        imageData.putIfAbsent(widget._index, ()
        {
          return data;
        });
      }).catchError((error){
        // debugPrint(error.toStrings());
      });
      requestedIndexes.add(widget._index);
    }
  }
  Widget decideGridTileWidget(){
    if(imagefile==null){
      return Center(child: Text("No Data") );
    }else{
      return Image.memory(imagefile,fit: BoxFit.fill,);
    }
  }
  @override
  Void initState(){
    super.initState();
    if(!imageData.containsKey(widget._index)){
      getImage();
    }else{
      this.setState(() {
        imagefile=imageData[widget._index];
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridTileWidget());
  }
}

