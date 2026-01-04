import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/repository/home/attendance/get_today_attendance_repository.dart';
import '../../../../data/repository/home/attendance/get_monthly_attendance_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';

class GetTodayAndMonthlyAttendanceController extends GetxController {

  final GetTodayAttendanceRepository _todayRepo =
  GetTodayAttendanceRepository();

  final GetMonthlyAttendanceRepository _monthlyRepo =
  GetMonthlyAttendanceRepository();

  final UserPreference _userPreference = UserPreference();

  /// Loader
  RxBool isLoading = false.obs;

  /// Internal API counter (VERY IMPORTANT)
  int _apiCounter = 0;

  /// ---------------- TODAY ----------------
  RxString todayTotalHours = '0h 0m'.obs;
  RxString checkInTime = '--:--'.obs;

  /// ---------------- MONTHLY ----------------
  RxString monthlyTotalHours = '0h 0m'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodayAttendance();
    fetchMonthlyAttendance();
  }

  // ===================================================
  // 🔹 TODAY ATTENDANCE
  // ===================================================
  Future<void> fetchTodayAttendance() async {
    try {
      _startLoading();

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response =
      await _todayRepo.getTodayAttendanceApi(headers);

      todayTotalHours.value =
          formatDecimalHours(response.data?.stats?.totalHours);

      final records = response.data?.records;
      if (records != null && records.isNotEmpty) {
        checkInTime.value =
            formatTime24To12(records.first.checkInTime);
      }

    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Failed to load today attendance");
    } finally {
      _stopLoading();
    }
  }

  // ===================================================
  // 🔹 MONTHLY ATTENDANCE (ONLY TOTAL HOURS)
  // ===================================================
  Future<void> fetchMonthlyAttendance() async {
    try {
      _startLoading();

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response =
      await _monthlyRepo.getMonthlyAttendanceApi(headers);

      monthlyTotalHours.value =
          formatFromBreakdown(
            response.data?.totalHoursBreakdown,
          );

    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Failed to load monthly attendance");
    } finally {
      _stopLoading();
    }
  }

  // ===================================================
  // 🔹 LOADER HELPERS
  // ===================================================
  void _startLoading() {
    _apiCounter++;
    isLoading.value = true;
  }

  void _stopLoading() {
    _apiCounter--;
    if (_apiCounter <= 0) {
      _apiCounter = 0;
      isLoading.value = false;
    }
  }

  // ===================================================
  // 🔹 FORMATTERS
  // ===================================================
  String formatDecimalHours(num? hours) {
    if (hours == null) return '0h 0m';

    int h = hours.floor();
    int m = ((hours - h) * 60).round();

    return '${h}h ${m}m';
  }

  String formatFromBreakdown(dynamic breakdown) {
    if (breakdown == null) return '0h 0m';

    return '${breakdown.hours ?? 0}h ${breakdown.minutes ?? 0}m';
  }

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
