class AttendanceSyncRequest {
  List<AttendanceSyncItem> records;

  AttendanceSyncRequest({required this.records});

  Map<String, dynamic> toJson() {
    return {
      "records": records.map((e) => e.toJson()).toList(),
    };
  }
}

class AttendanceSyncItem {
  String qrCode;
  String scanTime;
  double latitude;
  double longitude;

  AttendanceSyncItem({
    required this.qrCode,
    required this.scanTime,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      "qr_code": qrCode,
      "scanTime": scanTime,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
