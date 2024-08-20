import 'package:flutter/material.dart';
import '../../constants/colors.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300
  ),
  scaffoldBackgroundColor: tdDarkBlue,
  // appBarTheme: AppBarTheme(
  //   color: Colors.black,
  // )
);