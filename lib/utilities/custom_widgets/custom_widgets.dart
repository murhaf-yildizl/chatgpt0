import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_field_validation.dart';

class CustomTextFeild extends StatelessWidget {
  String hint;
  bool? secure;
  int? min,max;
  String? type,label;
  TextEditingController textEditingController;
  IconData? iconData;
  Function() ? icon_onPressed;

    CustomTextFeild({Key? key,required this.textEditingController,required this.hint,this.secure=false,this.type,this.min,this.max, this.label,this.iconData,this.icon_onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: Get.size.width*0.80,
      child: TextFormField(

        controller: textEditingController,

        obscureText:secure! ,
        keyboardType: type=="phone"?TextInputType.phone:null,
        decoration: InputDecoration(
          suffixIcon: iconData!=null?IconButton(icon:Icon(iconData),onPressed: icon_onPressed):null,
          contentPadding:
          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
           floatingLabelAlignment: FloatingLabelAlignment.start,
           hintText: hint,
           hintStyle:TextStyle(fontWeight: FontWeight.normal,fontSize: 16) ,
           label: Text(this.label??"",),
           floatingLabelBehavior: FloatingLabelBehavior.always,
           fillColor: Colors.green,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),

          ),


          ),
        validator:(value){
            return validation(type??'',value.toString(),min,max);
        },
       ),
    );
  }
}

class CustomButton extends StatelessWidget {
  String title;
  double height,width;

  Function()  onpressed;

  CustomButton({Key? key,required this.title,required this.onpressed(),required this.height,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),

            )
        ),
          onPressed:onpressed  ,

           child:Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white))
      ),
    );
  }
}
