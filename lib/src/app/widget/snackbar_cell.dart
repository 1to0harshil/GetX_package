import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../core/theme/custom_text_style.dart';
import '../core/theme/theme_helper.dart';

mixin SnackBarWidget {
  static void showSnackBar(
    String message, {
    bool isError = true,
    String title = 'Errors',
  }) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
        margin: EdgeInsets.symmetric(horizontal: 8.sp),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        borderRadius: 10,
        duration: const Duration(milliseconds: 1500),
        message: message,
        messageText: Text(
          message,
          style: CustomTextStyles.bodyMediumWhiteA70001,
        ),
        backgroundColor: appTheme.whiteA700.withValues(alpha : 0.7),
      );
    }
  }

  static void showSnackBarInfinity(
    String message, {
    bool isError = true,
    String title = 'Errors',
  }) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
        margin: EdgeInsets.symmetric(horizontal: 8.sp),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        duration: const Duration(days: 365),
        message: message,
        snackPosition: SnackPosition.TOP,
        messageText: Text(
          message,
          style: CustomTextStyles.bodyMediumWhiteA70001,
        ),
        backgroundColor: appTheme.whiteA700.withValues(alpha : 0.7),
      );
    }
  }

  static void clearSnackBar() {
    Get.closeCurrentSnackbar();
  }
}
