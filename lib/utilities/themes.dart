import 'package:flutter/material.dart';

ThemeData englishTheme=ThemeData(
backgroundColor:Colors.white ,
primaryColor: Colors.indigo,
//scaffoldBackgroundColor:Colors.white,
  sliderTheme: ThemeData.dark().sliderTheme.copyWith(
      valueIndicatorColor: Colors.green,
      valueIndicatorTextStyle: TextStyle(
          backgroundColor: Colors.transparent
      )
  ),
primaryIconTheme: IconThemeData(
color:Colors.black,

),
floatingActionButtonTheme:FloatingActionButtonThemeData(
backgroundColor: Colors.indigo,
foregroundColor: Colors.white
) ,
textTheme: TextTheme(

  displaySmall: TextStyle(
    fontFamily: 'Assistant',
    fontSize: 16,
    letterSpacing: 2,
    height: 1.5

  ),
titleMedium: TextStyle(
fontFamily:  'Assistant',
fontSize: 18,
letterSpacing:1.5,
height:1.5,
fontWeight: FontWeight.bold
),
titleSmall: TextStyle(
fontFamily:  'Assistant',
fontSize: 16,
color: Colors.black,
letterSpacing: 1,
height: 1.5

),
titleLarge: TextStyle(
fontFamily: 'Assistant',
fontSize: 16,
letterSpacing: 2,
fontWeight: FontWeight.bold,
height: 1.5
),



),



appBarTheme:AppBarTheme(
centerTitle:true,
elevation: 0,
toolbarHeight: 90,
backgroundColor: Colors.white,
titleTextStyle:TextStyle(

color:Colors.white,
fontFamily: 'Assistant',
fontWeight: FontWeight.bold,
letterSpacing:1.5,
fontSize:18,


),
),
tabBarTheme:TabBarTheme(

//indicatorSize: TabBarIndicatorSize.label,
labelPadding: EdgeInsets.all(16),

labelColor:Colors.red,
unselectedLabelColor: Colors.white,
unselectedLabelStyle:TextStyle(
fontSize:16,
fontFamily: 'Assistant',
letterSpacing: 2
) ,
labelStyle: TextStyle(
letterSpacing: 2,
  fontFamily: 'Assistant',
)
),
elevatedButtonTheme: ElevatedButtonThemeData(

style:  ElevatedButton.styleFrom(
minimumSize:Size(double.infinity,55) ,


textStyle:TextStyle(

letterSpacing: 2,
fontSize:20,
fontFamily: 'Assistant',
),

shape:RoundedRectangleBorder(
borderRadius: BorderRadius.circular(50)
),
primary: Colors.indigo.shade800,



)
),

);

ThemeData arabicTheme=ThemeData(
  backgroundColor:Colors.black ,
  primaryColor: Colors.indigo,
  sliderTheme: ThemeData.dark().sliderTheme.copyWith(
      valueIndicatorColor: Colors.green,
      valueIndicatorTextStyle: TextStyle(
          backgroundColor: Colors.transparent
      )
  ),
  //scaffoldBackgroundColor:Colors.white,
  primaryIconTheme: IconThemeData(
    color:Colors.black,
    size: 30,

  ),
  floatingActionButtonTheme:FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white
  ) ,
  textTheme: TextTheme(

    titleMedium: TextStyle(
        fontFamily:  'Kufi',
        fontSize: 18,
        letterSpacing:1.5,
        height:1.5,
         color: Colors.black,
        fontWeight: FontWeight.bold
    ),
    titleSmall: TextStyle(
      fontFamily:  'Kufi',
      fontSize: 16,
      color: Colors.black,
      letterSpacing: 1,
      height: 1.5


    ),
    titleLarge: TextStyle(
        fontFamily: 'Kufi',
        fontSize: 16,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
        height: 1.5
    ),
     displaySmall: TextStyle(
        fontFamily: 'Kufi',
        fontSize: 16,
        letterSpacing: 2,
         height: 1.5
    ),



  ),


   appBarTheme:AppBarTheme(
    centerTitle:true,
    elevation: 0,
    toolbarHeight: 90,
    //backgroundColor: Colors.white,
    titleTextStyle:TextStyle(

      color:Colors.black,
      fontFamily: 'Kufi',
      fontWeight: FontWeight.bold,
      letterSpacing:1.5,
      fontSize:18,


    ),
  ),
  tabBarTheme:TabBarTheme(

//indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.all(16),

      labelColor:Colors.red,
      unselectedLabelColor: Colors.white,
      unselectedLabelStyle:TextStyle(
          fontSize:16,
          fontFamily: 'Kufi',
          letterSpacing: 2
      ) ,
      labelStyle: TextStyle(
        letterSpacing: 2,
        fontSize:16,
        fontFamily: 'Kufi',
      )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(

      style:  ElevatedButton.styleFrom(
        minimumSize:Size(double.infinity,55) ,


        textStyle:TextStyle(

          letterSpacing: 2,
          fontSize:20,
          fontFamily: 'Kufi',
        ),

        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        primary: Colors.indigo.shade800,



      )
  ),

);
