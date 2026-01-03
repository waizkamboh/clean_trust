import 'dart:io';
import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../../data/repository/leave_request/leave_request_repository.dart';
import '../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';

class LeaveRequestController extends GetxController {
  final _repo = LeaveRequestRepository();
  final UserPreference _userPreference = UserPreference();

  RxBool loading = false.obs;

  final startDateController = TextEditingController().obs;
  final endDateController = TextEditingController().obs;
  final reasonController = TextEditingController().obs;
  final otherTypeController = TextEditingController().obs; // For "Other" type

  RxString selectedLeaveType = ''.obs; // Sick, Vacation, Other

  RxList<File> documents = <File>[].obs;

  /// PICK DOCUMENTS
  void pickDocuments() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
        allowMultiple: true,
      );

      if (result != null) {
        documents.value = result.paths
            .where((path) => path != null)
            .map((path) => File(path!))
            .toList();
      } else {
        showCustomSnackBar("No document selected");
      }
    } catch (e) {
      showCustomSnackBar("Failed to pick document: $e");
    }
  }

  /// SUBMIT LEAVE REQUEST
  void submitLeaveRequest() async {
    String type = selectedLeaveType.value == 'Other'
        ? otherTypeController.value.text
        : selectedLeaveType.value;

    if (type.isEmpty) {
      showCustomSnackBar('Select leave type');
      return;
    }

    loading.value = true;
    final token = await _userPreference.getToken();


    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      // Prepare data in the format expected by the repository
      Map<String, dynamic> data = {
        'fields': {
          'type': type,
          'start_date': startDateController.value.text,
          'end_date': endDateController.value.text,
          'reason': reasonController.value.text,
        },
        'documents': documents,
      };

      final response = await _repo.leaveRequestApi(
        headers,
        data,
      );

      loading.value = false;

      if (response['success'] == true) {
        showCustomSnackBar(response['message'] ?? 'Leave request submitted');
        Get.toNamed(RouteName.bottomNavScreen);
      } else {
        showCustomSnackBar(response['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      loading.value = false;
      showCustomSnackBar(e.toString());
    }
  }
}
