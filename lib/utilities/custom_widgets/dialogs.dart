import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Future showDialogBoxm(BuildContext context,String title,String content,Icon icon)async
 {
   Get.defaultDialog(title: title,middleText: content,actions: [icon] );
 }


Future showDialogBox2(BuildContext context,String title,String content,DialogType dialogType)async
{
  AwesomeDialog(
      autoDismiss: true,
      context: context,
      dialogType:dialogType,
      animType: AnimType.SCALE,
      title: title,
      alignment: Alignment.center,
      body:Padding(
        padding:EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        child: Center(
          child:Text(content,style: TextStyle(fontSize: 18)),
        ),
      )).show();
}
