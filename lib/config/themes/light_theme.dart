import 'package:flutter/material.dart';

final lightThemeData = ThemeData(
  fontFamily: "SanFrancisco",
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.blue,
  backgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.black),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    bodyText1: const TextStyle(
      color: Colors.black,
    ),
    headline3: const TextStyle(
      color: Colors.black,
    ),
    headline4: const TextStyle(
      color: Colors.black,
    ),
    headline6: const TextStyle(
      fontFamily: "SanFrancisco",
      color: Colors.black,
    ),
  ),
);
