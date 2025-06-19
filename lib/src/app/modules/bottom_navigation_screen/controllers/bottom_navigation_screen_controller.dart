/*
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:humann/app/core/base/base_getx_controller.dart';
import 'package:humann/app/core/constants/app_label.dart';
import 'package:humann/app/core/constants/strings.dart';
import 'package:humann/app/core/theme/colors.dart';
import 'package:humann/app/data/model/res_model/user_detail_res_model.dart';
import 'package:humann/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humann/app/modules/therapists_screen/controllers/therapists_screen_controller.dart';
import 'package:humann/app/widget/snackbar_cell.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/services/mix_panel_service.dart';
import '../../../data/model/arguments_model/feedback_args_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/extension.dart';
import '../../feedback_screen/controllers/feedback_screen_controller.dart';

class BottomNavigationScreenController extends BaseGetXController
    with GetTickerProviderStateMixin {
  RxBool showBottomBar = true.obs;
  RxInt currentIndex = 0.obs;
  ZoomDrawerController drawerController = ZoomDrawerController();
  RxString appVersion = "".obs, imageLink = "".obs, name = "".obs;
  RxBool isDrawerOpen = false.obs;
  Rx<Color> statusColor = AppColors.backgroundWhite.obs;
  TabController? tabController;
  Rxn<UserDetailResModel> userDetails = Rxn<UserDetailResModel>();

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    appVersion.value = (await getAppVersion()).toString();
    drawerController.stateNotifier?.addListener(_listenDrawerToggle);
    _getCurrentUserData();
    if (Get.arguments != null && Get.arguments is bool && Get.arguments) {
      changeTab(2);
    }
  }

  void _setData() {
    imageLink.value = userDetails.value?.profilePicture ?? AppLabel.NA;
    name.value = userDetails.value?.firstName ?? AppLabel.NA;

    if (userDetails.value?.id != null) {
      mixPanelIdentity(userDetails.value?.id ?? '');
      unawaited(
          Get.find<MixpanelService>().mixpanel.registerSuperPropertiesOnce({
        MixPanelEvents.userId: userDetails.value?.firstName,
        MixPanelEvents.name: userDetails.value?.firstName,
        MixPanelEvents.email: userDetails.value?.email ?? "",
        AppLabel.mobileNo: userDetails.value?.phoneNumber ?? "",
        AppLabel.age: userDetails.value?.age ?? "",
        AppLabel.gender: userDetails.value?.gender ?? "",
        AppLabel.workStatus: userDetails.value?.workStatus ?? "",
      }));
    }
  }

  void _listenDrawerToggle() {
    if (drawerController.isOpen != null && drawerController.isOpen!()) {
      primaryBackground();
      isDrawerOpen = true.obs;
      statusColor.value = AppColors.orange50;
      _setData();
    } else {
      isDrawerOpen = false.obs;
      statusColor.value = AppColors.backgroundWhite;
      defaultBackground();
    }
  }

  Future _getCurrentUserData() async {
    try {
      final failureOrSuccess = await dataRepository.getCurrentUserData();

      await failureOrSuccess.fold((failure) async {
        if (await handleSingleFailure(failure, _getCurrentUserData)) {
          return;
        }
      }, (response) async {
        if (response.success) {
          userDetails.value = response.data;
          if (Get.isRegistered<HomeScreenController>() &&
              userDetails.value != null) {
            Get.find<HomeScreenController>().data.value = userDetails.value;
            Get.find<HomeScreenController>().onFocusGained();
          }
          if (Get.isRegistered<TherapistsScreenController>() &&
              userDetails.value != null) {
            Get.find<TherapistsScreenController>().getMatchMakingData();
          }
          if ((userDetails.value?.isFeedbackExists?.feedbackExists ?? true) ==
                  false &&
              userDetails.value?.isFeedbackExists?.bookingId != null) {
            FeedbackScreenController controller =
                Get.put(FeedbackScreenController());
            controller.setInitialData(FeedbackArgsModel(
                bookingId: userDetails.value?.isFeedbackExists?.bookingId,
                therapistName:
                    userDetails.value?.isFeedbackExists?.therapistName,
                therapistImageUrl:
                    userDetails.value?.isFeedbackExists?.therapistImage));
          }
          _setData();
        } else {
          SnackBarWidget.showSnackBar(response.message, isError: true);
        }
      });
    } catch (error) {
      SnackBarWidget.showSnackBar(AppLabel.somethingWentWrong, isError: true);
    }
  }

  void makeVisibleBottomBar() {
    showBottomBar.value = true;
  }

  void makeInVisibleBottomBar() {
    showBottomBar.value = false;
  }

  void onIconTap(int index) {
    currentIndex.value = index;
  }

  void changeTab(int index) {
    currentIndex.value = index;
    tabController?.index = index;
  }

  void onTermClick() {
    Get.toNamed(Routes.PRIVACY_POLICY_SCREEN);
    drawerController.toggle?.call();
  }
    void onPrivacyPolicyClick() {
    Get.toNamed(Routes.PRIVACY_POLICY_SCREEN,arguments: false);
    drawerController.toggle?.call();
  }

  void onMyProfileClick() {
    Get.toNamed(Routes.USER_PROFILE_SCREEN);
    drawerController.toggle?.call();
  }

  void onSettingClick() {
    Get.toNamed(Routes.SETTING_SCREEN);
    drawerController.toggle?.call();
  }

  void onHelpSupportClick() {
    Get.toNamed(Routes.HELP_SUPPORT_SCREEN);
    drawerController.toggle?.call();
  }

  void toAffirmation() {
    Get.toNamed(Routes.AFFIRMATION_SCREEN);
    drawerController.toggle?.call();
  }

  void toMoodMosaic() {
    drawerController.toggle?.call();
    Get.toNamed(Routes.MOSAIC_SCREEN);
  }

  void toMatchedTherapists() {
    drawerController.toggle?.call();
    if (Get.isRegistered<BottomNavigationScreenController>()) {
      Get.find<BottomNavigationScreenController>().changeTab(2);
    }
  }

  Future<void> onRateClick() async {
    drawerController.toggle?.call();
    try {
      await launchUrl(Uri.parse(
        Platform.isAndroid
            ? '${AppLabel.playStoreURL}${(await getAppPackageName())}'
            : '${AppLabel.appStoreURL}${(await getAppPackageName())}',
      ));
    } catch (err) {
      SnackBarWidget.showSnackBar(AppLabel.failedToRedirect, isError: true);
    }
  }

  @override
  void dispose() {
    drawerController.stateNotifier?.removeListener(_listenDrawerToggle);
    super.dispose();
  }
}
*/
