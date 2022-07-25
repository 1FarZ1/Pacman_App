import 'package:fgame/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp( Phoenix(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:"/",
      routes:{
        "/":(context)=>Home(),
      }
    ),
  ));
}
