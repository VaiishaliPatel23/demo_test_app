// Add app utilities here.
import 'package:demo_app/res/color_config.dart';
import 'package:demo_app/res/string_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class CommonMethods {
  CommonMethods._();

  // Show snack bar for positive messages
  static showSnackBarSuccess(String message) {
    Get.snackbar(
      StringConfig.successTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.snackBarSuccessColor,
      colorText: ColorConfig.whiteColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  // Show snack bar for error messages
  static showSnackBarError(String message) {
    Get.snackbar(
      StringConfig.errorTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConfig.snackBarErrorColor,
      colorText: ColorConfig.whiteColor,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 4),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }
}
