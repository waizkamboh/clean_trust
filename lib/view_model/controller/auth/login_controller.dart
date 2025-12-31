import 'package:clean_trust/util/custom_snackbar.dart';
import 'package:clean_trust/view_model/controller/app_setting/get_app_setting_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/auth/login_repository.dart';
import '../../../helper/routes/routes_name.dart';
import '../../user_preference/user_preference.dart';



class LoginController extends GetxController{

  UserPreference userPreference = UserPreference();
  final _api = LoginRepository();


  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  var isPasswordHidden = true.obs;
  RxBool loading = false.obs;




  void loginApi() async {
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();

    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    // Frontend Validation
    if (email.isEmpty) {
      showCustomSnackBar('Enter email address');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('Enter a valid email address');
      return;
    }

    if (password.isEmpty) {
      showCustomSnackBar('Enter password');
      return;
    }

    if (!passwordRegex.hasMatch(password)) {
      showCustomSnackBar(
          'Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, 1 special character, and be at least 8 characters long');
      return;
    }

    loading.value = true;

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      Map<String, String> data = {
        'email': email,
        'password': password,
      };

      final response = await _api.loginApi(headers, data);

      loading.value = false;

      if (response == null) {
        showCustomSnackBar('No response from server');
        return;
      }

      if (response['success'] != true) {
        showCustomSnackBar(response['message'] ?? 'Login failed');
        return;
      }

      String accessToken = response['data']['accessToken'];

      await userPreference.saveToken(accessToken);

      clearFields();
      Get.offAllNamed(RouteName.bottomNavScreen);
      AppSettingController appSettingController = Get.put(AppSettingController());
      appSettingController.fetchFromApi();
      appSettingController.fetchAppVersion();

      showCustomSnackBar(response['message'] ?? 'Login successful');
    } catch (error, stackTrace) {
      loading.value = false;
      showCustomSnackBar('Error: ${error.toString()}');
      if (kDebugMode) {
        print('Login Error: $error');
        print(stackTrace);
      }
    }
  }




  @override
  void dispose() {
    // Dispose of TextEditingController
    emailController.value.dispose();
    passwordController.value.dispose();

    // // Dispose of FocusNode
    emailFocusNode.value.dispose();
    passwordFocusNode.value.dispose();

    super.dispose();
  }


  void clearFields() {
    // Clear TextEditingController
    emailController.value.clear();
    passwordController.value.clear();

    // // Remove focus from FocusNode
    emailFocusNode.value.unfocus();
    passwordFocusNode.value.unfocus();
  }








}