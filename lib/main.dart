import 'package:flutter/material.dart';
import 'package:flutter_app_mydiaryfood/views/splash_screen_ui.dart';

void main(){
  runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     home: splashScreenUI(),
     theme: ThemeData(
       fontFamily: 'Kanit'
     ),
   ), 
  ); 
}