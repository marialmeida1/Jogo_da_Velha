import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: "Georgia  ",
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
      fontSize: 36.0,
    ),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.purple,
    brightness: Brightness.dark,
  ).copyWith(
    secondary: Colors.purple,
  ),
);
