import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_structure/src/app/widget/button_widget.dart';
import 'package:get_x_structure/src/app/widget/custom_tap.dart';
import 'package:sizer/sizer.dart';

import '../../core/theme/custom_text_style.dart';
import '../../core/theme/theme_helper.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    required this.onTap,
    super.key,
    this.btnString = 'Yes',
    this.forceDialog = false,
    this.isLoading = false,
    this.globalKey,
  });

  final String title;
  final Function()? onTap;
  final String btnString;

  final bool forceDialog;
  final bool isLoading;
  final GlobalKey? globalKey;

  @override
  Widget build(BuildContext context) => Dialog(
        key: globalKey,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Container(
          // height: 60.screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: appTheme.whiteA700,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              if (!forceDialog)
                Align(
                  alignment: Alignment.topRight,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: CustomTap(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        color: appTheme.teal300,
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(),
              const SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumWhiteA70001_1,
              ),
              const SizedBox(height: 15),
              Container(
                width: 160,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ButtonScreen(
                  isLoading: isLoading,
                  buttonText: btnString,
                  textColor: appTheme.whiteA700,
                  background: theme.primaryColor,
                  onPressed: onTap,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
}
