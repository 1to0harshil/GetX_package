/*
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:humann/app/core/constants/app_constant.dart';
import 'package:humann/app/core/constants/app_text_size.dart';
import 'package:humann/app/core/theme/colors.dart';
import 'package:humann/app/modules/home_screen/views/home_screen_view.dart';
import 'package:humann/app/modules/therapists_screen/views/therapists_screen_view.dart';
import 'package:humann/app/utils/extension.dart';
import 'package:humann/app/widget/app_scaffold.dart';
import 'package:humann/app/widget/custom_tap.dart';
import 'package:humann/app/widget/fade_indexed_stack.dart';
import 'package:humann/app/widget/style_bottom_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_label.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/urls.dart';
import '../../../core/theme/styles.dart';
import '../../../widget/app_shimmer.dart';
import '../../session_screen/views/session_screen_view.dart';
import '../controllers/bottom_navigation_screen_controller.dart';

class BottomNavigationScreenView
    extends GetView<BottomNavigationScreenController> {
  const BottomNavigationScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentIndex.value != 0 &&
            controller.showBottomBar.value) {
          controller.changeTab(0);
          return false;
        }
        return true;
      },
      child: Obx(
        () => AppScaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.statusColor.value,
          statusBarBackgroundColor: controller.statusColor.value,
          body: ZoomDrawer(
            menuScreen: _menuScreen(),
            isOpenDrawer: controller.isDrawerOpen.value,
            menuBackgroundColor: AppColors.orange50,
            controller: controller.drawerController,
            borderRadius: 8.w,
            showShadow: true,
            angle: 0.0,
            shadowLayer1Color: Colors.transparent,
            shadowLayer2Color: AppColors.orange60.withValues(alpha: 0.6),
            slideWidth: 65.w,
            disableDragGesture: true,
            mainScreenTapClose: true,
            androidCloseOnBackTap: false,
            mainScreen: _mainScreen(),
            mainScreenScale: 0.1,
          ),
        ),
      ),
    );
  }

  TabItem<Widget> _tabItem(String asset, String title) {
    return TabItem(
        icon: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(AppColors.grey60, BlendMode.srcIn),
        ),
        title: title,
        fontFamily: AppStyle.fontFamily1,
        activeIcon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.orange50),
            child: SvgPicture.asset(
              asset,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            )));
  }

  Widget _menuScreen() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: EdgeInsets.only(left: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          7.h.height,
          Row(
            children: [
              Obx(
                () => controller.imageLink.value.isNotEmpty
                    ? SizedBox(
                        height: 17.w,
                        width: 17.w,
                        child: ClipOval(
                          child: Image.network(
                            URLs.imageBaseURL +
                                (controller.userDetails.value?.profilePicture ??
                                    ''),
                            fit: BoxFit.cover,
                            width: 17.w,
                            height: 17.w,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return AppShimmerWidget(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white70,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                _nameInitialProfile(),
                          ),
                        ),
                      )
                    : _nameInitialProfile(),
              ),
              2.w.width,
              Obx(() {
                return Expanded(
                  child: Text(
                    controller.name.value,
                    style: AppStyle.regularSitkaTextStyle(
                        size: AppTextSize.header3,
                        color: AppColors.white70,
                        fontWeight: FontWeight.w700),
                  ),
                );
              })
            ],
          ),
          3.h.height,
          CustomTap(
              onTap: () {
                controller.onMyProfileClick();
              },
              child: _iconTitleWidget(AppImages.icProfile, AppLabel.myProfile)),
          1.5.h.height,
          _iconTitleWidget(
                  AppImages.icMatchedTherapist, AppLabel.matchTherapist)
              .setCustomClick(controller.toMatchedTherapists),
          1.5.h.height,
          _iconTitleWidget(AppImages.icMoodMosaic, AppLabel.myMoodMosaic)
              .setCustomClick(controller.toMoodMosaic),
          1.5.h.height,
          _iconTitleWidget(AppImages.icAffirmation, AppLabel.affirmation)
              .setCustomClick(controller.toAffirmation),
          1.5.h.height,
          CustomTap(
              onTap: () {
                controller.onSettingClick();
              },
              child: _iconTitleWidget(AppImages.icSetting, AppLabel.settings)),
          const Spacer(),
          SizedBox(
            width: double.maxFinite,
            child: Text(
              AppLabel.helpAndSupport,
              style: AppStyle.regularTextStyle(
                size: AppTextSize.header5,
                color: AppColors.white70,
                fontWeight: FontWeight.w600,
                letterSpacing: AppConstants.headingLetterSpacing,
              ),
            ).setCustomClick(controller.onHelpSupportClick),
          ),
          2.5.h.height,
          SizedBox(
            width: double.maxFinite,
            child: Text(
              AppLabel.terms,
              style: AppStyle.regularTextStyle(
                size: AppTextSize.header5,
                color: AppColors.white70,
                fontWeight: FontWeight.w600,
                letterSpacing: AppConstants.headingLetterSpacing,
              ),
            ),
          ).setCustomClick(controller.onTermClick),
          2.5.h.height,
          SizedBox(
            width: double.maxFinite,
            child: Text(
              AppLabel.privacyPolicy.toUpperCase(),
              style: AppStyle.regularTextStyle(
                size: AppTextSize.header5,
                color: AppColors.white70,
                fontWeight: FontWeight.w600,
                letterSpacing: AppConstants.headingLetterSpacing,
              ),
            ),
          ).setCustomClick(controller.onPrivacyPolicyClick),
          2.5.h.height,
          SizedBox(
            width: double.maxFinite,
            child: Text(
              AppLabel.rateUs,
              style: AppStyle.regularTextStyle(
                size: AppTextSize.header5,
                color: AppColors.white70,
                fontWeight: FontWeight.w600,
                letterSpacing: AppConstants.headingLetterSpacing,
              ),
            ).setCustomClick(controller.onRateClick),
          ),
          5.h.height,
          Obx(() {
            return Text(
              "${AppLabel.appVersion} ${controller.appVersion.value}",
              style: AppStyle.regularTextStyle(
                  size: AppTextSize.title,
                  color: AppColors.orange80,
                  fontWeight: FontWeight.w500),
            );
          }),
          2.5.h.height,
        ],
      ),
    );
  }

  Widget _mainScreen() {
    return AppScaffold(
      backgroundColor: AppColors.backgroundWhite1,
      body: Obx(() {
        return Stack(
          children: [
            FadeIndexedStack(
              index: controller.currentIndex.value,
              children: [
                const HomeScreenView(),
                const SessionScreenView(),
                const TherapistsScreenView(),
              ],
            ).marginOnly(bottom: controller.showBottomBar.value ? 2.h : 0),
            Positioned(
                left: 2.screenWidth,
                right: 2.screenWidth,
                bottom: 2.screenWidth,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1100),
                  child: controller.showBottomBar.value
                      ? Container(
                          child: StyleProvider(
                            style: StyleBottomBar(),
                            child: SafeArea(
                              child: ConvexAppBar(
                                items: [
                                  _tabItem(AppImages.homeIcon, AppLabel.home),
                                  _tabItem(AppImages.sessionsIcon,
                                      AppLabel.sessions),
                                  _tabItem(AppImages.therapistsIcon,
                                      AppLabel.therapists),
                                ],
                                onTap: (index) {
                                  controller.onIconTap(index);
                                },
                                controller: controller.tabController,
                                initialActiveIndex:
                                    controller.currentIndex.value,
                                top: 0 - 4.5.w,
                                curveSize: 14.w,
                                height: 66,
                                backgroundColor: AppColors.grey110,
                                shadowColor: AppColors.bottomNavShadow,
                                activeColor: AppColors.grey40,
                                color: AppColors.grey60,
                                style: TabStyle.react,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ))
          ],
        );
      }),
    );
  }

  Widget _iconTitleWidget(String asset, String title) {
    return Container(
      width: double.maxFinite,
      child: Row(
        children: [
          SvgPicture.asset(
            asset,
            width: 4.w,
            height: 4.h,
          ),
          2.w.width,
          Text(
            title,
            style: AppStyle.regularTextStyle(
                size: AppTextSize.header5,
                fontWeight: FontWeight.w600,
                color: AppColors.white70),
          )
        ],
      ),
    );
  }

  Widget _nameInitialProfile() {
    return Container(
      height: 15.w,
      width: 15.w,
      decoration:
          BoxDecoration(color: AppColors.purple1, shape: BoxShape.circle),
      child: Center(
        child: Text(
          controller.userDetails.value?.firstName
                  ?.substring(0, 1)
                  .toUpperCase() ??
              AppLabel.questionMarkSymbol,
          style: AppStyle.regularSitkaTextStyle(
              size: AppTextSize.header1, color: AppColors.white),
        ),
      ),
    );
  }
}
*/
