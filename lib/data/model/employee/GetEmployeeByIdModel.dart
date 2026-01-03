/// success : true
/// message : "Employee retrieved successfully"
/// data : {"employee":{"id":2,"full_name":null,"email":"waizkamboh6@gmail.com","phone_number":"+93333384337333","position":null,"role":"admin","status":"active","profile_picture":null,"created_at":"2026-01-02T13:36:23.490Z","last_login":"2026-01-03T15:04:14.360Z","email_notifications":true,"push_notifications":true,"sms_notifications":false,"stats":{"today_status":"absent","today_location":null,"monthly_attendance_days":0,"pending_leave_requests":13}}}

class GetEmployeeByIdModel {
  GetEmployeeByIdModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetEmployeeByIdModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetEmployeeByIdModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetEmployeeByIdModel(  success: success ?? _success,
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

/// employee : {"id":2,"full_name":null,"email":"waizkamboh6@gmail.com","phone_number":"+93333384337333","position":null,"role":"admin","status":"active","profile_picture":null,"created_at":"2026-01-02T13:36:23.490Z","last_login":"2026-01-03T15:04:14.360Z","email_notifications":true,"push_notifications":true,"sms_notifications":false,"stats":{"today_status":"absent","today_location":null,"monthly_attendance_days":0,"pending_leave_requests":13}}

class Data {
  Data({
      Employee? employee,}){
    _employee = employee;
}

  Data.fromJson(dynamic json) {
    _employee = json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }
  Employee? _employee;
Data copyWith({  Employee? employee,
}) => Data(  employee: employee ?? _employee,
);
  Employee? get employee => _employee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_employee != null) {
      map['employee'] = _employee?.toJson();
    }
    return map;
  }

}

/// id : 2
/// full_name : null
/// email : "waizkamboh6@gmail.com"
/// phone_number : "+93333384337333"
/// position : null
/// role : "admin"
/// status : "active"
/// profile_picture : null
/// created_at : "2026-01-02T13:36:23.490Z"
/// last_login : "2026-01-03T15:04:14.360Z"
/// email_notifications : true
/// push_notifications : true
/// sms_notifications : false
/// stats : {"today_status":"absent","today_location":null,"monthly_attendance_days":0,"pending_leave_requests":13}

class Employee {
  Employee({
      num? id, 
      dynamic fullName, 
      String? email, 
      String? phoneNumber, 
      dynamic position, 
      String? role, 
      String? status, 
      dynamic profilePicture, 
      String? createdAt, 
      String? lastLogin, 
      bool? emailNotifications, 
      bool? pushNotifications, 
      bool? smsNotifications, 
      Stats? stats,}){
    _id = id;
    _fullName = fullName;
    _email = email;
    _phoneNumber = phoneNumber;
    _position = position;
    _role = role;
    _status = status;
    _profilePicture = profilePicture;
    _createdAt = createdAt;
    _lastLogin = lastLogin;
    _emailNotifications = emailNotifications;
    _pushNotifications = pushNotifications;
    _smsNotifications = smsNotifications;
    _stats = stats;
}

  Employee.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _position = json['position'];
    _role = json['role'];
    _status = json['status'];
    _profilePicture = json['profile_picture'];
    _createdAt = json['created_at'];
    _lastLogin = json['last_login'];
    _emailNotifications = json['email_notifications'];
    _pushNotifications = json['push_notifications'];
    _smsNotifications = json['sms_notifications'];
    _stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }
  num? _id;
  dynamic _fullName;
  String? _email;
  String? _phoneNumber;
  dynamic _position;
  String? _role;
  String? _status;
  dynamic _profilePicture;
  String? _createdAt;
  String? _lastLogin;
  bool? _emailNotifications;
  bool? _pushNotifications;
  bool? _smsNotifications;
  Stats? _stats;
Employee copyWith({  num? id,
  dynamic fullName,
  String? email,
  String? phoneNumber,
  dynamic position,
  String? role,
  String? status,
  dynamic profilePicture,
  String? createdAt,
  String? lastLogin,
  bool? emailNotifications,
  bool? pushNotifications,
  bool? smsNotifications,
  Stats? stats,
}) => Employee(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  position: position ?? _position,
  role: role ?? _role,
  status: status ?? _status,
  profilePicture: profilePicture ?? _profilePicture,
  createdAt: createdAt ?? _createdAt,
  lastLogin: lastLogin ?? _lastLogin,
  emailNotifications: emailNotifications ?? _emailNotifications,
  pushNotifications: pushNotifications ?? _pushNotifications,
  smsNotifications: smsNotifications ?? _smsNotifications,
  stats: stats ?? _stats,
);
  num? get id => _id;
  dynamic get fullName => _fullName;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  dynamic get position => _position;
  String? get role => _role;
  String? get status => _status;
  dynamic get profilePicture => _profilePicture;
  String? get createdAt => _createdAt;
  String? get lastLogin => _lastLogin;
  bool? get emailNotifications => _emailNotifications;
  bool? get pushNotifications => _pushNotifications;
  bool? get smsNotifications => _smsNotifications;
  Stats? get stats => _stats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['position'] = _position;
    map['role'] = _role;
    map['status'] = _status;
    map['profile_picture'] = _profilePicture;
    map['created_at'] = _createdAt;
    map['last_login'] = _lastLogin;
    map['email_notifications'] = _emailNotifications;
    map['push_notifications'] = _pushNotifications;
    map['sms_notifications'] = _smsNotifications;
    if (_stats != null) {
      map['stats'] = _stats?.toJson();
    }
    return map;
  }

}

/// today_status : "absent"
/// today_location : null
/// monthly_attendance_days : 0
/// pending_leave_requests : 13

class Stats {
  Stats({
      String? todayStatus, 
      dynamic todayLocation, 
      num? monthlyAttendanceDays, 
      num? pendingLeaveRequests,}){
    _todayStatus = todayStatus;
    _todayLocation = todayLocation;
    _monthlyAttendanceDays = monthlyAttendanceDays;
    _pendingLeaveRequests = pendingLeaveRequests;
}

  Stats.fromJson(dynamic json) {
    _todayStatus = json['today_status'];
    _todayLocation = json['today_location'];
    _monthlyAttendanceDays = json['monthly_attendance_days'];
    _pendingLeaveRequests = json['pending_leave_requests'];
  }
  String? _todayStatus;
  dynamic _todayLocation;
  num? _monthlyAttendanceDays;
  num? _pendingLeaveRequests;
Stats copyWith({  String? todayStatus,
  dynamic todayLocation,
  num? monthlyAttendanceDays,
  num? pendingLeaveRequests,
}) => Stats(  todayStatus: todayStatus ?? _todayStatus,
  todayLocation: todayLocation ?? _todayLocation,
  monthlyAttendanceDays: monthlyAttendanceDays ?? _monthlyAttendanceDays,
  pendingLeaveRequests: pendingLeaveRequests ?? _pendingLeaveRequests,
);
  String? get todayStatus => _todayStatus;
  dynamic get todayLocation => _todayLocation;
  num? get monthlyAttendanceDays => _monthlyAttendanceDays;
  num? get pendingLeaveRequests => _pendingLeaveRequests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['today_status'] = _todayStatus;
    map['today_location'] = _todayLocation;
    map['monthly_attendance_days'] = _monthlyAttendanceDays;
    map['pending_leave_requests'] = _pendingLeaveRequests;
    return map;
  }

}