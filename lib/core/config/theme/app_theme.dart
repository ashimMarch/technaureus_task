


import 'package:flutter/material.dart';

import '../../resources/color_res.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 20,
      
      backgroundColor: Colors.white,

      selectedItemColor: Palette.primaryColor,
      unselectedIconTheme: IconThemeData(color: Palette.primaryColor)
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(Palette.primaryColor),
        textStyle: MaterialStateProperty.all(const TextStyle(color: Palette.primaryColor))
      )
    )
  );
}