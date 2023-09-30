import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
class ImageTools{


  static Future<File?>  compressImage(File? file) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    XFile? compressedFile;

    if(file!=null)
      {
        String file_path=file.path.toString();
        String extension=file_path.substring(file_path.length-3,file_path.length);
        print("^^^^^^^^^^^^^^^^^ ${extension}");
        String destination_path='$path/file_$fileName.$extension';
        print("%%%%%%%%%%%% ${destination_path}");
        compressedFile= await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,destination_path,
          quality: 44,
          rotate: 0,
        );

      }

    if(compressedFile!=null){
      file=File(compressedFile.path);
      print("HHHHHHHHHHHHHHHHHHHHHHHHh ${file.readAsBytesSync().length}");
      return file;
    }
    return file;

   }



  static String TO_uint8list(Uint8List data) {
    return base64Encode(data);
  }
}