// import 'package:sports/shared/style.dart';

import 'package:ghspandemic/ui/shared/style.dart';
import 'package:flutter/material.dart';

ThemeData themeData = new ThemeData(
    // accentColor: Colors.red,
    // dividerTheme: DividerThemeData(thickness: 10, color: Colors.red),
    // primaryColor: primaryColor,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: kwhite,
    appBarTheme: AppBarTheme(color: kwhite),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFFf05e23),
      //textTheme: ButtonTextTheme.normal,
    ),
    textTheme: TextTheme(
        caption: TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
        headline: TextStyle(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        title: TextStyle(
            fontSize: 40, fontWeight: FontWeight.w900, fontFamily: 'Roboto'),
        subtitle: TextStyle(
            color: primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto'),
        display1: TextStyle(
            color: kblack,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600),
        display2: TextStyle(
            color: kblack,
            fontSize: 19,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600),
        body2: TextStyle(
            color: kblack,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'),
        button: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'),
        body1: TextStyle(
          //  color: black1,
          fontFamily: 'Roboto',
        )),
    iconTheme: IconThemeData(color: Colors.grey[500]));
