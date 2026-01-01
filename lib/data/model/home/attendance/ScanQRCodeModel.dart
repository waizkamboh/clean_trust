class ScanQRCodeModel {
  bool? success;
  String? message;
  Data? data;

  ScanQRCodeModel({this.success, this.message, this.data});

  ScanQRCodeModel.fromJson(Map<String, dynamic> json) {
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
  Attendance? attendance;
  Workplace? workplace;
  int? distance;
  bool? isValid;
  bool? isUpdate;

  Data(
      {this.attendance,
        this.workplace,
        this.distance,
        this.isValid,
        this.isUpdate});

  Data.fromJson(Map<String, dynamic> json) {
    attendance = json['attendance'] != null
        ? new Attendance.fromJson(json['attendance'])
        : null;
    workplace = json['workplace'] != null
        ? new Workplace.fromJson(json['workplace'])
        : null;
    distance = json['distance'];
    isValid = json['isValid'];
    isUpdate = json['isUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.toJson();
    }
    if (this.workplace != null) {
      data['workplace'] = this.workplace!.toJson();
    }
    data['distance'] = this.distance;
    data['isValid'] = this.isValid;
    data['isUpdate'] = this.isUpdate;
    return data;
  }
}

class Attendance {
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

  Attendance(
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
        this.updatedAt});

  Attendance.fromJson(Map<String, dynamic> json) {
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
