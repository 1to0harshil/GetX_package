/*
import 'dart:io';

import 'package:get/get.dart';
import 'package:humann/app/core/constants/enums.dart';
import 'package:humann/app/data/model/req_model/register_req_model.dart';
import 'package:humann/app/data/model/res_model/register_res_model.dart';
import 'package:intl/intl.dart';

import '../../../core/base/base_getx_controller.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/constants/strings.dart';
import '../../../core/storage/storage_helper.dart';
import '../../../data/model/widget_model_dir/widget_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/date_extension.dart';
import '../../../utils/extension.dart';
import '../../../widget/snackbar_cell.dart';

class UserDetailScreenController extends BaseGetXController {
  var aboutYouList = <WidgetModel>[].obs;
  var currentIndex = 0.obs, dob = "".obs;
  RxBool isNameValid = false.obs;
  RxBool isDOBValid = false.obs;
  DateTime? dateOfBirth;

  WidgetModel get currentWidget => aboutYouList[currentIndex.value];

  bool get isButtonEnable => currentIndex.value == 0
      ? isNameValid.value
      : currentIndex.value == 1
          ? isDOBValid.value
          : currentIndex.value >= 2
              ? !aboutYouList[currentIndex.value].list.haseSelectedOption
              : true;

  @override
  void onInit() {
    setPrimaryBackground();
    _createAboutYouList();
    super.onInit();
    textController[0].addListener(checkUserName);
    textController[1].addListener(_isOlderThan18Years);
    mixPanelTimeEvent(MixPanelEvents.signing_up_event);

  }

  void checkUserName() {
    if (textController[0].text.trim().isNotEmpty) {
      isNameValid.value = true;
    } else {
      isNameValid.value = false;
    }
  }

  _createAboutYouList() {
    //View Type
    //1 - Name What should we call you
    //2 - Birthdate
    //3 - Identify Your self
    //4 - relationShip Status
    //5 - Goal/Sign

    //Selection Type
    //null : EditText
    //1 - Only Border
    //2 - Border With Color
    //3 - Border With Tick & Color

    aboutYouList.value = [
      WidgetModel(
        title: AppLabel.whatShouldWeCall,
        description: AppLabel.tellUsAboutYou,
        type: 1,
        list: [],
      ),
      WidgetModel(
        title: AppLabel.yourDateOfBirth,
        description: AppLabel.tellUsAboutYou,
        type: 2,
        list: [],
      ),
      WidgetModel(
        title: AppLabel.yourGenderIdentity,
        description: AppLabel.tellUsAboutYou,
        type: 3,
        selectionType: 2,
        list: [
          WidgetItemModel(
              title: GenderType.male.title, genderType: GenderType.male),
          WidgetItemModel(
              title: GenderType.female.title, genderType: GenderType.female),
          WidgetItemModel(
              title: GenderType.nonBinary.title,
              genderType: GenderType.nonBinary),
        ],
      ),
      WidgetModel(
        title: AppLabel.yourRelationStatus,
        description: AppLabel.tellUsAboutYou,
        type: 3,
        selectionType: 2,
        isResetAvailable: true,
        list: [
          WidgetItemModel(
              title: RelationStatus.single.title,
              relationStatus: RelationStatus.single),
          WidgetItemModel(
              title: RelationStatus.married.title,
              relationStatus: RelationStatus.married),
          WidgetItemModel(
              title: RelationStatus.divorced.title,
              relationStatus: RelationStatus.divorced),
          WidgetItemModel(
              title: RelationStatus.inRelation.title,
              relationStatus: RelationStatus.inRelation),
        ],
      ),
      WidgetModel(
        title: AppLabel.workStatusQuestion,
        description: AppLabel.tellUsAboutYou,
        type: 3,
        selectionType: 2,
        isResetAvailable: true,
        list: [
          WidgetItemModel(
              title: WorkStatus.selfEmployed.title,
              workStatus: WorkStatus.selfEmployed),
          WidgetItemModel(
              title: WorkStatus.entrepreneur.title,
              workStatus: WorkStatus.entrepreneur),
          WidgetItemModel(
              title: WorkStatus.student.title, workStatus: WorkStatus.student),
          WidgetItemModel(
              title: WorkStatus.unemployed.title,
              workStatus: WorkStatus.unemployed),
          WidgetItemModel(
              title: WorkStatus.lookingForJob.title,
              workStatus: WorkStatus.lookingForJob),
          WidgetItemModel(
              title: WorkStatus.employed.title,
              workStatus: WorkStatus.employed),
        ],
      ),
    ];
  }

  moveToNext() {
    if (aboutYouList.length > currentIndex.value + 1) {
      currentIndex.value = currentIndex.value + 1;
    } else {
      _registerUser();
    }
  }

  moveToPrevious() {
    if (currentIndex.value > 0) {
      currentIndex.value = currentIndex.value - 1;
    } else {
      mixPanelTrackEvent(MixPanelEvents.signing_up_cancelled_event);
      Get.back(result: true);
    }
  }

  updateSelection(int index) {
    final currentList = aboutYouList[currentIndex.value].list;
    if (currentList != null) {
      if (currentIndex.value == 2 ||
          currentIndex.value == 3 ||
          currentIndex.value == 4) {
        for (int i = 0; i < currentList.length; i++) {
          currentList[i].isSelected = (i == index);
        }
      } else {
        currentList[index].isSelected = !currentList[index].isSelected;
      }
      aboutYouList.refresh();
    }
  }

  void manageSkip() {
    if (currentIndex.value == 1) {
      dateOfBirth = null;
      textController[1].text = '';
    } else if (currentIndex.value == 2 ||
        currentIndex.value == 3 ||
        currentIndex.value == 4) {
      final currentList = aboutYouList[currentIndex.value].list;
      for (int i = 0; i < (currentList?.length ?? 0); i++) {
        currentList?[i].isSelected = false;
      }
      aboutYouList.refresh();
    }
    moveToNext();
  }

  void preferNotToSay() {
    final currentList = aboutYouList[currentIndex.value].list;
    for (int i = 0; i < (currentList?.length ?? 0); i++) {
      currentList?[i].isSelected = false;
    }
    aboutYouList.refresh();
    manageSkip();
  }

  void changeDOB(DateTime date) {
    dateOfBirth = date;
    textController[1].text =
        formatDate(date.toString(), DateFormat('dd MMMM yyyy'));
  }

  void _isOlderThan18Years() {
    DateFormat inputFormat = DateFormat('dd MMMM yyyy');
    if (textController[1].text.trim().isNullEmpty) {
      isDOBValid.value = false;
    }
    if (textController[1].text.trim().isNotEmpty) {
      DateTime inputDate = inputFormat.parse(textController[1].text.trim());
      DateTime thresholdDate =
          DateTime.now().subtract(const Duration(days: 18 * 365));
      isDOBValid.value = inputDate.isBefore(thresholdDate);
    }
  }

  void validateData() {
    if (currentIndex.value == 0 && textController[0].text.trim().isEmpty) {
      SnackBarWidget.showSnackBar(AppLabel.nameValidation);
      return;
    }
    if (currentIndex.value == 1 && !isDOBValid.value) {
      return;
    }
    if (currentIndex >= 2) {
      if (aboutYouList[currentIndex.value].list.haseSelectedOption) {
        SnackBarWidget.showSnackBar(AppLabel.anyOneOption.select);
        return;
      }
    }
    moveToNext();
  }

  Future<void> _registerUser() async {
    try {
      int genderIndex =
          aboutYouList[2].list?.indexWhere((element) => element.isSelected) ??
              -1;
      int relationIndex =
          aboutYouList[3].list?.indexWhere((element) => element.isSelected) ??
              -1;
      int workIndex =
          aboutYouList[4].list?.indexWhere((element) => element.isSelected) ??
              -1;
      isLoading.value = true;
      RegisterReqModel req = RegisterReqModel(
        firstName: textController[0].text.trim(),
        birthDate: dateOfBirth == null
            ? null
            : formatDate(dateOfBirth.toString(), DateFormat('dd/MM/yyyy')),
        gender: genderIndex == -1
            ? GenderType.noPreference.value
            : aboutYouList[2].list?[genderIndex].genderType?.value,
        realtionStatus: relationIndex == -1
            ? null
            : aboutYouList[3].list?[relationIndex].relationStatus?.value,
        workStatus: workIndex == -1
            ? null
            : aboutYouList[4].list?[workIndex].workStatus?.value,
        loginDevice: Platform.isAndroid
            ? PlatformType.android.value
            : PlatformType.ios.value,
        appVersion: await getAppVersion(),
      );
      final failureOrSuccess = await authRepository.register(request: req);
      await failureOrSuccess.fold((failure) async {
        if (await handleSingleFailure(failure, _registerUser)) {
          return;
        }
      }, (response) {
        if (response.success) {
          RegisterResModel? resModel = response.data;

          boxStorage.setString(GetStorageHelper.userId, resModel?.id ?? '');
          boxStorage.setBool(GetStorageHelper.loggedIn, true);
          mixPanelTrackEvent(MixPanelEvents.signing_up_event);
          Get.offAllNamed(Routes.BREATHER_SCREEN, arguments: {
            NavigationKeyStrings.userName: resModel?.firstName ?? ""
          });
        } else {
          SnackBarWidget.showSnackBar(response.message, isError: true);
        }
      });
      isLoading.value = false;
    } catch (err) {
      isLoading.value = false;
      SnackBarWidget.showSnackBar(AppLabel.somethingWentWrong, isError: true);
    }
  }

  @override
  void dispose() {
    textController[0].removeListener(checkUserName);
    textController[1].removeListener(_isOlderThan18Years);
    super.dispose();
  }
}
*/
