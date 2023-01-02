import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFD8D7DB),
    fontFamily: 'notosans',
    textTheme: textTheme(),
    dividerColor: Colors.transparent,
    
  );
}

TextTheme textTheme(){
  return const TextTheme(
    headline1: 
    TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 28
    ),
    headline2: TextStyle(
      color: Colors.black,
      // fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headline3: TextStyle(
      color: Colors.black,
      // fontWeight: FontWeight.bold,
      fontFamily: 'notosansI',
      fontStyle: FontStyle.italic,
      fontSize: 18
    ),
    headline4: TextStyle(
      color: Colors.black,
      // fontWeight: FontWeight.bold,
      fontSize: 14
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.normal
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.normal
    )  
  );
}