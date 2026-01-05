import 'package:clean_trust/data/repository/auth/change_password_repository.dart';
import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/auth/login_repository.dart';
import '../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';

class ChangePasswordController extends GetxController {
  final _api = ChangePasswordRepository();
  final UserPreference userPreference = UserPreference();

  // Controllers
  final oldPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  // Focus Nodes
  final oldPasswordFocus = FocusNode().obs;
  final newPasswordFocus = FocusNode().obs;
  final confirmPasswordFocus = FocusNode().obs;

  // Password visibility
  RxBool oldPasswordHidden = true.obs;
  RxBool newPasswordHidden = true.obs;
  RxBool confirmPasswordHidden = true.obs;

  // Loading
  RxBool loading = false.obs;

  /// ============================
  /// CHANGE PASSWORD API
  /// ============================
  void changePasswordApi() async {
    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    String oldPassword = oldPasswordController.value.text.trim();
    String newPassword = newPasswordController.value.text.trim();
    String confirmPassword = confirmPasswordController.value.text.trim();

    // Validation
    if (oldPassword.isEmpty) {
      showCustomSnackBar('Old password is required');
      return;
    }

    if (newPassword.isEmpty) {
      showCustomSnackBar('New password is required');
      return;
    }

    if (confirmPassword.isEmpty) {
      showCustomSnackBar('Confirm password is required');
      return;
    }

    // Regex check for new password
    if (!passwordRegex.hasMatch(newPassword)) {
      showCustomSnackBar(
          'Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, 1 special character, and be at least 8 characters long');
      return;
    }

    if (oldPassword == newPassword) {
      showCustomSnackBar('New password cannot be the same as old password');
      return;
    }


    // Regex check for confirm password (optional but good for consistency)
    if (!passwordRegex.hasMatch(confirmPassword)) {
      showCustomSnackBar(
          'Confirm password does not meet required pattern');
      return;
    }

    // Check if newPassword and confirmPassword match
    if (newPassword != confirmPassword) {
      showCustomSnackBar('Passwords do not match');
      return;
    }

    loading.value = true;

    try {
      final token = await userPreference.getToken();

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Map data = {
        'currentPassword': oldPassword,
        'newPassword': newPassword,
      };

      final response = await _api.changePasswordApi(headers, data);

      loading.value = false;

      if (response == null) {
        showCustomSnackBar('No response from server');
        return;
      }

      if (response['success'] != true) {
        showCustomSnackBar(response['message'] ?? 'Password change failed');
        return;
      }

      showCustomSnackBar(response['message'] ?? 'Password changed successfully');


      clearFields();
    } catch (error) {
      loading.value = false;
      showCustomSnackBar(error.toString());
    }
  }

  /// ============================
  /// CLEAR FIELDS
  /// ============================
  void clearFields() {
    oldPasswordController.value.clear();
    newPasswordController.value.clear();
    confirmPasswordController.value.clear();

    oldPasswordFocus.value.unfocus();
    newPasswordFocus.value.unfocus();
    confirmPasswordFocus.value.unfocus();
  }

  /// ============================
  /// DISPOSE
  /// ============================
  @override
  void dispose() {
    oldPasswordController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();

    oldPasswordFocus.value.dispose();
    newPasswordFocus.value.dispose();
    confirmPasswordFocus.value.dispose();

    super.dispose();
  }
}
