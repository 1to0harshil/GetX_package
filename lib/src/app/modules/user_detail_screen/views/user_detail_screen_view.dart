/*
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/constants/app_text_size.dart';
import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../core/validation/auth_form_validation.dart';
import '../../../data/model/widget_model_dir/widget_model.dart';
import '../../../utils/extension.dart';
import '../../../widget/app_bar_widget.dart';
import '../../../widget/app_scaffold.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/custom_tap.dart';
import '../../../widget/custom_text_form_field.dart';
import '../controllers/user_detail_screen_controller.dart';

class UserDetailScreenView extends GetView<UserDetailScreenController> {
  const UserDetailScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.moveToPrevious();
        return false;
      },
      child: AppScaffold(
        backgroundColor: AppColors.orange50,
        absorbing: controller.isLoading.value,
        statusBarBackgroundColor: AppColors.orange50,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Column(
            children: [
              const Spacer(),
              AnimatedContainer(
                  padding: EdgeInsets.only(
                      left: AppConstants.horizontalSpace,
                      right: AppConstants.horizontalSpace,
                      top: AppConstants.verticalSpace),
                  decoration: BoxDecoration(
                    color: AppColors.white50,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppConstants.borderRadius2)),
                  ),
                  duration: const Duration(milliseconds: 750),
                  child: Obx(() {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.currentWidget.description,
                          style: AppStyle.regularTextStyle(
                            size: AppTextSize.header4,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        1.h.height,
                        Text(
                          textAlign: TextAlign.start,
                          controller.currentWidget.title,
                          style: AppStyle.regularSitkaTextStyle(
                              size: AppTextSize.header1,
                              fontWeight: FontWeight.w700,
                              color: AppColors.grey30,
                              letterSpacing: AppConstants.headingLetterSpacing),
                        ),
                        if (controller.currentWidget.type == 1)
                          yourNameWidget()
                        else if (controller.currentWidget.type == 2)
                          dobWidget()
                        else if (controller.currentWidget.type == 3)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              3.h.height,
                              Wrap(
                                direction: Axis.horizontal,
                                children: controller.currentWidget.list!
                                    .mapIndexed(
                                        (index, i) => preferredItem(index))
                                    .toList()
                                  ..add(8.h.height),
                              ),
                            ],
                          )
                        else
                          0.width,
                        Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              controller.currentIndex.value == 2
                                  ? Container(
                                      margin: EdgeInsets.only(top: 2.h),
                                      child: ButtonScreen(
                                        horizontal: 0,
                                        boxBorder: Border.all(
                                            color: AppColors.grey70,
                                            width: 4.sp),
                                        onPressed: controller.preferNotToSay,
                                        buttonText: AppLabel.preferNotToSay,
                                        textColor: AppColors.grey50,
                                        fontWeight: FontWeight.w600,
                                        background: AppColors.white70,
                                        splashColor: AppColors.orange90,
                                      ),
                                    )
                                  : 0.width,
                              Container(
                                padding: EdgeInsets.only(bottom: 4.h, top: 2.h),
                                child: ButtonScreen(
                                  horizontal: 0,
                                  onPressed: controller.validateData,
                                  enable: controller.isButtonEnable &&
                                      !controller.isLoading.value,
                                  buttonText: AppLabel.continue_,
                                  textColor: AppColors.white,
                                  background: controller.isButtonEnable
                                      ? AppColors.orange50
                                      : AppColors.orange90,
                                  splashColor: AppColors.orange70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        controller.isKeyboardVisible.value
                            ? 34.h.height
                            : 0.height,
                      ],
                    );
                  })),
            ],
          ),
          Obx(() {
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.aboutYouList
                    .mapIndexed((index, e) =>
                        indicator(controller.currentIndex.value >= index))
                    .toList(),
              ),
            );
          }),
          Obx(
            () => AppBarWidget(
              onBack: () {
                controller.moveToPrevious();
              },
              isCancelVisible: controller
                  .aboutYouList[controller.currentIndex.value].isResetAvailable,
              cancelText: AppLabel.skip,
              onCancelTap: () {
                controller.manageSkip();
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget yourNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        4.h.height,
        CustomTextFormField(
          controller: controller.textController[0],
          textInputType: TextInputType.name,
          textInputAction: TextInputAction.done,
          hint: AppLabel.yourName,
          cursorHeight: 1.7.h,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
          ],
          hintFontWeight: FontWeight.w500,
          startIcon: Padding(
              padding: EdgeInsets.all(3.w),
              child: SvgPicture.asset(AppImages.userImage)),
        ),
        2.h.height
      ],
    );
  }

  Widget dobWidget() {
    return Column(
      children: [
        3.h.height,
        AbsorbPointer(
          absorbing: true,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 300),
            alignment: const Alignment(0, -1),
            curve: Curves.decelerate,
            child: CustomTextFormField(
              controller: controller.textController[1],
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              isValidate: true,
              hint: AppLabel.birthDate,
              validator: ValidationType.AGE,
              validationMode: AutovalidateMode.onUserInteraction,
              startIcon: Padding(
                  padding: EdgeInsets.all(14.sp),
                  child: SvgPicture.asset(
                    AppImages.icDobCalendar,
                    colorFilter:
                        ColorFilter.mode(AppColors.grey80, BlendMode.srcIn),
                  )),
            ),
          ),
        ),
        1.5.h.height,
        SizedBox(
          height: 28.h,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            minimumDate: DateTime(1900),
            maximumDate: DateTime.now(),
            initialDateTime:
                DateTime.now().subtract(const Duration(days: 365 * 18)),
            onDateTimeChanged: (value) {
              controller.changeDOB(value);
            },
          ),
        ),
      ],
    );
  }

  Widget preferredItem(int index) {
    WidgetItemModel item = controller.currentWidget.list![index];
    return CustomTap(
      onTap: () => controller.updateSelection(index),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 4.screenWidth, vertical: 1.2.screenHeight),
        margin: EdgeInsets.only(right: 2.screenWidth, bottom: 1.screenHeight),
        decoration: BoxDecoration(
          color: item.isSelected ? AppColors.white70 : AppColors.grey120,
          borderRadius: BorderRadius.all(Radius.circular(2.screenWidth)),
          border: Border.all(
              color: item.isSelected ? AppColors.grey50 : AppColors.grey90,
              width: item.isSelected ? 5.sp : 4.sp),
        ),
        child: Text(
          item.title,
          style: AppStyle.regularTextStyle(
              size: AppTextSize.header4,
              color: AppColors.grey50,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget indicator(bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      height: 0.6.screenHeight,
      width: 10.screenWidth,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.orange100 : AppColors.orange60,
        borderRadius: BorderRadius.all(
          Radius.circular(8.screenWidth),
        ),
      ),
      margin: EdgeInsets.only(right: 1.screenWidth),
    );
  }
}
*/
