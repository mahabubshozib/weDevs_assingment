import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';

void showMessage(String? msg, {bool isSuccess = false}) {
  Get.snackbar(
    isSuccess ? "Success!" : "Error!",
    msg ?? "Error Occurred",
    backgroundColor: isSuccess == true ? Colors.green : Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    colorText: WHITE,
    borderRadius: 2.0,
    duration: const Duration(seconds: 2),
    icon: Icon(
      isSuccess ? Icons.check_circle_rounded : Icons.info,
      size: 30,
      color: WHITE,
    ),
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
  );
}

void showSuccessMessage({required String message}){
  showMessage(message, isSuccess: true);
}