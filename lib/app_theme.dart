import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      useMaterial3: true,
      
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
            color: Constants.whiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter'),
        headlineSmall: TextStyle(
            color: Constants.lightgreyColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter'),
      ));
}
