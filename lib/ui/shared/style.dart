import 'package:flutter/material.dart';

Color primaryColor = Colors.green;
Color secondaryColor = Colors.yellowAccent[800];
const Color kwhite = Colors.white;
const Color kblack = Colors.black;
const Color kgrey = Colors.black54;
const Color kgreyDim = Colors.black26;
Color kgreyLight = Colors.grey[300];
const Color kblue = Color(0xFF00BBFF);
const Color kgreen = Color(0xFF00DDEE);
const Color kyellow = Colors.yellow;
const Color kred = Colors.red;
const Color klightBlue = Color(0xff5c3dff);
const Color kskyBlue = Color(0xff2890c8);
const Color iconColor = Color(0xffa8a09b);
Color kbackground = Color(0XFFFFFFFF);

Color colorChoice(int index) {
  if (index % 5 == 1) {
    return kblue;
  } else if (index % 5 == 2) {
    return Colors.orange;
  } else if (index % 5 == 3) {
    return Colors.red;
  } else if (index % 5 == 4) {
    return Colors.purple;
  } else
    return primaryColor;
}

var dropDownpadding = Padding(
  padding: const EdgeInsets.only(right: 20),
  child: Icon(
    Icons.keyboard_arrow_down,
    color: primaryColor,
  ),
);
