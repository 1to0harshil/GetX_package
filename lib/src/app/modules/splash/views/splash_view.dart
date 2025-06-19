import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x_structure/src/app/core/constants/app_label.dart';
import 'package:get_x_structure/src/app/core/theme/custom_text_style.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/theme_helper.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: theme.primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: ScaleTransition(
                scale: controller.animation,
                child: Text(
                  AppLabel.appName,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumGray50.copyWith(
                    fontSize: 25.sp,
                    letterSpacing: 0.6,
                    color: appTheme.whiteA700,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
