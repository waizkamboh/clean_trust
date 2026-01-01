import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/home/attendance/ManualAttendanceEntryModel.dart';
import '../../../../data/repository/home/attendance/manual_attendance_entry_repository.dart';
import '../../../../util/custom_snackbar.dart';

class ManualAttendanceEntryController extends GetxController {
  final _repo = ManualAttendanceEntryRepository();

  RxBool loading = false.obs;

  /// Controllers (UI change nahi ki – future ready)
  final dateController = TextEditingController().obs;
  final checkInController = TextEditingController().obs;
  final checkOutController = TextEditingController().obs;
  final reasonController = TextEditingController().obs;

  Future<void> submitManualAttendance() async {
    loading.value = true;

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer token'  // agar required ho
      };

      /// 👇 EXACT body – Postman screenshot wali
      Map<String, dynamic> body = {
        "workplace_id": 9,
        "date": dateController.value.text,
        "check_in_time": checkInController.value.text,
        "check_out_time": checkOutController.value.text,
        "latitude": 40.7128,
        "longitude": -74.0060,
        "reason": reasonController.value.text,
      };

      final response =
      await _repo.manualAttendanceApi(headers, body);

      loading.value = false;

      if (response == null) {
        showCustomSnackBar('No response from server');
        return;
      }

      ManualAttendanceEntryModel model =
      ManualAttendanceEntryModel.fromJson(response);

      if (model.success != true) {
        showCustomSnackBar(model.message ?? 'Submission failed');
        return;
      }

      showCustomSnackBar(
        model.message ?? 'Manual entry submitted successfully',
      );

      Get.back(); // ya jis screen pe jana ho

    } catch (e) {
      loading.value = false;
      showCustomSnackBar(e.toString());
    }
  }

  @override
  void dispose() {
    dateController.value.dispose();
    checkInController.value.dispose();
    checkOutController.value.dispose();
    reasonController.value.dispose();
    super.dispose();
  }
}
