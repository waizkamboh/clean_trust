import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/custom_snackbar.dart';
import '../../../data/repository/profile/profile/get_employee_repository.dart';
import '../../../data/repository/profile/profile/update_employee_repository.dart';
import '../../../helper/internet_check.dart';
import '../../user_preference/user_preference.dart';

class EditProfileController extends GetxController {
  final GetEmployeeRepository _getRepo = GetEmployeeRepository();
  final UpdateEmployeeRepository _updateRepo = UpdateEmployeeRepository();
  final UserPreference _userPreference = UserPreference();

  // Text Controllers
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final currentPasswordController = TextEditingController().obs;


  var isPasswordHidden = true.obs;
  var isPasswordHidden1 = true.obs;

  // Profile Data
  RxString fullName = ''.obs;
  RxString email = ''.obs;
  RxString createdAt = ''.obs;
  RxString role = ''.obs;
  RxString position = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString profilePicture = ''.obs;

  // Loaders
  RxBool isLoading = false.obs;
  RxBool isLoading1 = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfileFromCache();
    _loadData();
  }


  Future<void> _loadData() async {
    final online = await isOnline();

    if (!online) {
      debugPrint('OFFLINE → API not called');
      showCustomSnackBar('Please check internet connection');
      return;
    }
    debugPrint(' API  called');
    fetchEmployee();


  }

  Future<void> _loadProfileFromCache() async {
    final data = await _userPreference.getProfile();

    fullName.value = data['full_name']!;
    email.value = data['profile_email']!;
    role.value = data['role']!;
    position.value = data['position']!;
    phoneNumber.value = data['phone_number']!;
    profilePicture.value = data['profile_picture']!;
    createdAt.value = data['created_at']!;
  }


  Future<void> fetchEmployee() async {
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();

      if (token == null ) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response =
      await _getRepo.getEmployeeByIdApi(headers, );

      final emp = response.data?.user;
      if (emp == null) return;

      fullName.value = emp.fullName ?? '';
      email.value = emp.email ?? '';
      role.value = emp.role ?? '';
      position.value = emp.position ?? '';
      phoneNumber.value = emp.phoneNumber ?? '';
      profilePicture.value = emp.profilePicture ?? '';
      createdAt.value = formatDate(emp.createdAt);

      await _userPreference.saveProfile(
        fullName: fullName.value,
        email: email.value,
        role: role.value,
        position: position.value,
        phoneNumber: phoneNumber.value,
        profilePicture: profilePicture.value,
        createdAt: createdAt.value,
      );
      isLoading.value = false;
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


  Future<void> updateProfile() async {
    final emailText = emailController.value.text.trim();
    final phoneText = phoneController.value.text.trim();
    final newPassword = newPasswordController.value.text.trim();
    final currentPassword = currentPasswordController.value.text.trim();

    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
    );

    if (emailText.isNotEmpty && !GetUtils.isEmail(emailText)) {
      showCustomSnackBar('Enter a valid email address');
      return;
    }

    if (phoneText.isNotEmpty && !GetUtils.isPhoneNumber(phoneText)) {
      showCustomSnackBar('Enter a valid phone number');
      return;
    }

    if (newPassword.isNotEmpty) {
      if (currentPassword.isEmpty) {
        showCustomSnackBar('Enter current password to change password');
        return;
      }

      if (!passwordRegex.hasMatch(newPassword)) {
        showCustomSnackBar(
          'Password must be strong (8+ chars, upper, lower, number & symbol)',
        );
        return;
      }
    }

    if (emailText.isEmpty &&
        phoneText.isEmpty &&
        newPassword.isEmpty) {
      showCustomSnackBar('Please update at least one field');
      return;
    }

    final online = await isOnline();
    if (!online) {
      showCustomSnackBar('Please check internet connection');
      return;
    }

    try {
      isLoading1.value = true;

      final token = await _userPreference.getToken();
      final employeeId = await _userPreference.getUserId();

      if (token == null || employeeId == null) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        if (emailText.isNotEmpty) "email": emailText,
        if (phoneText.isNotEmpty) "phone_number": phoneText,
        if (newPassword.isNotEmpty) "password": newPassword,
        if (newPassword.isNotEmpty) "current_password": currentPassword,
      };

      final response =
      await _updateRepo.updateEmployeeApi(body, headers, employeeId);

      if (response.success == true) {
        showCustomSnackBar(
          response.message ?? "Profile updated successfully",
          isError: false,
        );
        Get.toNamed(RouteName.bottomNavScreen);

        emailController.value.clear();
        phoneController.value.clear();
        newPasswordController.value.clear();
        currentPasswordController.value.clear();
        await fetchEmployee();
      } else {
        showCustomSnackBar(response.message ?? "Update failed");
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Something went wrong");
    } finally {
      isLoading1.value = false;
    }
  }


  String formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    final d = DateTime.parse(date);
    return "${d.day.toString().padLeft(2, '0')}-${d.month}-${d.year}";
  }

  @override
  void onClose() {
    emailController.value.dispose();
    phoneController.value.dispose();
    newPasswordController.value.dispose();
    currentPasswordController.value.dispose();
    super.onClose();
  }

}
