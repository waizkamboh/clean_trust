class GetTodayAttendanceHistoryModel {
  bool? success;
  String? message;
  Data? data;

  GetTodayAttendanceHistoryModel({this.success, this.message, this.data});

  GetTodayAttendanceHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Records>? records;
  Stats? stats;

  Data({this.records, this.stats});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    return data;
  }
}

class Records {
  int? id;
  int? userId;
  int? workplaceId;
  int? qrCodeId;
  String? type;
  String? scanTime;
  String? date;
  String? checkInTime;
  String? checkOutTime;
  String? latitude;
  String? longitude;
  bool? isValid;
  String? validationMessage;
  bool? isManual;
  Null? manualReason;
  String? status;
  Null? approvedBy;
  Null? approvedAt;
  Null? notes;
  bool? isOffline;
  String? syncedAt;
  String? createdAt;
  String? updatedAt;
  Workplace? workplace;
  QrCode? qrCode;

  Records(
      {this.id,
        this.userId,
        this.workplaceId,
        this.qrCodeId,
        this.type,
        this.scanTime,
        this.date,
        this.checkInTime,
        this.checkOutTime,
        this.latitude,
        this.longitude,
        this.isValid,
        this.validationMessage,
        this.isManual,
        this.manualReason,
        this.status,
        this.approvedBy,
        this.approvedAt,
        this.notes,
        this.isOffline,
        this.syncedAt,
        this.createdAt,
        this.updatedAt,
        this.workplace,
        this.qrCode});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    workplaceId = json['workplace_id'];
    qrCodeId = json['qr_code_id'];
    type = json['type'];
    scanTime = json['scan_time'];
    date = json['date'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isValid = json['is_valid'];
    validationMessage = json['validation_message'];
    isManual = json['is_manual'];
    manualReason = json['manual_reason'];
    status = json['status'];
    approvedBy = json['approved_by'];
    approvedAt = json['approved_at'];
    notes = json['notes'];
    isOffline = json['is_offline'];
    syncedAt = json['synced_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    workplace = json['workplace'] != null
        ? new Workplace.fromJson(json['workplace'])
        : null;
    qrCode =
    json['qrCode'] != null ? new QrCode.fromJson(json['qrCode']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['workplace_id'] = this.workplaceId;
    data['qr_code_id'] = this.qrCodeId;
    data['type'] = this.type;
    data['scan_time'] = this.scanTime;
    data['date'] = this.date;
    data['check_in_time'] = this.checkInTime;
    data['check_out_time'] = this.checkOutTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_valid'] = this.isValid;
    data['validation_message'] = this.validationMessage;
    data['is_manual'] = this.isManual;
    data['manual_reason'] = this.manualReason;
    data['status'] = this.status;
    data['approved_by'] = this.approvedBy;
    data['approved_at'] = this.approvedAt;
    data['notes'] = this.notes;
    data['is_offline'] = this.isOffline;
    data['synced_at'] = this.syncedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.workplace != null) {
      data['workplace'] = this.workplace!.toJson();
    }
    if (this.qrCode != null) {
      data['qrCode'] = this.qrCode!.toJson();
    }
    return data;
  }
}

class Workplace {
  int? id;
  String? name;
  String? address;

  Workplace({this.id, this.name, this.address});

  Workplace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}

class QrCode {
  int? id;
  String? companyName;
  String? department;

  QrCode({this.id, this.companyName, this.department});

  QrCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['department'] = this.department;
    return data;
  }
}

class Stats {
  String? status;
  double? totalHours;
  double? regularHours;
  int? overtimeHours;
  int? breakMinutes;
  bool? isLate;
  bool? isEarly;
  int? lateMinutes;

  Stats(
      {this.status,
        this.totalHours,
        this.regularHours,
        this.overtimeHours,
        this.breakMinutes,
        this.isLate,
        this.isEarly,
        this.lateMinutes});

  Stats.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalHours = json['totalHours'];
    regularHours = json['regularHours'];
    overtimeHours = json['overtimeHours'];
    breakMinutes = json['breakMinutes'];
    isLate = json['isLate'];
    isEarly = json['isEarly'];
    lateMinutes = json['lateMinutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalHours'] = this.totalHours;
    data['regularHours'] = this.regularHours;
    data['overtimeHours'] = this.overtimeHours;
    data['breakMinutes'] = this.breakMinutes;
    data['isLate'] = this.isLate;
    data['isEarly'] = this.isEarly;
    data['lateMinutes'] = this.lateMinutes;
    return data;
  }
}
