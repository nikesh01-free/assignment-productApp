import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
    primary: Colors.black,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade400,
  ),

  scaffoldBackgroundColor: Colors.grey.shade100,

  cardTheme: const CardThemeData(
    color: Colors.white,
    elevation: 2,
    margin: EdgeInsets.zero,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 2,
    centerTitle: true,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    elevation: 5,
  ),
);
