import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x_structure/src/app/core/live_network/base_getx_controller.dart';
import 'package:get_x_structure/src/app/core/storage/get_storage_helper.dart';
import 'package:get_x_structure/src/app/routes/app_pages.dart';

import '../../../core/theme/theme_helper.dart';

class SplashController extends BaseGetXController
    with GetTickerProviderStateMixin {
  static SplashController get find => Get.find();

  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  )..repeat();

  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.whiteA700,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    startAnimation();
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.whiteA700,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),);
  }

  Future startAnimation() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
    );
    controller.dispose();
    if ((boxStorage.getBool(GetStorageHelper.isLogin) ?? false) == true) {
      await Get.offAllNamed(Routes.HOME);
    } else {
      await Get.offAllNamed(Routes.HOME);
    }
  }
}
