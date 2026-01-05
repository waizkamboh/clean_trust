import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  if (Get.context != null) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.kGradientColor5,
        messageText: Text(
          message,
          style:  TextStyle(
            color: AppColors.kWhiteColor
          )
        ),
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
