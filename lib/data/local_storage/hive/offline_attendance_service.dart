import 'package:flutter/material.dart';
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
  void debugPrintAll() {
    final box = Hive.box<OfflineAttendance>('offline_attendance');

    debugPrint('Total records: ${box.length}');

    for (var i = 0; i < box.length; i++) {
      final item = box.getAt(i);
      debugPrint(
        '[$i] QR: ${item?.qrCode}, '
            'lat: ${item?.latitude}, '
            'lng: ${item?.longitude}, '
            'synced: ${item?.synced}',
      );

    }
  }

}
