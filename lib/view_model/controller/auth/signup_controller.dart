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



  void signupApi() async {
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();
    String phoneNumber = phoneController.value.text.trim();

    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    final phoneNumberRegex = RegExp(r'^(\+?1)?\d{10,15}$'); // example regex

    // Frontend Validation
    if (email.isEmpty) {
      showCustomSnackBar('Enter email address');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('Enter a valid email address');
      return;
    }

    if (phoneNumber.isEmpty) {
      showCustomSnackBar("Enter Phone Number");
      return;
    }

    if (!phoneNumberRegex.hasMatch(phoneNumber)) {
      showCustomSnackBar('Enter a valid Phone Number');
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

      Map<String, dynamic> data = {
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
      };

      final response = await _api.signUpApi(headers, data);

      loading.value = false;

      if (response == null) {
        showCustomSnackBar('No response from server');
        return;
      }

      SignUpModel signupResponse = SignUpModel.fromJson(response);

      if (signupResponse.success != true) {
        showCustomSnackBar(signupResponse.message ?? 'Signup failed');
        return;
      }

      showCustomSnackBar(signupResponse.message ?? 'Signup successful');

      if (signupResponse.requiresApproval == true) {
        clearFields();
        Get.toNamed(RouteName.loginScreen);
      }
    } catch (error, stackTrace) {
      loading.value = false;
      showCustomSnackBar('Error: ${error.toString()}');
      if (kDebugMode) {
        print('Signup Error: $error');
        print(stackTrace);
      }
    }
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