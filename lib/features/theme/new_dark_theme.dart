import 'package:flutter/material.dart';
import '../../constants/colors.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: tdDarkBlue,
    primary: tdBlack,
    secondary: tdDeepBlue,
    tertiary: tdWhite.withOpacity(0.4),
    // surface: tdWhite,
    inversePrimary: Colors.white
  ),
  scaffoldBackgroundColor: tdDarkBlue,
  // appBarTheme: AppBarTheme(
  //   color: Colors.black,
  // )
);