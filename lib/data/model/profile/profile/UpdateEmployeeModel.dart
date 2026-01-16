/// success : true
/// message : "Employee updated successfully"
/// data : {"user":{"id":4,"full_name":"Moon golp","email":"employee10@example.com","phone_number":"+12345671890","position":"Software Developer","role":"employee","status":"active","profile_picture":null,"email_notifications":true,"push_notifications":true,"sms_notifications":false,"updated_at":"2026-01-03T15:20:46.886Z"}}

class UpdateEmployeeModel {
  UpdateEmployeeModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateEmployeeModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateEmployeeModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateEmployeeModel(  success: success ?? _success,
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

/// user : {"id":4,"full_name":"Moon golp","email":"employee10@example.com","phone_number":"+12345671890","position":"Software Developer","role":"employee","status":"active","profile_picture":null,"email_notifications":true,"push_notifications":true,"sms_notifications":false,"updated_at":"2026-01-03T15:20:46.886Z"}

class Data {
  Data({
      User? user,}){
    _user = user;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
Data copyWith({  User? user,
}) => Data(  user: user ?? _user,
);
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 4
/// full_name : "Moon golp"
/// email : "employee10@example.com"
/// phone_number : "+12345671890"
/// position : "Software Developer"
/// role : "employee"
/// status : "active"
/// profile_picture : null
/// email_notifications : true
/// push_notifications : true
/// sms_notifications : false
/// updated_at : "2026-01-03T15:20:46.886Z"

class User {
  User({
      num? id, 
      String? fullName, 
      String? email, 
      String? phoneNumber, 
      String? position, 
      String? role, 
      String? status, 
      dynamic profilePicture, 
      bool? emailNotifications, 
      bool? pushNotifications, 
      bool? smsNotifications, 
      String? updatedAt,}){
    _id = id;
    _fullName = fullName;
    _email = email;
    _phoneNumber = phoneNumber;
    _position = position;
    _role = role;
    _status = status;
    _profilePicture = profilePicture;
    _emailNotifications = emailNotifications;
    _pushNotifications = pushNotifications;
    _smsNotifications = smsNotifications;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _position = json['position'];
    _role = json['role'];
    _status = json['status'];
    _profilePicture = json['profile_picture'];
    _emailNotifications = json['email_notifications'];
    _pushNotifications = json['push_notifications'];
    _smsNotifications = json['sms_notifications'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _fullName;
  String? _email;
  String? _phoneNumber;
  String? _position;
  String? _role;
  String? _status;
  dynamic _profilePicture;
  bool? _emailNotifications;
  bool? _pushNotifications;
  bool? _smsNotifications;
  String? _updatedAt;
User copyWith({  num? id,
  String? fullName,
  String? email,
  String? phoneNumber,
  String? position,
  String? role,
  String? status,
  dynamic profilePicture,
  bool? emailNotifications,
  bool? pushNotifications,
  bool? smsNotifications,
  String? updatedAt,
}) => User(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  position: position ?? _position,
  role: role ?? _role,
  status: status ?? _status,
  profilePicture: profilePicture ?? _profilePicture,
  emailNotifications: emailNotifications ?? _emailNotifications,
  pushNotifications: pushNotifications ?? _pushNotifications,
  smsNotifications: smsNotifications ?? _smsNotifications,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get position => _position;
  String? get role => _role;
  String? get status => _status;
  dynamic get profilePicture => _profilePicture;
  bool? get emailNotifications => _emailNotifications;
  bool? get pushNotifications => _pushNotifications;
  bool? get smsNotifications => _smsNotifications;
  String? get updatedAt => _updatedAt;

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
    map['email_notifications'] = _emailNotifications;
    map['push_notifications'] = _pushNotifications;
    map['sms_notifications'] = _smsNotifications;
    map['updated_at'] = _updatedAt;
    return map;
  }

}