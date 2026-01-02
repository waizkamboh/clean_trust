import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../data/repository/home/attendance/get_today_attendance_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';


class GetAttendanceHistoryController extends GetxController {
  final GetTodayAttendanceRepository _repo =
  GetTodayAttendanceRepository();
  final UserPreference _userPreference = UserPreference();

  RxBool isLoading = false.obs;

  // Full response model
  // Rx<GetTodayAttendanceHistoryModel?> attendanceModel =
  // Rx<GetTodayAttendanceHistoryModel?>(null);

  // Required values for UI
  RxString totalHours = '0h 0m'.obs;
  RxString checkInTime = '--:--'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodayAttendance();
  }

  Future<void> fetchTodayAttendance() async {
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response =
      await _repo.getTodayAttendanceApi(headers);
    // final GetTodayAttendanceHistoryModel attendanceModel = response;
      //attendanceModel.value = response;

      // ✅ Format totalHours (Decimal hours → 1h 2m)
      totalHours.value = formatDecimalHours(
        response.data?.stats?.totalHours,
      );

      // ✅ Format check-in time (24h → 12h AM/PM)
      final records = response.data?.records;
      if (records != null && records.isNotEmpty) {
        checkInTime.value = formatTime24To12(
          records.first.checkInTime,
        );
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Failed to load attendance");
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 Converts decimal hours (1.03) → 1h 2m
  String formatDecimalHours(num? hours) {
    if (hours == null) return '0h 0m';

    int h = hours.floor();
    int m = ((hours - h) * 60).round();

    return '${h}h ${m}m';
  }

  /// 🔹 Converts "15:51:43" → "3:51 PM"
  String formatTime24To12(String? time) {
    if (time == null || time.isEmpty) return '--:--';

    final parts = time.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    final isPM = hour >= 12;
    hour = hour % 12;
    if (hour == 0) hour = 12;

    return '$hour:${minute.toString().padLeft(2, '0')} ${isPM ? 'PM' : 'AM'}';
  }
}
