import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  if (Get.context != null) { // Check if context is available
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: isError ? AppColors.kPrimary : AppColors.kPrimary,
        message: message,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.all(5),
        borderRadius: 10,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  } else {
    debugPrint('Snack bar context is null! Could not show snack bar.');
  }
}