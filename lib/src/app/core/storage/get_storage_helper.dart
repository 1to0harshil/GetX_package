import 'package:get_storage/get_storage.dart';

class GetStorageHelper {

  factory GetStorageHelper() => _singleton;

  GetStorageHelper._internal();
  static final GetStorageHelper _singleton = GetStorageHelper._internal();

  static const String token = 'TOKEN';
  static const String isLogin = 'isLogin';
  static const String userData = 'userData';
  static const String isOtpVerify = 'isOtpVerify';
  static const String themeType = 'themeType';

  GetStorage box = GetStorage();


  void setString(String tag, String value) {
    box.write(tag, value);
  }

  String? getString(String tag) => box.read(tag);

  void setBool(String tag, bool value) {
    box.write(tag, value);
  }

  bool? getBool(String tag) => box.read(tag);

  void setInt(String tag, int value) {
    box.write(tag, value);
  }

  int? getInt(String tag) => box.read(tag);

  void setJson(String tag, Map<String, dynamic> value) {
    box.write(tag, value);
  }

  Map<String, dynamic>? getJson(String tag) => box.read(tag);

  void clearWholeApp() {
    box.erase();
  }
}
