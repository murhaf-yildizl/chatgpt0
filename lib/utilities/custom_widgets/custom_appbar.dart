import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String? title;
  String?  page;
  double? height;

  CustomAppBar({ Key? key,this.title, this.page,this.height}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: ClipPath(
        clipper: CurvedAppBar(),
        child: Container(
          //color: Colors.indigo,

          child: AppBar(
             toolbarHeight: height??130,
            centerTitle: true,
            iconTheme: IconThemeData(
                color: Colors.white,
                size: 40
            ),
            backgroundColor: Colors.deepPurple,
            title: Text(title??"",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,),maxLines: 2,),

          ),
        ),
      ),
      preferredSize: const Size.fromHeight(kToolbarHeight + 100),


    );

  }

}


class CurvedAppBar extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path path=Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4,size.height-40,size.width/2,size.height-20);
    path.quadraticBezierTo(size.width*3/4,size.height,size.width,size.height-20);
    path.lineTo(size.width,0);

    return path;
    // TODO: implement getClip
    throw UnimplementedError();
  }


  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }



}
