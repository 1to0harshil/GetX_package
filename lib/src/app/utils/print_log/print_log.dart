import 'dart:developer';

mixin PrintLog {
  static const enableLog = true;

  static void printData(dynamic msg) {
    if (enableLog) {
      log(msg);
    }
  }

  static void printTagData(String tag, dynamic msg) {
    if (enableLog) {
      log("$tag $msg");
    }
  }
}
