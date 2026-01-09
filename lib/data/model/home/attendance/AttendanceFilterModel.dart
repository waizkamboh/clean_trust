import 'dart:convert';
/// success : true
/// message : "Attendance history retrieved successfully"
/// data : {"records":[{"id":553,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-09T00:31:11.149Z","date":"2026-01-09","check_in_time":"00:05:22","check_out_time":"00:31:11","latitude":"30.79253260","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":13,"approved_at":"2026-01-08T20:39:42.436Z","notes":"He is a very smart and interesting person","is_offline":false,"synced_at":"2026-01-08T19:35:24.559Z","created_at":"2026-01-08T19:08:56.524Z","updated_at":"2026-01-08T20:39:42.436Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":552,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-08T23:56:10.006Z","date":"2026-01-08","check_in_time":"09:45:54","check_out_time":"23:56:10","latitude":"30.79253270","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":"2026-01-08T18:59:37.416Z","created_at":"2026-01-08T09:45:55.005Z","updated_at":"2026-01-08T18:59:37.416Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null},{"id":550,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-07T21:07:28.994Z","date":"2026-01-07","check_in_time":"12:19:49","check_out_time":"21:07:28","latitude":"40.71280000","longitude":"-74.00600000","is_valid":true,"validation_message":"Location verified (0m from workplace)","is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":"Person work very well and good","is_offline":false,"synced_at":"2026-01-07T21:07:29.139Z","created_at":"2026-01-07T12:19:49.410Z","updated_at":"2026-01-08T19:21:11.648Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null}],"pagination":{"total":3,"page":1,"limit":20,"pages":1},"total_hours":"66:17:24","total_hours_breakdown":{"hours":66,"minutes":17,"seconds":24,"total_seconds":238644}}

AttendanceFilterModel attendanceFilterModelFromJson(String str) => AttendanceFilterModel.fromJson(json.decode(str));
String attendanceFilterModelToJson(AttendanceFilterModel data) => json.encode(data.toJson());
class AttendanceFilterModel {
  AttendanceFilterModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  AttendanceFilterModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
AttendanceFilterModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => AttendanceFilterModel(  success: success ?? _success,
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

/// records : [{"id":553,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-09T00:31:11.149Z","date":"2026-01-09","check_in_time":"00:05:22","check_out_time":"00:31:11","latitude":"30.79253260","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":13,"approved_at":"2026-01-08T20:39:42.436Z","notes":"He is a very smart and interesting person","is_offline":false,"synced_at":"2026-01-08T19:35:24.559Z","created_at":"2026-01-08T19:08:56.524Z","updated_at":"2026-01-08T20:39:42.436Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":552,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-08T23:56:10.006Z","date":"2026-01-08","check_in_time":"09:45:54","check_out_time":"23:56:10","latitude":"30.79253270","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":"2026-01-08T18:59:37.416Z","created_at":"2026-01-08T09:45:55.005Z","updated_at":"2026-01-08T18:59:37.416Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null},{"id":550,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-07T21:07:28.994Z","date":"2026-01-07","check_in_time":"12:19:49","check_out_time":"21:07:28","latitude":"40.71280000","longitude":"-74.00600000","is_valid":true,"validation_message":"Location verified (0m from workplace)","is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":"Person work very well and good","is_offline":false,"synced_at":"2026-01-07T21:07:29.139Z","created_at":"2026-01-07T12:19:49.410Z","updated_at":"2026-01-08T19:21:11.648Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null}]
/// pagination : {"total":3,"page":1,"limit":20,"pages":1}
/// total_hours : "66:17:24"
/// total_hours_breakdown : {"hours":66,"minutes":17,"seconds":24,"total_seconds":238644}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<FilterRecords>? records,
      Pagination? pagination, 
      String? totalHours, 
      TotalHoursBreakdown? totalHoursBreakdown,}){
    _records = records;
    _pagination = pagination;
    _totalHours = totalHours;
    _totalHoursBreakdown = totalHoursBreakdown;
}

  Data.fromJson(dynamic json) {
    if (json['records'] != null) {
      _records = [];
      json['records'].forEach((v) {
        _records?.add(FilterRecords.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    _totalHours = json['total_hours'];
    _totalHoursBreakdown = json['total_hours_breakdown'] != null ? TotalHoursBreakdown.fromJson(json['total_hours_breakdown']) : null;
  }
  List<FilterRecords>? _records;
  Pagination? _pagination;
  String? _totalHours;
  TotalHoursBreakdown? _totalHoursBreakdown;
Data copyWith({  List<FilterRecords>? records,
  Pagination? pagination,
  String? totalHours,
  TotalHoursBreakdown? totalHoursBreakdown,
}) => Data(  records: records ?? _records,
  pagination: pagination ?? _pagination,
  totalHours: totalHours ?? _totalHours,
  totalHoursBreakdown: totalHoursBreakdown ?? _totalHoursBreakdown,
);
  List<FilterRecords>? get records => _records;
  Pagination? get pagination => _pagination;
  String? get totalHours => _totalHours;
  TotalHoursBreakdown? get totalHoursBreakdown => _totalHoursBreakdown;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_records != null) {
      map['records'] = _records?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    map['total_hours'] = _totalHours;
    if (_totalHoursBreakdown != null) {
      map['total_hours_breakdown'] = _totalHoursBreakdown?.toJson();
    }
    return map;
  }

}

/// hours : 66
/// minutes : 17
/// seconds : 24
/// total_seconds : 238644

TotalHoursBreakdown totalHoursBreakdownFromJson(String str) => TotalHoursBreakdown.fromJson(json.decode(str));
String totalHoursBreakdownToJson(TotalHoursBreakdown data) => json.encode(data.toJson());
class TotalHoursBreakdown {
  TotalHoursBreakdown({
      num? hours, 
      num? minutes, 
      num? seconds, 
      num? totalSeconds,}){
    _hours = hours;
    _minutes = minutes;
    _seconds = seconds;
    _totalSeconds = totalSeconds;
}

  TotalHoursBreakdown.fromJson(dynamic json) {
    _hours = json['hours'];
    _minutes = json['minutes'];
    _seconds = json['seconds'];
    _totalSeconds = json['total_seconds'];
  }
  num? _hours;
  num? _minutes;
  num? _seconds;
  num? _totalSeconds;
TotalHoursBreakdown copyWith({  num? hours,
  num? minutes,
  num? seconds,
  num? totalSeconds,
}) => TotalHoursBreakdown(  hours: hours ?? _hours,
  minutes: minutes ?? _minutes,
  seconds: seconds ?? _seconds,
  totalSeconds: totalSeconds ?? _totalSeconds,
);
  num? get hours => _hours;
  num? get minutes => _minutes;
  num? get seconds => _seconds;
  num? get totalSeconds => _totalSeconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hours'] = _hours;
    map['minutes'] = _minutes;
    map['seconds'] = _seconds;
    map['total_seconds'] = _totalSeconds;
    return map;
  }

}

/// total : 3
/// page : 1
/// limit : 20
/// pages : 1

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));
String paginationToJson(Pagination data) => json.encode(data.toJson());
class Pagination {
  Pagination({
      num? total, 
      num? page, 
      num? limit, 
      num? pages,}){
    _total = total;
    _page = page;
    _limit = limit;
    _pages = pages;
}

  Pagination.fromJson(dynamic json) {
    _total = json['total'];
    _page = json['page'];
    _limit = json['limit'];
    _pages = json['pages'];
  }
  num? _total;
  num? _page;
  num? _limit;
  num? _pages;
Pagination copyWith({  num? total,
  num? page,
  num? limit,
  num? pages,
}) => Pagination(  total: total ?? _total,
  page: page ?? _page,
  limit: limit ?? _limit,
  pages: pages ?? _pages,
);
  num? get total => _total;
  num? get page => _page;
  num? get limit => _limit;
  num? get pages => _pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['page'] = _page;
    map['limit'] = _limit;
    map['pages'] = _pages;
    return map;
  }

}

/// id : 553
/// user_id : 16
/// workplace_id : 8
/// qr_code_id : 8
/// type : "clock_in"
/// scan_time : "2026-01-09T00:31:11.149Z"
/// date : "2026-01-09"
/// check_in_time : "00:05:22"
/// check_out_time : "00:31:11"
/// latitude : "30.79253260"
/// longitude : "73.44323320"
/// is_valid : false
/// validation_message : "Location invalid: 11387652m from workplace (max 50m allowed)"
/// is_manual : false
/// manual_reason : null
/// status : "pending"
/// approved_by : 13
/// approved_at : "2026-01-08T20:39:42.436Z"
/// notes : "He is a very smart and interesting person"
/// is_offline : false
/// synced_at : "2026-01-08T19:35:24.559Z"
/// created_at : "2026-01-08T19:08:56.524Z"
/// updated_at : "2026-01-08T20:39:42.436Z"
/// workplace : {"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"}
/// qrCode : {"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"}
/// approver : {"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}

FilterRecords recordsFromJson(String str) => FilterRecords.fromJson(json.decode(str));
String recordsToJson(FilterRecords data) => json.encode(data.toJson());
class FilterRecords {
  FilterRecords({
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
      num? approvedBy, 
      String? approvedAt, 
      String? notes, 
      bool? isOffline, 
      String? syncedAt, 
      String? createdAt, 
      String? updatedAt, 
      Workplace? workplace, 
      QrCode? qrCode, 
      Approver? approver,}){
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
    _approver = approver;
}

  FilterRecords.fromJson(dynamic json) {
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
    _approver = json['approver'] != null ? Approver.fromJson(json['approver']) : null;
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
  num? _approvedBy;
  String? _approvedAt;
  String? _notes;
  bool? _isOffline;
  String? _syncedAt;
  String? _createdAt;
  String? _updatedAt;
  Workplace? _workplace;
  QrCode? _qrCode;
  Approver? _approver;
FilterRecords copyWith({  num? id,
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
  num? approvedBy,
  String? approvedAt,
  String? notes,
  bool? isOffline,
  String? syncedAt,
  String? createdAt,
  String? updatedAt,
  Workplace? workplace,
  QrCode? qrCode,
  Approver? approver,
}) => FilterRecords(  id: id ?? _id,
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
  approver: approver ?? _approver,
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
  num? get approvedBy => _approvedBy;
  String? get approvedAt => _approvedAt;
  String? get notes => _notes;
  bool? get isOffline => _isOffline;
  String? get syncedAt => _syncedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Workplace? get workplace => _workplace;
  QrCode? get qrCode => _qrCode;
  Approver? get approver => _approver;

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
    if (_approver != null) {
      map['approver'] = _approver?.toJson();
    }
    return map;
  }

}

/// id : 13
/// full_name : "Mike Manager"
/// email : "mike.manager@techcorp.com"

Approver approverFromJson(String str) => Approver.fromJson(json.decode(str));
String approverToJson(Approver data) => json.encode(data.toJson());
class Approver {
  Approver({
      num? id, 
      String? fullName, 
      String? email,}){
    _id = id;
    _fullName = fullName;
    _email = email;
}

  Approver.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _email = json['email'];
  }
  num? _id;
  String? _fullName;
  String? _email;
Approver copyWith({  num? id,
  String? fullName,
  String? email,
}) => Approver(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
);
  num? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['email'] = _email;
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