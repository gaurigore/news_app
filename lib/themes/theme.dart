import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    buttonColor: Colors.blue,

  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    buttonColor: Colors.red,
  );
}


///AppBar
var appBar = AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            )),
        Center(
          child: Text(
            "News",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
 

);
