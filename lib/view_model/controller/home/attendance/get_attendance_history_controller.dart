import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/model/home/attendance/GetAttendanceHistoryModel.dart';
import '../../../../data/repository/home/attendance/get_attendance_history_repository.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';

class GetAttendanceHistoryController extends GetxController {

  final GetAttendanceHistoryRepository _repo =
  GetAttendanceHistoryRepository();

  final UserPreference _userPreference = UserPreference();

  /// Loader
  RxBool isLoading = false.obs;
  int _apiCounter = 0;
  int _currentPage = 1;
  final int _limit = 10;
  RxBool isPaginationLoading = false.obs;
  RxBool hasMoreData = true.obs;


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

  /// ---------------- FILTER STATES ----------------
  Rx<DateTime?> fromDate = Rx<DateTime?>(null);
  Rx<DateTime?> toDate = Rx<DateTime?>(null);

  RxString selectedStatus = 'all'.obs; // all | pending | approved

  RxString filteredTotalHours = '0h 0m'.obs;
  RxString filteredDateRangeText = ''.obs;

  /// ---------------- PICK DATE RANGE ----------------
  Future<void> pickDateRange() async {
    DateTimeRange? range = await showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.kSkyBlueColor, // selected circle
              onPrimary: AppColors.kWhiteColor,
              surface: AppColors.kWhiteColor,
              onSurface: AppColors.kBlackColor,
            ),
            dialogBackgroundColor: AppColors.kWhiteColor,
          ),
          child: child!,
        );
      },
    );

    if (range != null) {
      fromDate.value = range.start;
      toDate.value = range.end;
    }
  }


  /// ---------------- APPLY FILTER ----------------
  void applyFilter() {
    if (fromDate.value == null || toDate.value == null) return;

    final filtered = attendanceList.where((record) {
      final recordDate = DateTime.parse(record.date!);

      final isInRange =
          recordDate.isAfter(fromDate.value!.subtract(Duration(days: 1))) &&
              recordDate.isBefore(toDate.value!.add(Duration(days: 1)));

      final statusMatch = selectedStatus.value == 'all'
          ? true
          : record.status == selectedStatus.value;

      return isInRange && statusMatch;
    }).toList();

    _calculateFilteredHours(filtered);
  }

  /// ---------------- CALCULATE HOURS ----------------
  void _calculateFilteredHours(List records) {
    int totalMinutes = 0;

    for (var r in records) {
      if (r.checkInTime != null && r.checkOutTime != null) {
        final inParts = r.checkInTime.split(':');
        final outParts = r.checkOutTime.split(':');

        final inMinutes =
            int.parse(inParts[0]) * 60 + int.parse(inParts[1]);
        final outMinutes =
            int.parse(outParts[0]) * 60 + int.parse(outParts[1]);

        totalMinutes += (outMinutes - inMinutes);
      }
    }

    final h = totalMinutes ~/ 60;
    final m = totalMinutes % 60;

    filteredTotalHours.value = '${h}h ${m}m';

    filteredDateRangeText.value =
    'Hours worked between ${DateFormat('dd MMM').format(fromDate.value!)} – '
        '${DateFormat('dd MMM yyyy').format(toDate.value!)}';
  }
  /// ---------------- RESET FILTER ----------------
  void resetFilter() {
    fromDate.value = null;
    toDate.value = null;
    selectedStatus.value = 'all';

    filteredTotalHours.value = '0h 0m';
    filteredDateRangeText.value = '';

    // original list restore
    attendanceList.refresh();
  }


}
