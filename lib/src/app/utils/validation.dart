/*
import 'package:get_x_structure/src/app/core/constants/app_label.dart';
import 'package:get_x_structure/src/app/widget/snackbar_cell.dart';

class Validation {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  void userNameValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return SnackBarWidget.showSnackBar(
        AppLabel.validationUsernameEmptyText,
        title: '',
      );
      //  AppLabel.validationFnameEmptyText;
    }
  }

  void emailValidation(String? value) {
    final regex = RegExp(pattern);
    if (value == null || value.trim().isEmpty) {
      return SnackBarWidget.showSnackBar(
        AppLabel.validationEmailEmptyText,
        title: '',
      );
      // AppLabel.validationEmailEmptyText;
    }
    if (!regex.hasMatch(value)) {
      return SnackBarWidget.showSnackBar(
        AppLabel.validationEmailInvalidText,
        title: '',
      );
      // AppLabel.validationEmailInvalidText;
    }
    return null;
  }
}
*/
