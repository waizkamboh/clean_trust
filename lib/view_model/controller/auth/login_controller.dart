import 'package:clean_trust/util/custom_snackbar.dart';
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




  void loginApi() {
    loading.value = true;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map data = {
      'email': emailController.value.text.trim(), // ✅ fixed
      'password': passwordController.value.text.trim(),
    };

    _api.loginApi(headers, data).then((response) {
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

      userPreference.saveToken(accessToken).then((_) {
        Get.offAllNamed(RouteName.bottomNavScreen);
        showCustomSnackBar(response['message']);
        clearFields();
      });

    }).onError((error, stackTrace) {
      loading.value = false;
      showCustomSnackBar(error.toString());
    });
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