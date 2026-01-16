import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/model/home/attendance/GetAttendanceHistoryModel.dart';
import '../../../../data/repository/home/attendance/get_attendance_history_repository.dart';
import '../../../../helper/internet_check.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';

class GetAttendanceHistoryController extends GetxController {

  final GetAttendanceHistoryRepository _repo =
  GetAttendanceHistoryRepository();

  final UserPreference _userPreference = UserPreference();
  @override
  void onInit() {
    super.onInit();
    _loadData();
  }
  Future<void> _loadData() async {
    final online = await isOnline();

    if (!online) {
      debugPrint('OFFLINE → API not called');
      return;
    }

    fetchAttendanceHistory(reset: true);

  }

  RxBool isLoading = false.obs;
  int _apiCounter = 0;
  RxBool isPaginationLoading = false.obs;
  RxBool hasMoreData = true.obs;
  int currentPage = 1;
  int totalPages = 1;



  RxList<AttendanceRecords> attendanceList = <AttendanceRecords>[].obs;

  RxString apiTotalHours = '0h 0m'.obs;
  RxBool isFilterLoading = false.obs;

  void loadMore() {
    if (!hasMoreData.value || isPaginationLoading.value) return;
    fetchAttendanceHistory();
  }


  Future<void> fetchAttendanceHistory({bool reset = false}) async {
    try {
      if (reset) {
        currentPage = 1;
        hasMoreData.value = true;
        attendanceList.clear();
        _startLoading();
      } else {
        isPaginationLoading.value = true;
      }

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await _repo.getAttendanceHistoryApi(
        headers: headers,
        page: currentPage,
      );

      final newRecords = response.data?.records ?? [];

      attendanceList.addAll(newRecords);

      totalPages = response.data?.pagination?.pages?.toInt() ?? 1;

      if (currentPage >= totalPages || newRecords.isEmpty) {
        hasMoreData.value = false;
      }

      currentPage++;

    } catch (e) {
      showCustomSnackBar("Failed to load attendance history");
    } finally {
      _stopLoading();
      isPaginationLoading.value = false;
    }
  }

  Future<void> applyFilter() async {
    if (fromDate.value == null || toDate.value == null) {
      showCustomSnackBar("Please select date range");
      return;
    }

    try {
      isFilterLoading.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final startDate =
      DateFormat('yyyy-MM-dd').format(fromDate.value!);
      final endDate =
      DateFormat('yyyy-MM-dd').format(toDate.value!);

      final response = await _repo.getFilteredAttendanceApi(
        headers: headers,
        startDate: startDate,
        endDate: endDate,
      );

      attendanceList.value =
          response.data?.records
              ?.map((e) => AttendanceRecords.fromJson(e.toJson()))
              .toList() ?? [];


      final breakdown = response.data?.totalHoursBreakdown;
      if (breakdown != null) {
        apiTotalHours.value =
        '${breakdown.hours}h ${breakdown.minutes}m';
      }

      filteredDateRangeText.value =
      'Hours worked between ${DateFormat('dd MMM').format(fromDate.value!)} - '
          '${DateFormat('dd MMM yyyy').format(toDate.value!)}';

    } catch (e) {
      showCustomSnackBar("Failed to apply filter");
    } finally {
      isFilterLoading.value = false;
    }
  }


  String formatShortDate(String? date) {
    if (date == null) return '--';
    final parsed = DateTime.parse(date);
    return DateFormat('EEEE, MMM d').format(parsed);
  }

  String formatFullDate(String? date) {
    if (date == null) return '--';
    final parsed = DateTime.parse(date);
    return DateFormat('MMMM d, yyyy').format(parsed);
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
  Map<String, List<AttendanceRecords>> get groupedByDate {
    final Map<String, List<AttendanceRecords>> map = {};

    for (final record in attendanceList) {
      final dateKey = record.date ?? '';
      if (!map.containsKey(dateKey)) {
        map[dateKey] = [];
      }
      map[dateKey]!.add(record);
    }
    return map;
  }





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

  Rx<DateTime?> fromDate = Rx<DateTime?>(null);
  Rx<DateTime?> toDate = Rx<DateTime?>(null);

  RxString selectedStatus = ''.obs; // all | pending | approved

  RxString filteredTotalHours = '0h 0m'.obs;
  RxString filteredDateRangeText = ''.obs;

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



  int _calculateTotalMinutes(String? checkIn, String? checkOut) {
    if (checkIn == null || checkOut == null) return 0;

    final inParts = checkIn.split(':');
    final outParts = checkOut.split(':');

    final inMinutes =
        int.parse(inParts[0]) * 60 + int.parse(inParts[1]);
    final outMinutes =
        int.parse(outParts[0]) * 60 + int.parse(outParts[1]);

    return outMinutes - inMinutes;
  }



  String getOvertimeText(String? checkIn, String? checkOut) {
    final totalMinutes = _calculateTotalMinutes(checkIn, checkOut);
    const standardMinutes = 8 * 60;

    if (totalMinutes <= standardMinutes) return '0h 0m';

    final overtime = totalMinutes - standardMinutes;
    final h = overtime ~/ 60;
    final m = overtime % 60;

    return '${h}h ${m}m';
  }

  void clearFields() {
    fromDate.value = null;
    toDate.value = null;
    apiTotalHours.value = '0h 0m';
    selectedStatus.value = '';
    filteredDateRangeText.value = '';
    fetchAttendanceHistory();
  }



}
