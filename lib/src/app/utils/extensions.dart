import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x_structure/src/app/injection/app_injection.dart' as di;
import 'package:sizer/sizer.dart';

import '../core/theme/theme_helper.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/common_repository.dart';

AuthRepository get authRepository => di.s1<AuthRepository>();

CommonRepository get commonRepository => di.s1<CommonRepository>();

extension ScreenSpace on num {
  double get screenHeight => Get.height * (toDouble() / 100);

  double get screenWidth => Get.width * (toDouble() / 100);
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

Future<int> androidSdkInt() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final androidInfo = await deviceInfoPlugin.androidInfo;
  return androidInfo.version.sdkInt;
}

extension DividerExtension on Color {
  Divider divider({double? d}) =>
      Divider(thickness: d ?? 2.sp, color: this, height: 0);
}

void blueBackground() {
  Future.delayed(const Duration(milliseconds: 1)).then((value) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.blueGray400,
      statusBarBrightness:
          (Platform.isIOS) ? Brightness.light : Brightness.dark,
      statusBarIconBrightness:
          (Platform.isIOS) ? Brightness.light : Brightness.dark,
    ),);
  });
}

void orangeBackground() {
  Future.delayed(const Duration(milliseconds: 1)).then((value) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: appTheme.amber500,
        statusBarBrightness:
            (!Platform.isIOS) ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            (!Platform.isIOS) ? Brightness.dark : Brightness.light,
      ),
    );
  });
}

void yellowBackground() {
  Future.delayed(const Duration(milliseconds: 1)).then((value) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.amber500,
      statusBarBrightness:
          (!Platform.isIOS) ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
          (!Platform.isIOS) ? Brightness.dark : Brightness.light,
    ),);
  });
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension EmptyListExtension on List? {
  bool get isNullEmpty => this == null || this?.isEmpty == true;
}

void hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

extension ContainerExtension on num {
  BorderRadius toRadius() => BorderRadius.circular(toDouble());

  BorderRadius toBorderRadius() =>
      BorderRadius.all(Radius.circular(toDouble()));

  RoundedRectangleBorder toRoundedRectRadius() =>
      RoundedRectangleBorder(borderRadius: toRadius());
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;

  String capitalizeFirst() => (isNullOrEmpty())
      ? ''
      : this!
          .toLowerCase()
          .replaceFirst(this![0].toLowerCase(), this![0].toUpperCase());
}

extension TimeOfDayExtensions on TimeOfDay {
  DateTime toDateTime() => DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hour,
        minute,
      );
}
