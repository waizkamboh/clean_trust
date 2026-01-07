import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/auth/forget_password_repository.dart';
import '../../../util/custom_snackbar.dart';
import '../../../helper/routes/routes_name.dart';

class ConfirmPasswordController extends GetxController {

  final _repo = ForgetPasswordRepository();

  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  var isPasswordHidden = true.obs;
  var isPasswordHidden1 = true.obs;


  RxBool loading = false.obs;

  late String token;

  @override
  void onInit() {
    super.onInit();
    token = Get.parameters['token'] ?? '';
  }

  void resetPasswordApi() async {

    if (token.isEmpty) {
      showCustomSnackBar('Invalid or expired link');
      return;
    }

    if (passwordController.value.text.isEmpty ||
        confirmPasswordController.value.text.isEmpty) {
      showCustomSnackBar('All fields are required');
      return;
    }

    if (passwordController.value.text != confirmPasswordController.value.text) {
      showCustomSnackBar('Passwords do not match');
      return;
    }

    loading.value = true;

    try {

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final data = {
        "token": token,
        "newPassword": passwordController.value.text.trim(),
      };

      final response = await _repo.forgetPasswordApi(headers, data);

      loading.value = false;

      if (response['success'] != true) {
        showCustomSnackBar(response['message']);
        return;
      }

      showCustomSnackBar(response['message']);
      Get.offAllNamed(RouteName.loginScreen);

    } catch (e) {
      loading.value = false;
      showCustomSnackBar(e.toString());
    }
  }

  @override
  void onClose() {
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }
}
