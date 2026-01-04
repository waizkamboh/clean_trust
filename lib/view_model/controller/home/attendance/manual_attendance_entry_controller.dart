import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../data/model/home/attendance/ManualAttendanceEntryModel.dart';
import '../../../../data/repository/home/attendance/manual_attendance_entry_repository.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';
import '../../workplaces/get_workplaces_controller.dart';

class ManualAttendanceEntryController extends GetxController {
  final _repo = ManualAttendanceEntryRepository();
  final UserPreference _userPreference = UserPreference();
  final GetWorkplacesController workplacesController = Get.find();

  RxBool loading = false.obs;

  /// Controllers
  final dateController = TextEditingController().obs;
  final checkInController = TextEditingController().obs;
  final checkOutController = TextEditingController().obs;
  final reasonController = TextEditingController().obs;



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
              entryModeIconColor: AppColors.kSkyBlueColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      // Convert TimeOfDay to DateTime
      final now = DateTime.now();
      final dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      // Format to HH:mm:ss
      final formattedTime =
          "${dateTime.hour.toString().padLeft(2, '0')}:"
          "${dateTime.minute.toString().padLeft(2, '0')}:00";

      controller.text = formattedTime;
    }
  }





  Future<void> submitManualAttendance() async {
    final int workplaceId = workplacesController.selectedWorkplaceId.value;

    String date = dateController.value.text.trim();
    String checkInTime = checkInController.value.text.trim();
    String checkOutTime = checkOutController.value.text.trim();
    String reason = reasonController.value.text.trim();
    if (date.isEmpty) {
      showCustomSnackBar('Please choose date');
      return;
    }if (workplaceId == 0) {
      showCustomSnackBar('Please select a workplace');
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
      final token = await _userPreference.getToken();

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };


      Map<String, dynamic> body = {
        "workplace_id": workplaceId,
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

      clearFields();

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
  void clearFields() {
    dateController.value.clear();
    checkInController.value.clear();
    checkOutController.value.clear();
    reasonController.value.clear();
    workplacesController.selectedWorkplaceId.value = 0;
  }
}
