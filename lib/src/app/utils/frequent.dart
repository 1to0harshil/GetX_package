import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as a;
import 'package:path_provider/path_provider.dart';

import '../core/constants/strings.dart';
import '../core/error/failures.dart';
import '../widget/snackbar_cell.dart';
class Frequent {
  void failureHandle(Failure failure) {
    if (failure == ServerFailure()) {
      SnackBarWidget.showSnackBar(Constant.serverLost);
    } else if (failure == ApiFailure()) {
      SnackBarWidget.showSnackBar(Constant.apiFailure);
    } else if (failure == SessionFailure()) {
      SnackBarWidget.showSnackBar(Constant.sessionExpired);
    }
  }

  String getFileSizeString({required int bytes, int decimals = 0}) {
    if (bytes <= 0) {
      return '0 bytes';
    }
    const suffixList = [' Bytes', ' KB', ' MB', ' GB', ' TB'];
    int i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixList[i];
  }

  // Future<String> getFcmToken() async {
  //   return await FirebaseMessaging.instance.getToken() ?? '';
  // }

  String getDevice() {
    if (Platform.isIOS) {
      return 'ios';
    }
    return 'android';
  }

  Future<Directory?> getPlatformDirectory() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory;
  }

  String getFileName(String url) => a.basename(url);

  Future<DateTime?> calendarPicker(BuildContext context) async {
    final selectedDate = DateTime.now(); // Set an initial date

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
      builder: (context, child) => Theme(
        data: ThemeData(primarySwatch: Colors.deepOrange),
        child: child!,
      ),
    );

    if (picked != null && picked != selectedDate) {
      return selectedDate;
    } else {
      return null;
    }
  }

  Future<String?> timePicker(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: ThemeData(primarySwatch: Colors.deepOrange),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        ),
      ),
    );
    if (pickedTime != null) {
      return '${pickedTime.hour}:${pickedTime.minute}:00';
    }
    return null;
  }

  Widget heroFlightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    final toHero = toHeroContext.widget as Hero;
    return SingleChildScrollView(child: toHero.child);
  }
}
