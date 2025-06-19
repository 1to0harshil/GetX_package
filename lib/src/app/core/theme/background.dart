// import 'package:flutter/material.dart';
// import 'package:get_x_structure/src/app/core/theme/styles.dart';
// import 'package:get_x_structure/src/app/utils/extensions.dart';
// import 'package:sizer/sizer.dart';
//
// import 'colors.dart';
//
// class AppBackground {
//   static BoxDecoration containerBackgroundWithShadow(
//       {Color? shadowColor, double? radius, Color? backgroundColor}) {
//     return BoxDecoration(
//         color: backgroundColor ?? AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: shadowColor ?? AppColors.shadowWhiteColor,
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: const Offset(0, 2), // changes position of shadow
//           ),
//         ],
//         borderRadius:
//             BorderRadius.all(Radius.circular(radius ?? 2.screenWidth)));
//   }
//
//   static BoxDecoration containerBackgroundWithBorder() {
//     return BoxDecoration(
//         color: AppColors.white,
//         border:
//             Border.all(color: AppColors.black.withValues(alpha:0.3), width: 0.5.sp),
//         borderRadius: BorderRadius.all(Radius.circular(1.screenWidth)));
//   }
//
//   static BoxDecoration containerBackground(
//       {Color? background, double? radius}) {
//     return BoxDecoration(
//         color: background ?? AppColors.creamColor,
//         borderRadius:
//             BorderRadius.all(Radius.circular(radius ?? 2.screenWidth)));
//   }
//
//   static InputDecoration textFormFieldDecoration(String hint,
//       {double? horizontal, TextStyle? hintStyle}) {
//     return InputDecoration(
//         counterText: "",
//         contentPadding: EdgeInsets.symmetric(
//             horizontal: horizontal ?? 2.screenWidth, vertical: 5),
//         isCollapsed: true,
//         border: InputBorder.none,
//         hintStyle: hintStyle ?? AppStyle.sfRegularTextStyle(size: 12.sp),
//         hintText: hint);
//   }
// }
