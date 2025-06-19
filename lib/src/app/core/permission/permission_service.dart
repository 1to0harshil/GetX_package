import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../../utils/extensions.dart';

mixin PermissionService {
  static Future<PermissionStatus> requestPermission(
    Permission permission,
  ) async =>
      permission.request();

  static Future<bool> checkPermission(Permission permission) async =>
      permission.isGranted;

  static Future<bool> managePermission(Permission permission) async {
    if (await checkPermission(permission)) {
      return true;
    } else {
      final permissionStatus = await requestPermission(permission);
      if (permissionStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<bool> storagePermission(Permission permission) async {
    if (Platform.isAndroid && await androidSdkInt() >= 33) {
      return true;
    } else if (await checkPermission(permission)) {
      return true;
    } else {
      final permissionStatus = await requestPermission(permission);
      if (permissionStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
