import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_structure/src/app/utils/extensions.dart';
import 'package:get_x_structure/src/app/widget/custom_tap.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_label.dart';
import '../../core/theme/custom_text_style.dart';
import '../../core/theme/theme_helper.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    required this.onConfirm,
    required this.title,
    required this.subtitle,
    required this.okButton,
    super.key,
  });

  final Function()? onConfirm;
  final String title;
  final String subtitle;
  final String okButton;

  @override
  Widget build(BuildContext context) => AlertDialog(
        titlePadding: EdgeInsets.zero,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        title: titleTextWidget(),
        content: subtitleTextWidget(),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              btnCancelWidget(),
              3.screenWidth.width,
              btnLogoutWidget(),
            ],
          ),
        ],
      );

  Widget titleTextWidget() => Container(
        height: 5.screenHeight,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: appTheme.whiteA700, fontSize: 12.sp),
        ),
      );

  Widget subtitleTextWidget() => Text(subtitle, textAlign: TextAlign.center);

  Widget btnCancelWidget() => CustomTap(
        onTap: Get.back,
        child: Container(
          height: 5.screenHeight,
          width: 20.screenWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              AppLabel.cancel,
              style: CustomTextStyles.titleMediumOnPrimary,
            ),
          ),
        ),
      );

  Widget btnLogoutWidget() => CustomTap(
        onTap: onConfirm,
        child: Container(
          height: 5.screenHeight,
          width: 20.screenWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: theme.primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              okButton,
              style: CustomTextStyles.titleMediumOnPrimary,
            ),
          ),
        ),
      );
}
