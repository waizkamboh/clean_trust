import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/auth/forget_password_repository.dart';
import '../../../util/custom_snackbar.dart';
import '../../../helper/routes/routes_name.dart';

class ForgetPasswordController extends GetxController {

  final _api = ForgetPasswordRepository();

  final emailController = TextEditingController().obs;

  RxBool loading = false.obs;

  void forgetPasswordApi() async {

    String email = emailController.value.text.trim();

    if (email.isEmpty) {
      showCustomSnackBar('Email is required');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('Enter a valid email address');
      return;
    }

    loading.value = true;

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      Map data = {
        'email': email,
      };

      final response = await _api.forgetPasswordApi(headers, data);

      loading.value = false;

      if (response == null) {
        showCustomSnackBar('No response from server');
        return;
      }

      if (response['success'] != true) {
        showCustomSnackBar(response['message'] ?? 'Something went wrong');
        return;
      }

      showCustomSnackBar(
        response['message'] ??
            'If an account with that email exists, a password reset link has been sent.',
      );
      //Get.offAllNamed(RouteName.confirmPasswordScreen);


      clearFields();

      Get.back();


    } catch (error) {
      loading.value = false;
      showCustomSnackBar(error.toString());
    }
  }


  void clearFields() {
    emailController.value.clear();
  }


  @override
  void dispose() {
    emailController.value.dispose();
    super.dispose();
  }
}
