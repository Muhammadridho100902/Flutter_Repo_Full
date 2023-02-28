import 'package:flutter/material.dart';

const appPurple = Color(0xff431aa1);
const appPurpleDark = Color(0xff1e0771);
const appPurpleLight1 = Color(0xff9345f2);
const appPurpleLight2 = Color(0xffb9a2d8);
const appWhite = Color(0xfffaf8fc);
const appOrange = Color(0xffe6704a);

ThemeData themeLight = ThemeData(
  primaryColor: appPurple,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: appPurple,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: appPurpleDark),
    bodyText2: TextStyle(color: appPurpleDark)
  )
);

ThemeData themeDark = ThemeData(
  primaryColor: appPurpleLight2,
  scaffoldBackgroundColor: appPurpleDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: appPurpleDark,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: appWhite),
    bodyText2: TextStyle(color: appWhite)
  )
);