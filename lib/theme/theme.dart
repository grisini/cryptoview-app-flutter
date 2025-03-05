import 'package:flutter/material.dart';

final DarkTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    centerTitle: true,
  ),
  dividerColor: Color(0xFF0B90B),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 30, color: Colors.white),
    bodySmall: TextStyle(fontSize: 24, color: Colors.grey),
    labelMedium: TextStyle(fontSize: 20, color: Colors.white),
    labelLarge: TextStyle(fontSize: 24, color: Colors.white),
    bodyLarge: TextStyle(
      fontSize: 35,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(fontSize: 15, color: Colors.grey),
  ),
);
