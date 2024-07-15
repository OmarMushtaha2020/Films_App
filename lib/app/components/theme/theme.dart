import 'package:flutter/material.dart';

class ThemeModes{
  static ThemeData lightTheme=ThemeData.light();
 static   ThemeData darkTheme=ThemeData.dark().copyWith(
   primaryColor: Colors.orange,

   appBarTheme:  AppBarTheme(
     color: Colors.orange,

     titleTextStyle: TextStyle(
       color: Colors.white,


     ),

       iconTheme: IconThemeData(
         color: Colors.white,


       )

   )
       ,
   scaffoldBackgroundColor: Colors.black12
 );

}