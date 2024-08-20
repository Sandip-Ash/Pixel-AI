// import 'package:flutter/material.dart';
// import 'package:text_to_image/constants/colors.dart';
//
// ThemeData lightMode = ThemeData(
//   colorScheme: ColorScheme.light(
//     surface: Colors.grey.shade300,
//     primary: Colors.grey.shade400,
//     secondary: Colors.white,
//     tertiary: tdBlack,
//     // surface: tdBlack,
//     inversePrimary: tdBlack.withOpacity(0.4),
//   ),
//   scaffoldBackgroundColor: Colors.grey.shade300,
//   // appBarTheme: AppBarTheme(
//   //   color: Colors.grey.shade400,
//   // )
// );

import 'package:flutter/material.dart';
import '../../constants/colors.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.black,
  ),
  scaffoldBackgroundColor: tdDeepWhite,
  textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: tdBlue, // Set the selection cursor color
      selectionColor: Colors.lightBlue.withOpacity(0.6) // Set the selection color
  ),
);