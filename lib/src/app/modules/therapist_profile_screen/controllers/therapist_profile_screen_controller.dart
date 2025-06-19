/*
import 'package:get/get.dart';
import 'package:humann/app/core/base/base_getx_controller.dart';
import 'package:humann/app/data/model/res_model/match_make_res_model.dart';
import 'package:humann/app/utils/extension.dart';

import '../../../widget/snackbar_cell.dart';

class TherapistProfileScreenController extends BaseGetXController {
  RxBool isShimmering = true.obs, isCurvedImageError = false.obs;
  Rx<TherapistDetailData> data = TherapistDetailData().obs;
  RxList<String> specializationList = RxList(), modalitiesList = RxList();
  String therapistId = Get.arguments;
  @override
  void onInit() {
    _getTherapistId();
    super.onInit();
  }

  void getListOfSpecialization() {
    final issues = data.value.therapistDetails?.issuesSpecializedIn ?? [];

    specializationList.value = issues.length > 2
        ? [...issues.take(2), "${issues.length - 2}+"]
        : issues.toList();
  }

  void getListOfModalities() {
    final issues = data.value.therapistDetails?.modalities ?? [];

    modalitiesList.value = issues.length > 2
        ? [...issues.take(2), "${issues.length - 2}+"]
        : issues.toList();
  }

  void addWholeSpecializationList() {
    final issues = data.value.therapistDetails?.issuesSpecializedIn ?? [];

    if (specializationList.length != issues.length) {
      specializationList.removeLast();
      specializationList.addAll(issues.getRange(2, issues.length));
    }
  }

  void addWholeModalitiesList() {
    final issues =
        data.value.therapistDetails?.modalities ?? [];

    if (modalitiesList.length != issues.length) {
      modalitiesList.removeLast();
      modalitiesList.addAll(issues.getRange(2, issues.length));
    }
  }

  Future<void> _getTherapistId() async {
    try{
      final failureOrSuccess = await dataRepository.getTherapistById(therapistId);
      await failureOrSuccess.fold((failure) async {
        if (await handleSingleFailure(failure, _getTherapistId)) {
          return;
        }
      }, (response) {
        if (response.success) {

          data.value = response.data;
          getListOfSpecialization();
          getListOfModalities();
          isShimmering.value = false;
        } else {
          SnackBarWidget.showSnackBar(response.message, isError: true);
        }
        isLoading.value = false;
      });


    }catch(err){}
  }
}
*/
