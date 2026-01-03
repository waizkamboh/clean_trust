import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repository/employee/get_employee_by_id_repository.dart';
import '../../../../data/repository/employee/update_employee_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';

class EditProfileController extends GetxController {
  final GetEmployeeByIdRepository _getRepo = GetEmployeeByIdRepository();
  final UpdateEmployeeRepository _updateRepo = UpdateEmployeeRepository();
  final UserPreference _userPreference = UserPreference();

  /// 🔹 Editable controllers
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  /// 🔹 Read-only values
  RxString fullName = ''.obs;
  RxString email = ''.obs;
  RxString createdAt = ''.obs;
  RxString role = ''.obs;
  RxString position = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString profilePicture = ''.obs;

  RxBool isLoading = false.obs;

  /// ================= GET EMPLOYEE =================
  Future<void> fetchEmployee() async {
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();
      final employeeId = await _userPreference.getUserId();

      if (token == null || employeeId == null) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response =
      await _getRepo.getEmployeeByIdApi(headers, employeeId);

      final emp = response.data?.employee;
      if (emp == null) return;

      // 🔒 Read only
      fullName.value = emp.fullName ?? '';
      email.value = emp.email ?? '';
      role.value = emp.role ?? '';
      position.value = emp.position ?? '';
      phoneNumber.value = emp.phoneNumber ?? '';
      profilePicture.value = emp.profilePicture ?? '';
      createdAt.value = formatDate(emp.createdAt);

    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Failed to load profile");
    } finally {
      isLoading.value = false;
    }
  }

  /// ================= UPDATE EMPLOYEE =================
  Future<void> updateProfile() async {
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();
    String phoneNo = phoneController.value.text.trim();
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

    if (phoneNo.isEmpty) {
      showCustomSnackBar('Enter phoneNo');
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
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();
      final employeeId = await _userPreference.getUserId();

      if (token == null || employeeId == null) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        "email": emailController.value.text.trim(),
        "phone_number": phoneController.value.text.trim(),
        "password": passwordController.value.text.trim(),
      };

      final response =
      await _updateRepo.updateEmployeeApi(body, headers, employeeId);

      if (response.success == true) {
        showCustomSnackBar(
          response.message ?? "Profile updated",
          isError: false,
        );
        passwordController.value.clear();
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Update failed");
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 Date formatter
  String formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    final d = DateTime.parse(date);
    return "${d.day.toString().padLeft(2, '0')}-${d.month}-${d.year}";
  }

  @override
  void onClose() {
    emailController.value.dispose();
    phoneController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }
}
