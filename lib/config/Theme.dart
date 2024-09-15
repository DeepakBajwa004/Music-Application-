

import 'package:flutter/material.dart';
import 'package:m_music/config/Color.dart';

var darkTheme = ThemeData(
useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: backgroundColor,
    primary: primaryColor
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color:  fontColor
    ),

    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color:  fontColor
    ),

    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color:  labelColor
    ),

    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color:  labelColor
    ),

    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color:  labelColor
    ),



  ),

);