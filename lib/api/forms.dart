import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppSnackBar {
  String title;
  String message;

  AppSnackBar({required this.title, required this.message}) {
    print("HERE");
  }

  AppSnackBar.error({
    required this.message,
    this.title = "Error",
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(10.0),
        forwardAnimationCurve: Curves.easeOutBack);
  }

  AppSnackBar.success({required this.message, this.title = "Success"}) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message,
        backgroundColor: Colors.greenAccent,
        margin: const EdgeInsets.all(10.0),
        forwardAnimationCurve: Curves.easeOutBack);
  }

  AppSnackBar.warning({required this.title, required this.message}) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message,
        backgroundColor: Colors.orangeAccent,
        margin: const EdgeInsets.all(10.0),
        forwardAnimationCurve: Curves.easeOutBack);
  }
}
