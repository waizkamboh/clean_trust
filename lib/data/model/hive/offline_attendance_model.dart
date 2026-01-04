import 'package:hive/hive.dart';
part 'offline_attendance_model.g.dart';

@HiveType(typeId: 1)
class OfflineAttendance extends HiveObject {
  @HiveField(0)
  String qrCode;

  @HiveField(1)
  double latitude;

  @HiveField(2)
  double longitude;

  @HiveField(3)
  String scanTime;

  @HiveField(4)
  bool synced;

  @HiveField(5)
  int userId; // ✅ SharedPreferences wali ID

  OfflineAttendance({
    required this.qrCode,
    required this.latitude,
    required this.longitude,
    required this.scanTime,
    required this.userId,
    this.synced = false,
  });
}
