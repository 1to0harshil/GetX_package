import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'theme_helper.dart';

mixin CustomTextStyles {
  // Body text style
  static TextStyle get bodyLargePoppinsOnPrimaryContainer =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static TextStyle get bodyMediumBlueGrey400 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );

  static TextStyle get bodyMediumBlueGrey400_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );

  static TextStyle get bodyMediumGray50 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50,
      );

  static TextStyle get bodyMediumWhiteA70001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA70001,
      );

  static TextStyle get bodyMediumWhiteA70001_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA70001.withValues(alpha:0.53),
      );

  static TextStyle get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.sp,
      );

  // Label text style
  static TextStyle get labelLargeOnPrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get labelLargePrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  // Title text style
  static TextStyle get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.sp,
      );

  static TextStyle get titleMediumOnPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumSemiBold18 =>
      theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get titleSmallSemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
/*
  TextStyle get sFProText => copyWith(
        fontFamily: 'SF Pro Text',
      );
*/

  TextStyle get poppins => copyWith(
        fontFamily: 'Poppins',
      );
}
