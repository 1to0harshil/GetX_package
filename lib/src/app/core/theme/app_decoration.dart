import 'package:flutter/material.dart';
import 'package:get_x_structure/src/app/core/theme/theme_helper.dart';
import 'package:sizer/sizer.dart';


mixin AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray900,
  );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
  );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
    color: theme.colorScheme.primaryContainer,
  );

  // Primary decorations
  static BoxDecoration get primary => BoxDecoration(
    color: theme.colorScheme.primary,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.onPrimary.withValues(alpha:0.1),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          -4,
        ),
      ),
    ],
  );
}

mixin BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
    12.h,
  );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
    16.h,
  );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
    20.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
