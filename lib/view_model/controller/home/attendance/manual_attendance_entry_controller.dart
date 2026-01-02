import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../data/model/home/attendance/ManualAttendanceEntryModel.dart';
import '../../../../data/repository/home/attendance/manual_attendance_entry_repository.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/custom_snackbar.dart';

class ManualAttendanceEntryController extends GetxController {
  final _repo = ManualAttendanceEntryRepository();

  RxBool loading = false.obs;

  /// Controllers (UI change nahi ki – future ready)
  final dateController = TextEditingController().obs;
  final checkInController = TextEditingController().obs;
  final checkOutController = TextEditingController().obs;
  final reasonController = TextEditingController().obs;

  Future<void> datePicker() async {
    DateTime? _picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            // Change the color of the selected date circle
            colorScheme: ColorScheme.light(primary: AppColors.kSkyBlueColor), // Change the color as per your preference
            // Change the text color of the selected date

          ),
          child: child!,
        );
      },
    );
    if (_picked != null) {
      dateController.value.text = _picked.toString().split(" ")[0];
    }
  }

  Future<void> selectTime({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: AppColors.kSkyBlueColor, // Selected time & dial colour
            ),
            timePickerTheme: TimePickerThemeData(
              dialHandColor: AppColors.kSkyBlueColor,
             //hourMinuteTextColor: AppColors.kSkyBlueColor,
              entryModeIconColor: AppColors.kSkyBlueColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      controller.text = pickedTime.format(context);
    }
  }


  Future<void> submitManualAttendance() async {
    String date = dateController.value.text.trim();
    String checkInTime = checkInController.value.text.trim();
    String checkOutTime = checkOutController.value.text.trim();
    String reason = reasonController.value.text.trim();
    if (date.isEmpty) {
      showCustomSnackBar('Please choose date');
      return;
    }if (checkInTime.isEmpty) {
      showCustomSnackBar('Please choose check In Time');
      return;
    }if (checkOutTime.isEmpty) {
      showCustomSnackBar('Please choose check Out Time');
      return;
    }if (reason.isEmpty) {
      showCustomSnackBar('Please explain why you need a manual entry');
      return;
    }if (reason.length < 20) {
      showCustomSnackBar('Reason must be at least 20 characters long');
      return;
    }

    loading.value = true;
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

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
        "latitude": position.latitude,
        "longitude": position.longitude,
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
