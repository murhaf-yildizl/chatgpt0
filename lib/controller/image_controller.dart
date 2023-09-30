import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ImageController{


  static Future<dynamic> shareImage(ScreenshotController screenshotController)async{

    try{
     await screenshotController.capture(delay: Duration(seconds: 1),pixelRatio: 1.0).then((Uint8List? image) async {
      if(image!=null)
        {
          final directory=(await getApplicationDocumentsDirectory()).path;
          final fileName=DateTime.now().toString()+".png";
          final filePath=await File("$directory/$fileName").create();
          await filePath.writeAsBytes(image);
          await Share.shareFiles([filePath.path],subject: "shre your image now");//.then((v) {



          //});
        }
      else return {"status":"failed","error":"error"};

    });
    return {"status":"failed","error":"error"};
  }
  catch(e){
    return {"status":"failed","error":e.toString()};

  }
  }

  static Future<dynamic>? downloadImage(ScreenshotController screenshotController)async {

    try {
      Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
      const folderName = "AI images";
      Directory directory = Directory('${appDocumentsDirectory.path}/$folderName');
      String path=directory.path;

      if (!await directory.exists()) {
        await directory.create(recursive: false);
        print('Directory created: ${path}');
      }
        if(path!=null)
     {
        final file_name = "${DateTime.now().millisecondsSinceEpoch}.png";
        final p = await screenshotController.captureAndSave(
            path, pixelRatio: 1.0,
            delay: Duration(seconds: 1),
            fileName: file_name);

        if(p!=null)
         return {"status":"success"};
        else
          return {"status":"failed","message":"failed to download image "};

      } else {
        print('Directory already exists: ${path}');
      }
    } catch (e) {
      print('Error creating directory: $e');
    }

}
}