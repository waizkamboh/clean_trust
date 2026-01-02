import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../data/model/hive/offline_attendance.dart';

class AttendanceOfflineController extends GetxController {
  late Box<OfflineAttendance> box;

  RxList<OfflineAttendance> offlineList = <OfflineAttendance>[].obs;

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

}
