import 'package:flutter/material.dart';

const primaryColor = Color(0xfff82810);

final darkTheme = ThemeData(
  primaryColor: primaryColor,
  useMaterial3: true,
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.black87,
  colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor, brightness: Brightness.dark),
);

final lightTheme = ThemeData(
  primaryColor: primaryColor,
  useMaterial3: true,
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor, brightness: Brightness.light),
);

const textTheme = TextTheme(

    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ));