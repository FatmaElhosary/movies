import 'package:flutter/material.dart';
import 'package:movies/shared/constants.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: Constants.blackColor,
      useMaterial3: true,
      // scaffoldBackgroundColor: Constants.bgColor,
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
        titleMedium: TextStyle(
            color: Constants.whiteColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter'),
        headlineLarge: TextStyle(
            color: Constants.whiteColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins'),
      ));
}
