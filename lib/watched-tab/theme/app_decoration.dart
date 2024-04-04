import 'package:flutter/material.dart';
import 'package:movies/watched-tab/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray90001,
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
