import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/model/home/attendance/GetAttendanceHistoryModel.dart';
import '../../../../data/repository/home/attendance/get_attendance_history_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';

class GetAttendanceHistoryController extends GetxController {

  final GetAttendanceHistoryRepository _repo =
  GetAttendanceHistoryRepository();

  final UserPreference _userPreference = UserPreference();

  /// Loader
  RxBool isLoading = false.obs;
  int _apiCounter = 0;

  /// Attendance List
  RxList<Records> attendanceList = <Records>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAttendanceHistory();
  }

  // ===================================================
  // 🔹 FETCH ATTENDANCE HISTORY
  // ===================================================
  Future<void> fetchAttendanceHistory() async {
    try {
      _startLoading();

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response =
      await _repo.getAttendanceHistoryApi(headers);

      attendanceList.value =
          response.data?.records ?? [];

    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Failed to load attendance history");
    } finally {
      _stopLoading();
    }
  }

  // ===================================================
  // 🔹 FORMATTERS
  // ===================================================

  /// 📅 Monday, Jan 15
  String formatShortDate(String? date) {
    if (date == null) return '--';
    final parsed = DateTime.parse(date);
    return DateFormat('EEEE, MMM d').format(parsed);
  }

  /// 📅 March 15, 2024, Friday
  String formatFullDate(String? date) {
    if (date == null) return '--';
    final parsed = DateTime.parse(date);
    return DateFormat('MMMM d, yyyy, EEEE').format(parsed);
  }

  /// 🕒 24h → 12h
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

  /// ⏱️ TOTAL HOURS CALCULATION
  String calculateTotalHours(
      String? checkIn,
      String? checkOut,
      ) {
    if (checkIn == null || checkOut == null) return '--';

    final inParts = checkIn.split(':');
    final outParts = checkOut.split(':');

    final inTime = Duration(
      hours: int.parse(inParts[0]),
      minutes: int.parse(inParts[1]),
    );

    final outTime = Duration(
      hours: int.parse(outParts[0]),
      minutes: int.parse(outParts[1]),
    );

    final diff = outTime - inTime;

    final h = diff.inHours;
    final m = diff.inMinutes.remainder(60);

    return '${h}h ${m}m';
  }
  Map<String, List<Records>> get groupedByDate {
    final Map<String, List<Records>> map = {};

    for (final record in attendanceList) {
      final dateKey = record.date ?? '';
      if (!map.containsKey(dateKey)) {
        map[dateKey] = [];
      }
      map[dateKey]!.add(record);
    }
    return map;
  }

  // ===================================================
  // 🔹 MAP LOCATION (TAP ACTION)
  // ===================================================
  Future<void> openLocation(String? lat, String? lng) async {
    if (lat == null || lng == null) return;

    final uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      showCustomSnackBar("Could not open map");
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
}
