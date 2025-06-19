import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

import '../storage/get_storage_helper.dart';
import 'network_state.dart';

class BaseGetXController extends GetxController {
  GetStorageHelper boxStorage = GetStorageHelper();

  var textFieldFocus = List.generate(5, (index) => FocusNode());
  RxBool isLoading = false.obs;
  RxBool isFavLoading = false.obs;
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  @mustCallSuper
  void onInit() {
    if (this is ConnectionAware) {
      ConnectionAware awareObj = this as ConnectionAware;
      awareObj.connectivitySubscription =
          Connectivity().onConnectivityChanged.listen((event) {
        if (event == ConnectivityResult.mobile ||
            event == ConnectivityResult.wifi) {
          awareObj
            ..networkState = NetworkState.connected
            ..onNetworkConnected();
          // need to start snack bar
          // if (Get.isSnackbarOpen) {
          //   SnackBarWidget.clearSnackBar();
          // }
        } else if (event == ConnectivityResult.none) {
          awareObj
            ..networkState = NetworkState.disconnected
            ..onNetworkDisconnected();
          // need to end snack bar
          // if (!Get.isSnackbarOpen) {
          //   SnackBarWidget.showSnackBarInfinity("No Internet Connected", title: "");
          // }
        }
      });
    }

    super.onInit();
  }

  @override
  @mustCallSuper
  void dispose() {
    if (this is ConnectionAware) {
      (this as ConnectionAware).connectivitySubscription?.cancel();
    }
    super.dispose();
  }
}
