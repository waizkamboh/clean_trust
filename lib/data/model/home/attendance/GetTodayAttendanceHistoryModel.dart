import 'dart:convert';
/// success : true
/// message : "Today's attendance retrieved successfully"
/// data : {"records":[{"id":545,"user_id":11,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-04T23:46:21.717Z","date":"2026-01-04","check_in_time":"16:07:52","check_out_time":"23:46:21","latitude":"30.79253040","longitude":"73.44323400","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":"2026-01-04T19:13:52.194Z","created_at":"2026-01-04T16:07:52.906Z","updated_at":"2026-01-04T19:13:52.195Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"}}],"stats":{"status":"in_progress","totalHours":-2.98,"regularHours":-2.98,"overtimeHours":0,"breakMinutes":0,"isLate":true,"isEarly":false,"lateMinutes":886}}

GetTodayAttendanceHistoryModel getTodayAttendanceHistoryModelFromJson(String str) => GetTodayAttendanceHistoryModel.fromJson(json.decode(str));
String getTodayAttendanceHistoryModelToJson(GetTodayAttendanceHistoryModel data) => json.encode(data.toJson());
class GetTodayAttendanceHistoryModel {
  GetTodayAttendanceHistoryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTodayAttendanceHistoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetTodayAttendanceHistoryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetTodayAttendanceHistoryModel(  success: success ?? _success,
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

/// records : [{"id":545,"user_id":11,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-04T23:46:21.717Z","date":"2026-01-04","check_in_time":"16:07:52","check_out_time":"23:46:21","latitude":"30.79253040","longitude":"73.44323400","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":"2026-01-04T19:13:52.194Z","created_at":"2026-01-04T16:07:52.906Z","updated_at":"2026-01-04T19:13:52.195Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"}}]
/// stats : {"status":"in_progress","totalHours":-2.98,"regularHours":-2.98,"overtimeHours":0,"breakMinutes":0,"isLate":true,"isEarly":false,"lateMinutes":886}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Records>? records, 
      Stats? stats,}){
    _records = records;
    _stats = stats;
}

  Data.fromJson(dynamic json) {
    if (json['records'] != null) {
      _records = [];
      json['records'].forEach((v) {
        _records?.add(Records.fromJson(v));
      });
    }
    _stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }
  List<Records>? _records;
  Stats? _stats;
Data copyWith({  List<Records>? records,
  Stats? stats,
}) => Data(  records: records ?? _records,
  stats: stats ?? _stats,
);
  List<Records>? get records => _records;
  Stats? get stats => _stats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_records != null) {
      map['records'] = _records?.map((v) => v.toJson()).toList();
    }
    if (_stats != null) {
      map['stats'] = _stats?.toJson();
    }
    return map;
  }

}

/// status : "in_progress"
/// totalHours : -2.98
/// regularHours : -2.98
/// overtimeHours : 0
/// breakMinutes : 0
/// isLate : true
/// isEarly : false
/// lateMinutes : 886

Stats statsFromJson(String str) => Stats.fromJson(json.decode(str));
String statsToJson(Stats data) => json.encode(data.toJson());
class Stats {
  Stats({
      String? status, 
      num? totalHours, 
      num? regularHours, 
      num? overtimeHours, 
      num? breakMinutes, 
      bool? isLate, 
      bool? isEarly, 
      num? lateMinutes,}){
    _status = status;
    _totalHours = totalHours;
    _regularHours = regularHours;
    _overtimeHours = overtimeHours;
    _breakMinutes = breakMinutes;
    _isLate = isLate;
    _isEarly = isEarly;
    _lateMinutes = lateMinutes;
}

  Stats.fromJson(dynamic json) {
    _status = json['status'];
    _totalHours = json['totalHours'];
    _regularHours = json['regularHours'];
    _overtimeHours = json['overtimeHours'];
    _breakMinutes = json['breakMinutes'];
    _isLate = json['isLate'];
    _isEarly = json['isEarly'];
    _lateMinutes = json['lateMinutes'];
  }
  String? _status;
  num? _totalHours;
  num? _regularHours;
  num? _overtimeHours;
  num? _breakMinutes;
  bool? _isLate;
  bool? _isEarly;
  num? _lateMinutes;
Stats copyWith({  String? status,
  num? totalHours,
  num? regularHours,
  num? overtimeHours,
  num? breakMinutes,
  bool? isLate,
  bool? isEarly,
  num? lateMinutes,
}) => Stats(  status: status ?? _status,
  totalHours: totalHours ?? _totalHours,
  regularHours: regularHours ?? _regularHours,
  overtimeHours: overtimeHours ?? _overtimeHours,
  breakMinutes: breakMinutes ?? _breakMinutes,
  isLate: isLate ?? _isLate,
  isEarly: isEarly ?? _isEarly,
  lateMinutes: lateMinutes ?? _lateMinutes,
);
  String? get status => _status;
  num? get totalHours => _totalHours;
  num? get regularHours => _regularHours;
  num? get overtimeHours => _overtimeHours;
  num? get breakMinutes => _breakMinutes;
  bool? get isLate => _isLate;
  bool? get isEarly => _isEarly;
  num? get lateMinutes => _lateMinutes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalHours'] = _totalHours;
    map['regularHours'] = _regularHours;
    map['overtimeHours'] = _overtimeHours;
    map['breakMinutes'] = _breakMinutes;
    map['isLate'] = _isLate;
    map['isEarly'] = _isEarly;
    map['lateMinutes'] = _lateMinutes;
    return map;
  }

}

/// id : 545
/// user_id : 11
/// workplace_id : 8
/// qr_code_id : 8
/// type : "clock_in"
/// scan_time : "2026-01-04T23:46:21.717Z"
/// date : "2026-01-04"
/// check_in_time : "16:07:52"
/// check_out_time : "23:46:21"
/// latitude : "30.79253040"
/// longitude : "73.44323400"
/// is_valid : false
/// validation_message : "Location invalid: 11387652m from workplace (max 50m allowed)"
/// is_manual : false
/// manual_reason : null
/// status : "pending"
/// approved_by : null
/// approved_at : null
/// notes : null
/// is_offline : false
/// synced_at : "2026-01-04T19:13:52.194Z"
/// created_at : "2026-01-04T16:07:52.906Z"
/// updated_at : "2026-01-04T19:13:52.195Z"
/// workplace : {"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"}
/// qrCode : {"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"}

Records recordsFromJson(String str) => Records.fromJson(json.decode(str));
String recordsToJson(Records data) => json.encode(data.toJson());
class Records {
  Records({
      num? id, 
      num? userId, 
      num? workplaceId, 
      num? qrCodeId, 
      String? type, 
      String? scanTime, 
      String? date, 
      String? checkInTime, 
      String? checkOutTime, 
      String? latitude, 
      String? longitude, 
      bool? isValid, 
      String? validationMessage, 
      bool? isManual, 
      dynamic manualReason, 
      String? status, 
      dynamic approvedBy, 
      dynamic approvedAt, 
      dynamic notes, 
      bool? isOffline, 
      String? syncedAt, 
      String? createdAt, 
      String? updatedAt, 
      Workplace? workplace, 
      QrCode? qrCode,}){
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
    _approvedBy = approvedBy;
    _approvedAt = approvedAt;
    _notes = notes;
    _isOffline = isOffline;
    _syncedAt = syncedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _workplace = workplace;
    _qrCode = qrCode;
}

  Records.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _workplaceId = json['workplace_id'];
    _qrCodeId = json['qr_code_id'];
    _type = json['type'];
    _scanTime = json['scan_time'];
    _date = json['date'];
    _checkInTime = json['check_in_time'];
    _checkOutTime = json['check_out_time'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _isValid = json['is_valid'];
    _validationMessage = json['validation_message'];
    _isManual = json['is_manual'];
    _manualReason = json['manual_reason'];
    _status = json['status'];
    _approvedBy = json['approved_by'];
    _approvedAt = json['approved_at'];
    _notes = json['notes'];
    _isOffline = json['is_offline'];
    _syncedAt = json['synced_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _workplace = json['workplace'] != null ? Workplace.fromJson(json['workplace']) : null;
    _qrCode = json['qrCode'] != null ? QrCode.fromJson(json['qrCode']) : null;
  }
  num? _id;
  num? _userId;
  num? _workplaceId;
  num? _qrCodeId;
  String? _type;
  String? _scanTime;
  String? _date;
  String? _checkInTime;
  String? _checkOutTime;
  String? _latitude;
  String? _longitude;
  bool? _isValid;
  String? _validationMessage;
  bool? _isManual;
  dynamic _manualReason;
  String? _status;
  dynamic _approvedBy;
  dynamic _approvedAt;
  dynamic _notes;
  bool? _isOffline;
  String? _syncedAt;
  String? _createdAt;
  String? _updatedAt;
  Workplace? _workplace;
  QrCode? _qrCode;
Records copyWith({  num? id,
  num? userId,
  num? workplaceId,
  num? qrCodeId,
  String? type,
  String? scanTime,
  String? date,
  String? checkInTime,
  String? checkOutTime,
  String? latitude,
  String? longitude,
  bool? isValid,
  String? validationMessage,
  bool? isManual,
  dynamic manualReason,
  String? status,
  dynamic approvedBy,
  dynamic approvedAt,
  dynamic notes,
  bool? isOffline,
  String? syncedAt,
  String? createdAt,
  String? updatedAt,
  Workplace? workplace,
  QrCode? qrCode,
}) => Records(  id: id ?? _id,
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
  approvedBy: approvedBy ?? _approvedBy,
  approvedAt: approvedAt ?? _approvedAt,
  notes: notes ?? _notes,
  isOffline: isOffline ?? _isOffline,
  syncedAt: syncedAt ?? _syncedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  workplace: workplace ?? _workplace,
  qrCode: qrCode ?? _qrCode,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get workplaceId => _workplaceId;
  num? get qrCodeId => _qrCodeId;
  String? get type => _type;
  String? get scanTime => _scanTime;
  String? get date => _date;
  String? get checkInTime => _checkInTime;
  String? get checkOutTime => _checkOutTime;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  bool? get isValid => _isValid;
  String? get validationMessage => _validationMessage;
  bool? get isManual => _isManual;
  dynamic get manualReason => _manualReason;
  String? get status => _status;
  dynamic get approvedBy => _approvedBy;
  dynamic get approvedAt => _approvedAt;
  dynamic get notes => _notes;
  bool? get isOffline => _isOffline;
  String? get syncedAt => _syncedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Workplace? get workplace => _workplace;
  QrCode? get qrCode => _qrCode;

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
    map['approved_by'] = _approvedBy;
    map['approved_at'] = _approvedAt;
    map['notes'] = _notes;
    map['is_offline'] = _isOffline;
    map['synced_at'] = _syncedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_workplace != null) {
      map['workplace'] = _workplace?.toJson();
    }
    if (_qrCode != null) {
      map['qrCode'] = _qrCode?.toJson();
    }
    return map;
  }

}

/// id : 8
/// company_name : "Tech Solutions Inc"
/// department : "Engineering"

QrCode qrCodeFromJson(String str) => QrCode.fromJson(json.decode(str));
String qrCodeToJson(QrCode data) => json.encode(data.toJson());
class QrCode {
  QrCode({
      num? id, 
      String? companyName, 
      String? department,}){
    _id = id;
    _companyName = companyName;
    _department = department;
}

  QrCode.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _department = json['department'];
  }
  num? _id;
  String? _companyName;
  String? _department;
QrCode copyWith({  num? id,
  String? companyName,
  String? department,
}) => QrCode(  id: id ?? _id,
  companyName: companyName ?? _companyName,
  department: department ?? _department,
);
  num? get id => _id;
  String? get companyName => _companyName;
  String? get department => _department;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_name'] = _companyName;
    map['department'] = _department;
    return map;
  }

}

/// id : 8
/// name : "Noor Office 2"
/// address : "12s3 Business St, City"

Workplace workplaceFromJson(String str) => Workplace.fromJson(json.decode(str));
String workplaceToJson(Workplace data) => json.encode(data.toJson());
class Workplace {
  Workplace({
      num? id, 
      String? name, 
      String? address,}){
    _id = id;
    _name = name;
    _address = address;
}

  Workplace.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
  }
  num? _id;
  String? _name;
  String? _address;
Workplace copyWith({  num? id,
  String? name,
  String? address,
}) => Workplace(  id: id ?? _id,
  name: name ?? _name,
  address: address ?? _address,
);
  num? get id => _id;
  String? get name => _name;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    return map;
  }

}
