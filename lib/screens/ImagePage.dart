import 'package:athletics_app/screens/photogallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key key,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpeg', '.jpg', '.png'].any(file.name.contains);

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Color(0xFF143B40),
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(
              context
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
            icon: Icon(Icons.file_download),
            onPressed: () async {
              Image_Downloader();
            },
            //   await FirebaseApi.downloadFile(file.ref);
            //   final snackBar = SnackBar(
            //     content: Text('Downloaded ${file.name}'),
            //   );
            //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: isImage
          ? Center(
            child: Image.network(
        file.url,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
          )
          : Center(
        child: Text(
          'Cannot be displayed',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  Image_Downloader() async{
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(file.url,
          destination: AndroidDestinationType.directoryDownloads);
      print('successful');
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
