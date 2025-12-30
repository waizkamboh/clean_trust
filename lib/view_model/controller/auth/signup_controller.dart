import 'package:clean_trust/data/model/auth/SignUpModel.dart';
import 'package:clean_trust/data/repository/auth/signup_repository.dart';
import 'package:clean_trust/util/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/auth/login_repository.dart';
import '../../../helper/routes/routes_name.dart';
import '../../user_preference/user_preference.dart';



class SignupController extends GetxController{

  UserPreference userPreference = UserPreference();
  final _api = SignupRepository();


  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final phoneFocusNode = FocusNode().obs;
  var isPasswordHidden = true.obs;
  RxBool loading = false.obs;



  void signupApi() {
    loading.value = true;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> data = {
      'email': emailController.value.text.trim(),
      'password': passwordController.value.text.trim(),
      'phone_number': phoneController.value.text.trim(),
    };

    _api.signUpApi(headers, data).then((response) {
      loading.value = false;

      if (response == null) {
        showCustomSnackBar('No response from server');
        return;
      }

      SignUpModel signupResponse = SignUpModel.fromJson(response);

      // ✅ SAFE CHECK
      if (signupResponse.success != true) {
        showCustomSnackBar(signupResponse.message ?? 'Signup failed');
        return;
      }

      // ✅ SUCCESS
      showCustomSnackBar(signupResponse.message ?? 'Signup successful');

      if (signupResponse.requiresApproval == true) {
        Get.toNamed(RouteName.loginScreen);
        clearFields();

      }
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
    phoneController.value.dispose();

    // // Dispose of FocusNode
    emailFocusNode.value.dispose();
    passwordFocusNode.value.dispose();
    phoneFocusNode.value.dispose();


    super.dispose();
  }


  void clearFields() {
    // Clear TextEditingController
    emailController.value.clear();
    passwordController.value.clear();
    phoneController.value.clear();


    // // Remove focus from FocusNode
    emailFocusNode.value.unfocus();
    passwordFocusNode.value.unfocus();
    phoneFocusNode.value.unfocus();
  }








}