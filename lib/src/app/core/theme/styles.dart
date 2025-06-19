// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get_x_structure/src/app/core/theme/colors.dart';
// import 'package:sizer/sizer.dart';
//
// mixin AppStyle {
//   static const String _fontFamily = 'Hebdo';
//   static const String _sfProFontFamily = 'SFPro';
//   static const String _sfProTextFontFamily = 'SFPro-Text';
//   static const String _interFontFamily = 'Inter';
//   static const String _instagramFontFamily = 'Instagram';
//
//   static TextStyle regularTextStyle(
//       {required double size, Color color = const Color(0xFF929DAA),
//       FontWeight fontWeight = FontWeight.w400,
//       double letterSpacing = 0}) => TextStyle(
//         fontFamily: _fontFamily,
//         letterSpacing: letterSpacing,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle instagramTextStyle(
//       {required double size, Color color = const Color(0xFF1F0039),
//       FontWeight fontWeight = FontWeight.w700,
//       double letterSpacing = 0}) => TextStyle(
//         fontFamily: _instagramFontFamily,
//         letterSpacing: letterSpacing,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle underLineRegularTextStyle(
//       {required double size, Color color = const Color(0xFF929DAA),
//       FontWeight fontWeight = FontWeight.w400}) => TextStyle(
//         fontFamily: _fontFamily,
//         color: color,
//         decoration: TextDecoration.underline,
//         decorationColor: AppColors.black,
//         decorationThickness: 1.2.sp,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle sfRegularTextStyle(
//       {required double size, Color color = const Color(0xFF1F0039),
//       FontWeight fontWeight = FontWeight.w400}) => TextStyle(
//         fontFamily: _sfProFontFamily,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle sfTextRegularTextStyle(
//       {required double size, Color color = const Color(0xFF1F0039),
//       FontWeight fontWeight = FontWeight.w400}) => TextStyle(
//         fontFamily: _sfProTextFontFamily,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle underLineSfRegularTextStyle(
//       {required double size, Color color = const Color(0xFF1F0039),
//       FontWeight fontWeight = FontWeight.w400}) => TextStyle(
//         fontFamily: _sfProFontFamily,
//         decoration: TextDecoration.underline,
//         decorationColor: color,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static Future<TextStyle> interRegularTextStyle(
//       {required double size, Color color = const Color(0xFF1F0039),
//       FontWeight fontWeight = FontWeight.w400}) async => TextStyle(
//         fontFamily: _interFontFamily,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle regularTextStyleWithUnderLine(
//       {required double size, Color color = const Color(0xFF929DAA),
//       FontWeight fontWeight = FontWeight.w400}) => TextStyle(
//         decoration: TextDecoration.underline,
//         decorationColor: color,
//         decorationThickness: 0.4.w,
//         fontFamily: _fontFamily,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle mediumTextStyle(
//       {required double size, Color color = const Color(0xFF929DAA),
//       FontWeight fontWeight = FontWeight.w500}) => TextStyle(
//         fontFamily: _fontFamily,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static TextStyle boldTextStyle(
//       {required double size, Color color = const Color(0xFF929DAA),
//       FontWeight fontWeight = FontWeight.w700}) => TextStyle(
//         fontFamily: _fontFamily,
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight);
//
//   static EdgeInsets iosPadding =
//       EdgeInsets.only(bottom: (Platform.isIOS) ? 10 : 0);
//   static EdgeInsets androidPadding =
//       EdgeInsets.only(top: (Platform.isAndroid) ? 10 : 0);
//   static double androidSpacing = (Platform.isAndroid) ? 10 : 0;
//   static double iosSpacing = (Platform.isIOS) ? 10 : 0;
// }
