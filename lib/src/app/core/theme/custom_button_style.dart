import 'package:flutter/material.dart';
import 'package:get_x_structure/src/app/core/theme/theme_helper.dart';
import 'package:sizer/sizer.dart';

mixin CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray800,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
  );
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.h),
    ),
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
  );
  static ButtonStyle get fillPrimaryTL12 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  static ButtonStyle get fillWhiteA => ElevatedButton.styleFrom(
    backgroundColor: appTheme.whiteA70001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}
