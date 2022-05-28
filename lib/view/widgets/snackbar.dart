import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hstore/utils/constants.dart';

class CustomSnackbar {
  static showErrorSnackbar(String title, String message) {
    Get.snackbar(title, message,
        icon: Icon(
          Icons.error_outline,
          color: WHITE,
        ),
        backgroundColor: Colors.red,
        colorText: WHITE,
        duration: Duration(seconds: 10));
  }

  static showSuccessSnackBar(String title, String message) {
    Get.snackbar(title, message,
        icon: Icon(
          Icons.check_circle,
          color: WHITE,
        ),
        backgroundColor: Colors.green,
        colorText: WHITE);
  }

  static showNoticeSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 5),
      backgroundColor: Colors.blue,
      colorText: WHITE,
    );
  }
}
