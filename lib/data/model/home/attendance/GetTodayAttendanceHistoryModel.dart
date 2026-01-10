class GetTodayAttendanceHistoryModel {
  bool? success;
  String? message;
  Data? data;

  GetTodayAttendanceHistoryModel({this.success, this.message, this.data});

  GetTodayAttendanceHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  List<Records>? records;
  Stats? stats;

  Data({this.records, this.stats});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = List<Records>.from(
        json['records'].map((v) => Records.fromJson(v)),
      );
    }
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'records': records?.map((v) => v.toJson()).toList(),
      'stats': stats?.toJson(),
    };
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
  String? manualReason;
  String? status;
  int? approvedBy;
  String? approvedAt;
  String? notes;
  bool? isOffline;
  String? syncedAt;
  String? createdAt;
  String? updatedAt;
  Workplace? workplace;
  QrCode? qrCode;
  Approver? approver;

  Records({
    this.id,
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
    this.qrCode,
    this.approver,
  });

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
        ? Workplace.fromJson(json['workplace'])
        : null;

    qrCode = json['qrCode'] != null
        ? QrCode.fromJson(json['qrCode'])
        : null;

    approver = json['approver'] != null
        ? Approver.fromJson(json['approver'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'workplace_id': workplaceId,
      'qr_code_id': qrCodeId,
      'type': type,
      'scan_time': scanTime,
      'date': date,
      'check_in_time': checkInTime,
      'check_out_time': checkOutTime,
      'latitude': latitude,
      'longitude': longitude,
      'is_valid': isValid,
      'validation_message': validationMessage,
      'is_manual': isManual,
      'manual_reason': manualReason,
      'status': status,
      'approved_by': approvedBy,
      'approved_at': approvedAt,
      'notes': notes,
      'is_offline': isOffline,
      'synced_at': syncedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'workplace': workplace?.toJson(),
      'qrCode': qrCode?.toJson(),
      'approver': approver?.toJson(),
    };
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
    return {
      'id': id,
      'name': name,
      'address': address,
    };
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
    return {
      'id': id,
      'company_name': companyName,
      'department': department,
    };
  }
}

class Approver {
  int? id;
  String? fullName;
  String? email;

  Approver({this.id, this.fullName, this.email});

  Approver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
    };
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

  Stats({
    this.status,
    this.totalHours,
    this.regularHours,
    this.overtimeHours,
    this.breakMinutes,
    this.isLate,
    this.isEarly,
    this.lateMinutes,
  });

  Stats.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalHours = (json['totalHours'] as num?)?.toDouble();
    regularHours = (json['regularHours'] as num?)?.toDouble();
    overtimeHours = json['overtimeHours'];
    breakMinutes = json['breakMinutes'];
    isLate = json['isLate'];
    isEarly = json['isEarly'];
    lateMinutes = json['lateMinutes'];
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalHours': totalHours,
      'regularHours': regularHours,
      'overtimeHours': overtimeHours,
      'breakMinutes': breakMinutes,
      'isLate': isLate,
      'isEarly': isEarly,
      'lateMinutes': lateMinutes,
    };
  }
}
