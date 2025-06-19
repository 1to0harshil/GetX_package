// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:collection/collection.dart';
//
// import 'package:get/get.dart';
// import 'package:humann/app/utils/extension.dart';
// import 'package:humann/app/widget/app_scaffold.dart';
// import 'package:sizer/sizer.dart';
// import 'package:timeline_tile/timeline_tile.dart';
//
// import '../../../core/constants/app_label.dart';
// import '../../../core/constants/app_text_size.dart';
// import '../../../core/constants/images.dart';
// import '../../../core/constants/urls.dart';
// import '../../../core/theme/colors.dart';
// import '../../../core/theme/styles.dart';
// import '../../../data/model/res_model/match_make_res_model.dart';
// import '../../../widget/app_bar_widget.dart';
// import '../../../widget/app_shimmer.dart';
// import '../../../widget/icon_text_widget.dart';
// import '../controllers/therapist_profile_screen_controller.dart';
//
// class TherapistProfileScreenView
//     extends GetView<TherapistProfileScreenController> {
//   const TherapistProfileScreenView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       statusBarBackgroundColor: AppColors.backgroundWhite,
//       body: Obx(
//         ()=> commonAnimateSwitcher(
//             controller.isShimmering.value, shimmerWidget(),
//             isFalseChild: therapistPage()),
//       ),
//     );
//   }
//
//   Widget therapistPage() => Column(
//     children: [
//       appBar(),
//       therapistProfile()
//     ],
//   );
//
//   Widget therapistProfile() => Expanded(
//     child: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           animatedProfileWidget(),
//           2.h.height,
//           SpecializeIntWidget(),
//           2.h.height,
//           EducationWidget(),
//
//           if (controller.data.value.therapistDetails?.whyILoveBeingTherapist?.isNotEmpty ?? false) ...[
//             2.h.height,
//             aboutYouOneWidget(),
//           ],
//
//           2.h.height,
//           userDetailsRow(),
//
//           if (controller.data.value.therapistDetails?.additionalPhotos?.isNotEmpty ?? false) ...[
//             2.h.height,
//             curvedImageOne(),
//           ],
//
//           if (controller.data.value.therapistDetails?.inMySessionsYouWouldHearMeSay?.isNotEmpty ?? false) ...[
//             2.h.height,
//             inMySessionWidget(),
//           ],
//
//           ratedAsListWidgetDetailed(),
//           2.h.height,
//           skilledTechniqueWidget(),
//
//           if (controller.data.value.therapistDetails?.additionalPhotos?.isNotEmpty == true && controller.data.value.therapistDetails!.additionalPhotos!.length > 1 == true ) ...[
//             2.h.height,
//             curvedImageTwoWidget(),
//           ],
//
//           hobbySection(),
//
//           if (controller.data.value.therapistDetails?.whatToExpectFromTherapy?.isNotEmpty ?? false) ...[
//             2.h.height,
//             whatToExpectWidget(),
//           ],
//
//           2.h.height,
//           approachesAndModalities(),
//           2.h.height,
//           aboutYouTwoWidget(),
//         ],
//       )
//
//     ),
//   );
//
//   Widget animatedProfileWidget() => Container(
//     width: 100.w,
//     decoration: BoxDecoration(
//       color: AppColors.backgroundWhite,
//
//       borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(6.w),
//           bottomRight: Radius.circular( 6.w)),
//       boxShadow: [BoxShadow(color: AppColors.grey90.withValues(alpha : 0.2), blurRadius: 4, offset: const Offset(0, 2))],
//       border: Border(bottom: BorderSide(color: AppColors.grey90, width: 0.5.w)),
//     ),
//     padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h, bottom: 1.h),
//     child: Stack(
//       children: [
//         /// Profile Image
//         Container(
//           height: 13.h,
//           width: 25.w,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(4.w),
//             child: Image.network(
//               URLs.imageBaseURL+controller.data.value.profilePicture.toString(),
//               height:13.h,
//               width:25.w ,
//               fit: BoxFit.cover,
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return Center(
//                   child: CircularProgressIndicator(
//                     color: AppColors.orange50, // Change as needed
//                   ),
//                 );
//               },
//               errorBuilder: (context, error, stackTrace) => Image.asset(
//                 AppImages.therapistPlaceHolder,
//                 height:13.h,
//                 width:25.w ,
//               ),
//             ),
//           ),
//         ),
//
//         /// User Info
//         Positioned(
//           left:  28.w,
//           child:Align(
//                   alignment: Alignment.centerLeft,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "${controller.data.value.name}",
//                         style: AppStyle.regularSitkaTextStyle(
//                             size: AppTextSize.header1,
//                             color: AppColors.grey30,
//                             fontWeight: FontWeight.w700),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 2.w, vertical: 1.0.h),
//                         decoration: BoxDecoration(
//                             color: AppColors.grey100,
//                             borderRadius: BorderRadius.circular(4.w),
//                             border: Border.all(
//                               width: 0.2.w,
//                               color: AppColors.grey60,
//                             )),
//                         child: Text(
//                           controller.data.value.therapistDetails?.therapistRole ??
//                               AppLabel.NA,
//                           style: AppStyle.regularTextStyle(
//                               size: AppTextSize.header5,
//                               color: AppColors.grey50,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   )),
//         ),
//
//       ],
//     ),
//   );
//
//   Widget SpecializeIntWidget() {
//
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       margin: EdgeInsets.symmetric(horizontal: 4.w),
//       decoration: BoxDecoration(
//           color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset(
//                 AppImages.specializeImage,
//                 width: 5.w,
//                 height: 4.h,
//               ),
//               Text(
//                 AppLabel.specializeInString,
//                 style: AppStyle.regularTextStyle(
//                     size: AppTextSize.header5,
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.grey70),
//               ).marginOnly(left: 2.w),
//             ],
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Obx(() {
//               return Wrap(
//                 children: controller.specializationList.mapIndexed(
//                       (index, e) {
//                     return GestureDetector(
//                       onTap: () {
//                         if (index == 3) {
//                           controller.addWholeSpecializationList();
//                         }
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 2.w, vertical: 1.h),
//                         margin: EdgeInsets.only(top: 0.5.h, left: 0.5.h),
//                         decoration: BoxDecoration(
//                           color: AppColors.blue100,
//                           borderRadius: BorderRadius.circular(4.w),
//                         ),
//                         child: Text(
//                           e,
//                           style: AppStyle.regularTextStyle(
//                             size: AppTextSize.header4,
//                             color: AppColors.grey40,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       )
//                           .animate()
//                           .fadeIn(duration: const Duration(milliseconds: 750)),
//                     );
//                   },
//                 ).toList(),
//               );
//             }),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget EducationWidget() {
//     return Column(
//       children: [
//         Row(
//           children: [
//             SvgPicture.asset(
//               AppImages.borderedEducation,
//               width: 5.w,
//               height: 4.h,
//             ),
//             Text(
//               AppLabel.educationQuaString,
//               style: AppStyle.regularTextStyle(
//                   size: AppTextSize.header5,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.grey70),
//             ).marginOnly(left: 2.w),
//           ],
//         ),
//         EducationStoryLine()
//       ],
//     ).marginSymmetric(horizontal: 6.w);
//   }
//
//   Widget EducationStoryLine() {
//     final academicBackground = controller.data.value.therapistDetails?.academicBackground ??
//         [];
//
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       scrollDirection: Axis.vertical,
//       itemCount: academicBackground.length,
//       itemBuilder: (context, index) {
//         AcademicBackground data = academicBackground[index];
//
//         return TimelineTile(
//           isFirst: index == 0,
//           isLast: index == academicBackground.length - 1,
//           alignment: TimelineAlign.start,
//           indicatorStyle: IndicatorStyle(
//             width: 2.w,
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             color: AppColors.grey70,
//           ),
//           afterLineStyle: LineStyle(
//             thickness: .5.w,
//             color: AppColors.grey70,
//           ),
//           beforeLineStyle: LineStyle(
//             thickness: .5.w,
//
//             color: AppColors.grey70,
//           ),
//           endChild: degreeDetailsWidget(data),
//         ).marginOnly(left: 2.w);
//       },
//     );
//   }
//
//   Widget degreeDetailsWidget(AcademicBackground data) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           data.degreeName ?? AppLabel.NA,
//           style: AppStyle.regularTextStyle(
//               size: AppTextSize.header4,
//               color: AppColors.grey40,
//               fontWeight: FontWeight.w700),
//         ),
//         Row(
//           children: [
//             Text(
//               " ${data.universityName}",
//               style: AppStyle.regularTextStyle(
//                   size: AppTextSize.header5,
//                   color: AppColors.grey80,
//                   fontWeight: FontWeight.w400),
//             ),
//             SvgPicture.asset(
//               AppImages.starImage,
//               width: 1.5.w,
//               height: 1.5.h,
//             ).paddingSymmetric(horizontal: 1.w),
//             Text(
//               "${data.graduationYear ?? AppLabel.NA}",
//               style: AppStyle.regularTextStyle(
//                   size: AppTextSize.header5,
//                   color: AppColors.grey60,
//                   fontWeight: FontWeight.w400),
//             ),
//           ],
//         ),
//       ],
//     ).marginOnly(top: 2.h, left: 4.w);
//   }
//
//   Widget aboutYouOneWidget() {
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       margin: EdgeInsets.symmetric(horizontal: 4.w),
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//           color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             AppLabel.whyiLoveBeingTherapist,
//             style: AppStyle.regularTextStyle(
//                 size: AppTextSize.header5,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.grey70),
//           ).marginOnly(left: 2.w, bottom: 2.w),
//           Text(
//             controller.data.value.therapistDetails?.whyILoveBeingTherapist ??
//                 AppLabel.NA,
//             style: AppStyle.regularTextStyle(
//                 size: AppTextSize.header4,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.grey40),
//           ).marginOnly(left: 2.w),
//         ],
//       ),
//     );
//   }
//
//   Widget userDetailsRow() {
//     return SingleChildScrollView(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           5.sWidth,
//           if (controller.data.value.therapistDetails?.location?.isNotEmpty ?? false)
//             IconTextWidget(
//               asset: AppImages.locationImage,
//               text: controller.data.value.therapistDetails!.location!,
//             ),
//
//           if ((controller.data.value.therapistDetails?.location?.isNotEmpty ?? false) &&
//               (controller.data.value.therapistDetails?.totalWorkExperience?.isNotEmpty ?? false))
//             0.4.w.width,
//
//           // Work Experience
//           if (controller.data.value.therapistDetails?.totalWorkExperience?.isNotEmpty ?? false)
//             IconTextWidget(
//               asset: AppImages.workHistorySvg,
//               text: controller.data.value.therapistDetails!.totalWorkExperience!,
//             ).marginOnly(left: 2.w),
//
//           // Separator if both Work Experience and Pronouns exist
//           if ((controller.data.value.therapistDetails?.totalWorkExperience?.isNotEmpty ?? false) &&
//               (controller.data.value.therapistDetails?.pronouns?.isNotEmpty ?? false))
//             SizedBox(width: 0.4.w),
//
//           // Pronouns
//           if (controller.data.value.therapistDetails?.pronouns?.isNotEmpty ?? false)
//             IconTextWidget(
//               asset: AppImages.pronounceImage,
//               text: controller.data.value.therapistDetails!.pronouns!,
//             ).marginOnly(left: 2.w),
//
//           // Separator if both Pronouns and Age exist
//           if ((controller.data.value.therapistDetails?.pronouns?.isNotEmpty ?? false) &&
//               (controller.data.value.age != null))
//             SizedBox(width: 0.4.w),
//
//           // Age
//           if (controller.data.value.age != null)
//             IconTextWidget(
//               asset: AppImages.dobCandleImage,
//               text: controller.data.value.age
//                   ?.toString() ??
//                   AppLabel.NA,
//             ).marginSymmetric(horizontal: 4.w),
//         ],
//       ),
//     );
//   }
//
//   Widget inMySessionWidget() {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.all(3.w),
//       margin: EdgeInsets.symmetric(horizontal: 4.w),
//       decoration: BoxDecoration(
//           color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             AppLabel.inMySessionYouString,
//             style: AppStyle.regularTextStyle(
//                 size: AppTextSize.header5,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.grey70),
//           ).marginOnly(left: 2.w, bottom: 2.w),
//           Text(
//             controller.data.value.therapistDetails!
//                 .inMySessionsYouWouldHearMeSay ??
//                 "",
//             style: AppStyle.regularTextStyle(
//                 size: AppTextSize.header4,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.grey40),
//           ).marginOnly(left: 2.w),
//         ],
//       ),
//     );
//   }
//
//   Widget ratedAsListWidgetDetailed() {
//     // return Container(
//     //   padding: EdgeInsets.only(
//     //     left: 3.w,
//     //     bottom: 3.w,
//     //     top: 3.w,
//     //   ),
//     //   margin: EdgeInsets.symmetric(horizontal: 4.w),
//     //   decoration: BoxDecoration(
//     //       color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//     //   child: Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: [
//     //       Text(
//     //         AppLabel.ratedAs,
//     //         style: AppStyle.regularTextStyle(
//     //             size: AppTextSize.header4,
//     //             color: AppColors.grey70,
//     //             fontWeight: FontWeight.w700),
//     //       ),
//     //       0.5.h.height,
//     //       /*SizedBox(
//     //         height: 4.h,
//     //         child: ListView.builder(
//     //           scrollDirection: Axis.horizontal,
//     //           reverse: true,
//     //           shrinkWrap: true,
//     //           itemCount: controller.data.value.therapistDetails?.ratedAsList.length,
//     //           itemBuilder: (context, index) {
//     //             RatedAsModel ratedModel =
//     //             controller.therapistModel.ratedAsList[index];
//     //             String asset = (ratedModel.type == 1)
//     //                 ? AppImages.securityCheckImage
//     //                 : (ratedModel.type == 2)
//     //                 ? AppImages.favouriteImage
//     //                 : AppImages.securityLockImage;
//     //
//     //             return Container(
//     //               padding:
//     //               EdgeInsets.symmetric(vertical: .5.h, horizontal: 1.h),
//     //               margin: EdgeInsets.only(left: 0.5.w),
//     //               decoration: BoxDecoration(
//     //                   color: AppColors.blue100,
//     //                   borderRadius: BorderRadius.circular(10.w)),
//     //               child: Row(
//     //                 children: [
//     //                   SvgPicture.asset(
//     //                     asset,
//     //                     colorFilter: ColorFilter.mode(
//     //                         AppColors.orange50, BlendMode.srcIn),
//     //                   ),
//     //                   Text(
//     //                     ratedModel.value,
//     //                     style: AppStyle.regularTextStyle(
//     //                         size: AppTextSize.header4,
//     //                         fontWeight: FontWeight.w600,
//     //                         color: AppColors.grey40),
//     //                   ).marginOnly(left: 2.w)
//     //                 ],
//     //               ),
//     //             );
//     //           },
//     //         ),
//     //       ),*/
//     //     ],
//     //   ),
//     // );
//
//     return const SizedBox.shrink();
//   }
//
//   Widget skilledTechniqueWidget() {
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       margin: EdgeInsets.symmetric(horizontal: 4.w),
//       decoration: BoxDecoration(
//           color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//       child: SizedBox(
//         height: 4.h,
//         child: ListView.builder(
//           itemCount: controller.data.value.therapistDetails
//               ?.specializationsTrainingCertifications?.length ??
//               0,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             String value = controller.data.value.therapistDetails
//                 ?.specializationsTrainingCertifications?[index] ??
//                 "";
//             return Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 3.w,
//               ),
//               margin: EdgeInsets.only(left: index == 0 ? 1.w : 2.w),
//               decoration: BoxDecoration(
//                   color: AppColors.purple50,
//                   borderRadius: BorderRadius.circular(3.w)),
//               child: Center(
//                 child: Text(
//                   value,
//                   style: AppStyle.regularTextStyle(
//                       size: AppTextSize.header4,
//                       color: AppColors.grey40,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget whatToExpectWidget() {
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       margin: EdgeInsets.symmetric(horizontal: 4.w),
//       decoration: BoxDecoration(
//           color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             AppLabel.whatToExpectString,
//             style: AppStyle.regularTextStyle(
//                 size: AppTextSize.header5,
//                 color: AppColors.grey70,
//                 fontWeight: FontWeight.w700),
//           ),
//           1.h.height,
//           Container(
//             padding: EdgeInsets.all(3.w),
//             margin: EdgeInsets.only(top: 1.h),
//             decoration: BoxDecoration(
//                 color: AppColors.grey110,
//                 borderRadius: BorderRadius.circular(4.w)),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SvgPicture.asset(AppImages.checkImage).marginOnly(top: 0.5.h),
//                 3.w.width,
//                 Expanded(
//                   child: Text(
//                     controller.data.value
//                         .therapistDetails!.whatToExpectFromTherapy!,
//                     style: AppStyle.regularTextStyle(
//                         size: AppTextSize.header4,
//                         color: AppColors.grey50,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget curvedImageOne() {
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       margin: EdgeInsets.symmetric(horizontal: 3.w),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(4.w),
//         child: Container(
//           width: double.maxFinite,
//           decoration: BoxDecoration(
//               color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.network(
//                 width: double.maxFinite,
//                 height: 25.h,
//                 "${URLs.imageBaseURL}${controller.data.value.therapistDetails?.additionalPhotos?[0]}",
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: AppColors.orange50, // Change as needed
//                     ),
//                   );
//                 },
//                 errorBuilder: (context, error, stackTrace) {
//                   return 0.sHeight;
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget curvedImageTwoWidget() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(4.w),
//       child: Image.network(
//         width: double.maxFinite,
//         height: 25.h,
//         "${URLs.imageBaseURL}${controller.data.value.therapistDetails?.additionalPhotos?[1]}",
//         fit: BoxFit.cover,
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) return child;
//           return Center(
//             child: CircularProgressIndicator(
//               color: AppColors.orange50, // Change as needed
//             ),
//           );
//         },
//         errorBuilder: (context, error, stackTrace) {
//           return 0.sHeight;
//         },
//       ),
//     ).marginSymmetric(horizontal: 4.w);
//   }
//
//   Widget hobbySection() {
//
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       margin:EdgeInsets.symmetric(horizontal: 4.w),
//       child: Column(
//         children: [
//           checkNullAndAdd(
//               controller.data.value.therapistDetails?.favoriteBooks.isNullEmpty == false,
//               Row(
//                 children: [
//                   SvgPicture.asset(
//                     AppImages.bookImage,
//                     width: 6.w,
//                     height: 4.h,
//                   ),
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           AppLabel.bookIReadString,
//                           style: AppStyle.regularTextStyle(
//                               size: AppTextSize.header5,
//                               color: AppColors.grey70,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         0.2.h.height,
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Text(
//                             controller.data.value.therapistDetails?.favoriteBooks?.join(", ") ??
//                                 AppLabel.NA,
//                             style: AppStyle.regularTextStyle(
//                                 size: AppTextSize.header4,
//                                 color: AppColors.grey40,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         )
//                       ],
//                     ).marginOnly(left: 2.w),
//                   )
//                 ],
//               )),
//           checkNullAndAdd(
//               controller.data.value.therapistDetails?.favoriteBooks.isNullEmpty == false,
//               Divider(
//                 height: .1.h,
//                 color: AppColors.grey90,
//               ).marginSymmetric(vertical: 1.h)),
//           checkNullAndAdd(
//               controller.data.value.therapistDetails?.hobbies.isNullEmpty == false,
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(2.w),
//                     decoration: BoxDecoration(
//                         color: AppColors.orange100,
//                         borderRadius: BorderRadius.circular(3.w)),
//                     child: SvgPicture.asset(
//                       AppImages.starsImage,
//                       width: 6.w,
//                       height: 2.5.h,
//                       colorFilter:
//                       ColorFilter.mode(AppColors.black, BlendMode.srcIn),
//                     ),
//                   ),
//                   Flexible(
//                     child: SingleChildScrollView(
//                       child: Text(
//                         controller.data.value.therapistDetails?.hobbies?.join(", ") ??
//                             AppLabel.NA,
//                         style: AppStyle.regularTextStyle(
//                             size: AppTextSize.header4,
//                             color: AppColors.grey40,
//                             fontWeight: FontWeight.w600),
//                       ).marginOnly(left: 2.w),
//                     ),
//                   )
//                 ],
//               )),
//           checkNullAndAdd(
//               controller.data.value.therapistDetails?.languagesSpoken.isNullEmpty == false,
//               Divider(
//                 height: .1.h,
//                 color: AppColors.grey90,
//               ).marginSymmetric(vertical: 1.h)),
//           checkNullAndAdd(
//               controller.data.value.therapistDetails?.languagesSpoken.isNullEmpty == false,
//               Row(
//                 children: [
//                   SvgPicture.asset(
//                     AppImages.languageImage,
//                     width: 6.w,
//                     height: 4.h,
//                   ),
//                   Flexible(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       child: Text(
//                         controller.data.value.therapistDetails?.languagesSpoken?.join(", ") ??
//                             AppLabel.NA,
//                         style: AppStyle.regularTextStyle(
//                             size: AppTextSize.header4,
//                             color: AppColors.grey40,
//                             fontWeight: FontWeight.w600),
//                       ).marginOnly(left: 2.w),
//                     ),
//                   )
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
//
//   Widget approachesAndModalities() {
//
//     return Container(
//         padding: EdgeInsets.all(3.w),
//         margin: EdgeInsets.symmetric(horizontal: 4.w),
//         decoration: BoxDecoration(
//             color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   AppImages.pencilImage,
//                   width: 6.w,
//                   height: 4.h,
//                 ),
//                 Text(
//                   AppLabel.approachesString,
//                   style: AppStyle.regularTextStyle(
//                       size: AppTextSize.header5,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.grey70),
//                 ).marginOnly(left: 2.w),
//               ],
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Obx(() {
//                 return Wrap(
//                   children: controller.modalitiesList.mapIndexed(
//                         (index, e) {
//                       return GestureDetector(
//                         onTap: () {
//                           if (index == 3) {
//                             controller.addWholeModalitiesList();
//                           }
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 2.w, vertical: 1.h),
//                           margin: EdgeInsets.only(top: 0.5.h, left: 0.5.h),
//                           decoration: BoxDecoration(
//                             color: AppColors.blue100,
//                             borderRadius: BorderRadius.circular(4.w),
//                           ),
//                           child: Text(
//                             e,
//                             style: AppStyle.regularTextStyle(
//                               size: AppTextSize.header4,
//                               color: AppColors.grey40,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ).animate().fadeIn(
//                             duration: const Duration(milliseconds: 750)),
//                       );
//                     },
//                   ).toList(),
//                 );
//               }),
//             )
//           ],
//         ));
//   }
//
//   Widget aboutYouTwoWidget() {
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       margin: EdgeInsets.symmetric(horizontal: 4.w),
//       decoration: BoxDecoration(
//           color: AppColors.white70, borderRadius: BorderRadius.circular(4.w)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             AppLabel.whatMakesUsHuman,
//             style: AppStyle.regularTextStyle(
//                 size: AppTextSize.header5,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.grey70),
//           ).marginOnly(bottom: 2.w),
//           SizedBox(
//             height: 4.h,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: controller.data.value
//                   .therapistDetails?.whatMakesUsHumann?.length ??
//                   0,
//               itemBuilder: (context, index) {
//                 String value = controller
//                     .data.value
//                     .therapistDetails
//                     ?.whatMakesUsHumann?[index] ??
//                     "";
//                 return Center(
//                   child: Text(
//                     value,
//                     style: AppStyle.regularTextStyle(
//                         size: AppTextSize.header4,
//                         color: AppColors.grey40,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return Container(
//                   width: 0.5.w,
//                   color: AppColors.grey80,
//                 ).marginOnly(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h);
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
//   Widget checkNullAndAdd(bool isnullOrNot, Widget widget) {
//     return isnullOrNot ? widget : 0.sHeight;
//   }
//
//
//   Widget appBar() {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       child:AppBarWidget(
//         isCancelVisible: false,
//         color: AppColors.orange50,
//       )
//     );
//   }
//
//   Widget commonAnimateSwitcher(
//       bool condition, Widget isTrueChild,
//       {Widget isFalseChild = const SizedBox()}) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       child: condition ? isTrueChild : isFalseChild,
//     );
//   }
//
//   Widget shimmerWidget() {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.w), color: AppColors.white70),
//         margin: EdgeInsets.only(bottom: 4.w, left: 2.w, right: 2.w, top: 2.w),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 AppShimmerWidget(
//                   child: Container(
//                     height: 40.h,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.w),
//                       color: AppColors.white,
//                     ),
//                   ).marginAll(4.w),
//                 ),
//               ],
//             ),
//             Stack(
//               children: [
//                 AppShimmerWidget(
//                   child: Container(
//                     height: 40.h,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.w),
//                       color: AppColors.black,
//                     ),
//                   ).marginAll(4.w),
//                 ),
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   bottom: 0,
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: 6.h,
//                         margin:
//                         EdgeInsets.only(right: 8.w, left: 8.w, bottom: 4.h),
//                         width: double.maxFinite,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(2.w),
//                           color: AppColors.white30,
//                         ),
//                       ),
//                       Positioned(
//                         right: 0,
//                         top: 0,
//                         bottom: 0,
//                         child: SizedBox(
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: Container(
//                               width: 25.w,
//                               margin: EdgeInsets.only(right: 10.w, bottom: 4.h),
//                               height: 4.h,
//                               decoration: BoxDecoration(
//                                   color: AppColors.white70,
//                                   borderRadius: BorderRadius.circular(6.w)),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
