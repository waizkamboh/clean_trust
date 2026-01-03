import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../data/model/hive/offline_attendance.dart';
import '../../../../data/model/home/attendance/SyncOfflineAttendanceModel.dart';
import '../../../../data/repository/home/attendance/sync_offline_attendance_repository.dart';
import '../../../../helper/internet_check.dart';
import '../../../../util/custom_snackbar.dart';
import '../../../user_preference/user_preference.dart';

class AttendanceOfflineController extends GetxController {
  late Box<OfflineAttendance> box;

  RxList<OfflineAttendance> offlineList = <OfflineAttendance>[].obs;
  final UserPreference _userPreference = UserPreference();
  final AttendanceSyncRepository _syncRepo = AttendanceSyncRepository();


  @override
  void onInit() {
    super.onInit();
    box = Hive.box<OfflineAttendance>('offline_attendance');
    loadData();

    // Hive changes listen (auto refresh)
    box.watch().listen((event) {
      loadData();
    });
  }


  void loadData() {
    offlineList.value =
        box.values.where((e) => e.synced == false).toList().reversed.toList();
  }

  int get count => offlineList.length;

  String formatAttendanceTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime);
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (dateOnly == today) {
      return 'Today, ${_formatTime(dateTime)}';
    } else if (dateOnly == yesterday) {
      return 'Yesterday, ${_formatTime(dateTime)}';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}, ${_formatTime(dateTime)}';
    }
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final amPm = dt.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $amPm';
  }
  RxBool syncing = false.obs;
  Future<void> syncOfflineAttendance() async {
    if (offlineList.isEmpty) return;

    final online = await isOnline();
    if (!online) return;

    syncing.value = true;

    final token = await _userPreference.getToken();
    if (token == null) {
      syncing.value = false;
      return;
    }

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final records = offlineList.map((item) {
      return AttendanceSyncItem(
        qrCode: item.qrCode,
        scanTime: item.scanTime,
        latitude: item.latitude,
        longitude: item.longitude,
      );
    }).toList();

    final request = AttendanceSyncRequest(records: records);

    final response = await _syncRepo.syncOfflineAttendance(headers, request.toJson());

    if (response?['success'] == true) {
      // ✅ Mark all as synced
      for (final item in offlineList) {
        item.synced = true;
        await item.save();
      }

      loadData();
      Get.back(); // close dialog
      showCustomSnackBar('Attendance synced successfully');
    }

    syncing.value = false;
  }


}
