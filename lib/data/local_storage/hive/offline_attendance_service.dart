import 'package:hive/hive.dart';

import '../../model/hive/offline_attendance.dart';

class OfflineAttendanceService {
  final box = Hive.box<OfflineAttendance>('offline_attendance');

  Future<void> save(OfflineAttendance attendance) async {
    await box.add(attendance);
  }

  List<OfflineAttendance> getUnSynced() {
    return box.values.where((e) => e.synced == false).toList();
  }
}
