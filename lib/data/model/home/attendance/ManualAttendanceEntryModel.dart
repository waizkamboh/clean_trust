/// success : true
/// message : "Manual entry submitted successfully. Pending approval."
/// data : {"attendance":{"id":65,"user_id":8,"workplace_id":9,"qr_code_id":null,"type":"clock_in","scan_time":null,"date":"2026-12-25","check_in_time":"19:10:00","check_out_time":"23:10:00","latitude":"40.71280000","longitude":"-74.00600000","is_valid":false,"validation_message":"Manual entry - pending approval","is_manual":true,"manual_reason":"Forgot to scan QR code, was working from office location","status":"pending","is_offline":false,"synced_at":"2026-01-01T13:24:42.771Z","updated_at":"2026-01-01T13:24:42.773Z","created_at":"2026-01-01T13:24:42.773Z","approved_by":null,"approved_at":null,"notes":null},"message":"Attendance record created"}

class ManualAttendanceEntryModel {
  ManualAttendanceEntryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ManualAttendanceEntryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
ManualAttendanceEntryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => ManualAttendanceEntryModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// attendance : {"id":65,"user_id":8,"workplace_id":9,"qr_code_id":null,"type":"clock_in","scan_time":null,"date":"2026-12-25","check_in_time":"19:10:00","check_out_time":"23:10:00","latitude":"40.71280000","longitude":"-74.00600000","is_valid":false,"validation_message":"Manual entry - pending approval","is_manual":true,"manual_reason":"Forgot to scan QR code, was working from office location","status":"pending","is_offline":false,"synced_at":"2026-01-01T13:24:42.771Z","updated_at":"2026-01-01T13:24:42.773Z","created_at":"2026-01-01T13:24:42.773Z","approved_by":null,"approved_at":null,"notes":null}
/// message : "Attendance record created"

class Data {
  Data({
      Attendance? attendance, 
      String? message,}){
    _attendance = attendance;
    _message = message;
}

  Data.fromJson(dynamic json) {
    _attendance = json['attendance'] != null ? Attendance.fromJson(json['attendance']) : null;
    _message = json['message'];
  }
  Attendance? _attendance;
  String? _message;
Data copyWith({  Attendance? attendance,
  String? message,
}) => Data(  attendance: attendance ?? _attendance,
  message: message ?? _message,
);
  Attendance? get attendance => _attendance;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_attendance != null) {
      map['attendance'] = _attendance?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : 65
/// user_id : 8
/// workplace_id : 9
/// qr_code_id : null
/// type : "clock_in"
/// scan_time : null
/// date : "2026-12-25"
/// check_in_time : "19:10:00"
/// check_out_time : "23:10:00"
/// latitude : "40.71280000"
/// longitude : "-74.00600000"
/// is_valid : false
/// validation_message : "Manual entry - pending approval"
/// is_manual : true
/// manual_reason : "Forgot to scan QR code, was working from office location"
/// status : "pending"
/// is_offline : false
/// synced_at : "2026-01-01T13:24:42.771Z"
/// updated_at : "2026-01-01T13:24:42.773Z"
/// created_at : "2026-01-01T13:24:42.773Z"
/// approved_by : null
/// approved_at : null
/// notes : null

class Attendance {
  Attendance({
      num? id, 
      num? userId, 
      num? workplaceId, 
      dynamic qrCodeId, 
      String? type, 
      dynamic scanTime, 
      String? date, 
      String? checkInTime, 
      String? checkOutTime, 
      String? latitude, 
      String? longitude, 
      bool? isValid, 
      String? validationMessage, 
      bool? isManual, 
      String? manualReason, 
      String? status, 
      bool? isOffline, 
      String? syncedAt, 
      String? updatedAt, 
      String? createdAt, 
      dynamic approvedBy, 
      dynamic approvedAt, 
      dynamic notes,}){
    _id = id;
    _userId = userId;
    _workplaceId = workplaceId;
    _qrCodeId = qrCodeId;
    _type = type;
    _scanTime = scanTime;
    _date = date;
    _checkInTime = checkInTime;
    _checkOutTime = checkOutTime;
    _latitude = latitude;
    _longitude = longitude;
    _isValid = isValid;
    _validationMessage = validationMessage;
    _isManual = isManual;
    _manualReason = manualReason;
    _status = status;
    _isOffline = isOffline;
    _syncedAt = syncedAt;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _approvedBy = approvedBy;
    _approvedAt = approvedAt;
    _notes = notes;
}

  Attendance.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _workplaceId = json['workplace_id'];
    _qrCodeId = json['qr_code_id'];
    _type = json['type'];
    _scanTime = json['scan_time'];
    _date = json['date'];
    _checkInTime = json['check_in_time'];
    _checkOutTime = json['check_out_time'];
    _latitude = json['latitude'].toString();
    _longitude = json['longitude'].toString();
    _isValid = json['is_valid'];
    _validationMessage = json['validation_message'];
    _isManual = json['is_manual'];
    _manualReason = json['manual_reason'];
    _status = json['status'];
    _isOffline = json['is_offline'];
    _syncedAt = json['synced_at'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _approvedBy = json['approved_by'];
    _approvedAt = json['approved_at'];
    _notes = json['notes'];
  }
  num? _id;
  num? _userId;
  num? _workplaceId;
  dynamic _qrCodeId;
  String? _type;
  dynamic _scanTime;
  String? _date;
  String? _checkInTime;
  String? _checkOutTime;
  String? _latitude;
  String? _longitude;
  bool? _isValid;
  String? _validationMessage;
  bool? _isManual;
  String? _manualReason;
  String? _status;
  bool? _isOffline;
  String? _syncedAt;
  String? _updatedAt;
  String? _createdAt;
  dynamic _approvedBy;
  dynamic _approvedAt;
  dynamic _notes;
Attendance copyWith({  num? id,
  num? userId,
  num? workplaceId,
  dynamic qrCodeId,
  String? type,
  dynamic scanTime,
  String? date,
  String? checkInTime,
  String? checkOutTime,
  String? latitude,
  String? longitude,
  bool? isValid,
  String? validationMessage,
  bool? isManual,
  String? manualReason,
  String? status,
  bool? isOffline,
  String? syncedAt,
  String? updatedAt,
  String? createdAt,
  dynamic approvedBy,
  dynamic approvedAt,
  dynamic notes,
}) => Attendance(  id: id ?? _id,
  userId: userId ?? _userId,
  workplaceId: workplaceId ?? _workplaceId,
  qrCodeId: qrCodeId ?? _qrCodeId,
  type: type ?? _type,
  scanTime: scanTime ?? _scanTime,
  date: date ?? _date,
  checkInTime: checkInTime ?? _checkInTime,
  checkOutTime: checkOutTime ?? _checkOutTime,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  isValid: isValid ?? _isValid,
  validationMessage: validationMessage ?? _validationMessage,
  isManual: isManual ?? _isManual,
  manualReason: manualReason ?? _manualReason,
  status: status ?? _status,
  isOffline: isOffline ?? _isOffline,
  syncedAt: syncedAt ?? _syncedAt,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  approvedBy: approvedBy ?? _approvedBy,
  approvedAt: approvedAt ?? _approvedAt,
  notes: notes ?? _notes,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get workplaceId => _workplaceId;
  dynamic get qrCodeId => _qrCodeId;
  String? get type => _type;
  dynamic get scanTime => _scanTime;
  String? get date => _date;
  String? get checkInTime => _checkInTime;
  String? get checkOutTime => _checkOutTime;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  bool? get isValid => _isValid;
  String? get validationMessage => _validationMessage;
  bool? get isManual => _isManual;
  String? get manualReason => _manualReason;
  String? get status => _status;
  bool? get isOffline => _isOffline;
  String? get syncedAt => _syncedAt;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  dynamic get approvedBy => _approvedBy;
  dynamic get approvedAt => _approvedAt;
  dynamic get notes => _notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['workplace_id'] = _workplaceId;
    map['qr_code_id'] = _qrCodeId;
    map['type'] = _type;
    map['scan_time'] = _scanTime;
    map['date'] = _date;
    map['check_in_time'] = _checkInTime;
    map['check_out_time'] = _checkOutTime;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['is_valid'] = _isValid;
    map['validation_message'] = _validationMessage;
    map['is_manual'] = _isManual;
    map['manual_reason'] = _manualReason;
    map['status'] = _status;
    map['is_offline'] = _isOffline;
    map['synced_at'] = _syncedAt;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['approved_by'] = _approvedBy;
    map['approved_at'] = _approvedAt;
    map['notes'] = _notes;
    return map;
  }

}