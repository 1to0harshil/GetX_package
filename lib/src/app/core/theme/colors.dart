import 'package:flutter/material.dart';

abstract class ColorsBase {
  Color get amber500;
  Color get amber600;
  Color get blueGray400;
  Color get blueGray800;
  Color get blueGray8006c;
  Color get gray50;
  Color get gray900;
  Color get indigo600;
  Color get indigo900;
  Color get lime800;
  Color get teal300;
  Color get whiteA700;
  Color get whiteA70001;
  Color get yellow700;
  Color get yellowA400;
}
class LightColors extends ColorsBase {
  @override
  Color get amber500 => const Color(0XFFFFC107);

  @override
  Color get amber600 => const Color(0XFFFFB200);

  @override
  Color get blueGray400 => const Color(0XFF6E80B0);

  @override
  Color get blueGray800 => const Color(0XFF44445B);

  @override
  Color get blueGray8006c => const Color(0X6C464555);

  @override
  Color get gray50 => const Color(0XFFF8F8FA);

  @override
  Color get gray900 => const Color(0XFF1F1F30);

  @override
  Color get indigo600 => const Color(0XFF3B5998);

  @override
  Color get indigo900 => const Color(0XFF01246B);

  @override
  Color get lime800 => const Color(0XFF9A7C48);

  @override
  Color get teal300 => const Color(0XFF57CE96);

  @override
  Color get whiteA700 => const Color(0XFFFEFEFE);

  @override
  Color get whiteA70001 => const Color(0XFFFFFFFF);

  @override
  Color get yellow700 => const Color(0XFFF1BD23);

  @override
  Color get yellowA400 => const Color(0XFFFDE901);
}

class DarkColors extends ColorsBase {
  @override
  Color get amber500 => const Color(0XFFFFC107);

  @override
  Color get amber600 => const Color(0XFFFFB200);

  @override
  Color get blueGray400 => const Color(0XFF6E80B0);

  @override
  Color get blueGray800 => const Color(0XFF44445B);

  @override
  Color get blueGray8006c => const Color(0X6C464555);

  @override
  Color get gray50 => const Color(0XFFF8F8FA);

  @override
  Color get gray900 => const Color(0XFF1F1F30);

  @override
  Color get indigo600 => const Color(0XFF3B5998);

  @override
  Color get indigo900 => const Color(0XFF01246B);

  @override
  Color get lime800 => const Color(0XFF9A7C48);

  @override
  Color get teal300 => const Color(0XFF57CE96);

  @override
  Color get whiteA700 => const Color(0XFFFEFEFE);

  @override
  Color get whiteA70001 => const Color(0XFFFFFFFF);

  @override
  Color get yellow700 => const Color(0XFFF1BD23);

  @override
  Color get yellowA400 => const Color(0XFFFDE901);
}
