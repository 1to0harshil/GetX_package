import 'package:flutter/material.dart';
import 'package:get_x_structure/src/app/utils/extensions.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/custom_text_style.dart';
import '../core/theme/theme_helper.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({
    required this.buttonText,
    super.key,
    this.onPressed,
    this.textSize,
    this.background,
    this.textColor,
    this.horizontal,
    this.height,
    this.fontWeight,
    this.boxBorder,
    this.arrowColor,
    this.enable = true,
    this.isLoading = false,
    this.isArrow = false,
    this.isBackArrow = false,
  });

  final String buttonText;
  final void Function()? onPressed;
  final bool enable;
  final double? textSize;
  final Color? background;
  final Color? textColor;
  final bool isLoading;
  final bool isArrow;
  final Color? arrowColor;
  final bool isBackArrow;
  final double? horizontal;
  final double? height;
  final FontWeight? fontWeight;
  final BoxBorder? boxBorder;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.symmetric(horizontal: horizontal ?? 6.w),
        elevation: 1,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Container(
          width: double.maxFinite,
          height: height ?? 6.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: background ?? appTheme.gray50,
            borderRadius: BorderRadius.all(Radius.circular(2.w)),
            border: boxBorder ?? const Border(),
          ),
          child: MaterialButton(
            disabledColor: appTheme.gray50,
            onPressed: enable ? onPressed : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: isBackArrow,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: appTheme.whiteA700,
                    size: 3.6.w,
                  ),
                ),
                1.w.width,
                if (isLoading)
                  Container(
                    width: 10.screenWidth,
                    height: 10.screenWidth,
                    padding: EdgeInsets.all(2.screenWidth),
                    child: CircularProgressIndicator(
                      color: textColor,
                      strokeWidth: 3.sp,
                    ),
                  )
                else
                  Text(
                    buttonText,
                    style: CustomTextStyles.bodyMediumWhiteA70001,
                  ),
                1.w.width,
                // Visibility(
                //     visible: isArrow && !isLoading,
                //     child: Icon(Icons.arrow_forward_ios,
                //         color: arrowColor ?? AppColors.white, size: 3.6.w))
              ],
            ),
          ),
        ),
      );
}
