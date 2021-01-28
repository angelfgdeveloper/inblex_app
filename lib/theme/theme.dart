import 'package:flutter/material.dart';

final myTheme = ThemeData.light().copyWith(
  cursorColor: Colors.green[400],
  textSelectionColor: Colors.green[200],
  textSelectionHandleColor: Colors.green[400],
  
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.green[400],
    unselectedItemColor: Colors.grey,
  )

);
