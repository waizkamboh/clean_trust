import 'dart:convert';
/// success : true
/// message : "User information retrieved successfully"
/// data : {"user":{"id":16,"full_name":"Alice Anderson","email":"alice.anderson@techcorp.com","google_id":null,"role":"employee","position":"Software Developer","phone_number":"+1234567895","status":"active","last_login":"2026-01-08T16:21:03.276Z","email_notifications":true,"push_notifications":true,"sms_notifications":false,"allow_location":true,"auto_sync":true,"profile_picture":null,"is_temporary_password":false,"is_2fa_enabled":false,"two_fa_method":null,"created_at":"2026-01-03T15:20:46.389Z","updated_at":"2026-01-08T16:21:03.279Z"}}

GetEmployee getEmployeeFromJson(String str) => GetEmployee.fromJson(json.decode(str));
String getEmployeeToJson(GetEmployee data) => json.encode(data.toJson());
class GetEmployee {
  GetEmployee({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetEmployee.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetEmployee copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetEmployee(  success: success ?? _success,
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

/// user : {"id":16,"full_name":"Alice Anderson","email":"alice.anderson@techcorp.com","google_id":null,"role":"employee","position":"Software Developer","phone_number":"+1234567895","status":"active","last_login":"2026-01-08T16:21:03.276Z","email_notifications":true,"push_notifications":true,"sms_notifications":false,"allow_location":true,"auto_sync":true,"profile_picture":null,"is_temporary_password":false,"is_2fa_enabled":false,"two_fa_method":null,"created_at":"2026-01-03T15:20:46.389Z","updated_at":"2026-01-08T16:21:03.279Z"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
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

/// id : 16
/// full_name : "Alice Anderson"
/// email : "alice.anderson@techcorp.com"
/// google_id : null
/// role : "employee"
/// position : "Software Developer"
/// phone_number : "+1234567895"
/// status : "active"
/// last_login : "2026-01-08T16:21:03.276Z"
/// email_notifications : true
/// push_notifications : true
/// sms_notifications : false
/// allow_location : true
/// auto_sync : true
/// profile_picture : null
/// is_temporary_password : false
/// is_2fa_enabled : false
/// two_fa_method : null
/// created_at : "2026-01-03T15:20:46.389Z"
/// updated_at : "2026-01-08T16:21:03.279Z"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      num? id, 
      String? fullName, 
      String? email, 
      dynamic googleId, 
      String? role, 
      String? position, 
      String? phoneNumber, 
      String? status, 
      String? lastLogin, 
      bool? emailNotifications, 
      bool? pushNotifications, 
      bool? smsNotifications, 
      bool? allowLocation, 
      bool? autoSync, 
      dynamic profilePicture, 
      bool? isTemporaryPassword, 
      bool? is2faEnabled, 
      dynamic twoFaMethod, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _fullName = fullName;
    _email = email;
    _googleId = googleId;
    _role = role;
    _position = position;
    _phoneNumber = phoneNumber;
    _status = status;
    _lastLogin = lastLogin;
    _emailNotifications = emailNotifications;
    _pushNotifications = pushNotifications;
    _smsNotifications = smsNotifications;
    _allowLocation = allowLocation;
    _autoSync = autoSync;
    _profilePicture = profilePicture;
    _isTemporaryPassword = isTemporaryPassword;
    _is2faEnabled = is2faEnabled;
    _twoFaMethod = twoFaMethod;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _email = json['email'];
    _googleId = json['google_id'];
    _role = json['role'];
    _position = json['position'];
    _phoneNumber = json['phone_number'];
    _status = json['status'];
    _lastLogin = json['last_login'];
    _emailNotifications = json['email_notifications'];
    _pushNotifications = json['push_notifications'];
    _smsNotifications = json['sms_notifications'];
    _allowLocation = json['allow_location'];
    _autoSync = json['auto_sync'];
    _profilePicture = json['profile_picture'];
    _isTemporaryPassword = json['is_temporary_password'];
    _is2faEnabled = json['is_2fa_enabled'];
    _twoFaMethod = json['two_fa_method'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _fullName;
  String? _email;
  dynamic _googleId;
  String? _role;
  String? _position;
  String? _phoneNumber;
  String? _status;
  String? _lastLogin;
  bool? _emailNotifications;
  bool? _pushNotifications;
  bool? _smsNotifications;
  bool? _allowLocation;
  bool? _autoSync;
  dynamic _profilePicture;
  bool? _isTemporaryPassword;
  bool? _is2faEnabled;
  dynamic _twoFaMethod;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? fullName,
  String? email,
  dynamic googleId,
  String? role,
  String? position,
  String? phoneNumber,
  String? status,
  String? lastLogin,
  bool? emailNotifications,
  bool? pushNotifications,
  bool? smsNotifications,
  bool? allowLocation,
  bool? autoSync,
  dynamic profilePicture,
  bool? isTemporaryPassword,
  bool? is2faEnabled,
  dynamic twoFaMethod,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
  googleId: googleId ?? _googleId,
  role: role ?? _role,
  position: position ?? _position,
  phoneNumber: phoneNumber ?? _phoneNumber,
  status: status ?? _status,
  lastLogin: lastLogin ?? _lastLogin,
  emailNotifications: emailNotifications ?? _emailNotifications,
  pushNotifications: pushNotifications ?? _pushNotifications,
  smsNotifications: smsNotifications ?? _smsNotifications,
  allowLocation: allowLocation ?? _allowLocation,
  autoSync: autoSync ?? _autoSync,
  profilePicture: profilePicture ?? _profilePicture,
  isTemporaryPassword: isTemporaryPassword ?? _isTemporaryPassword,
  is2faEnabled: is2faEnabled ?? _is2faEnabled,
  twoFaMethod: twoFaMethod ?? _twoFaMethod,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;
  dynamic get googleId => _googleId;
  String? get role => _role;
  String? get position => _position;
  String? get phoneNumber => _phoneNumber;
  String? get status => _status;
  String? get lastLogin => _lastLogin;
  bool? get emailNotifications => _emailNotifications;
  bool? get pushNotifications => _pushNotifications;
  bool? get smsNotifications => _smsNotifications;
  bool? get allowLocation => _allowLocation;
  bool? get autoSync => _autoSync;
  dynamic get profilePicture => _profilePicture;
  bool? get isTemporaryPassword => _isTemporaryPassword;
  bool? get is2faEnabled => _is2faEnabled;
  dynamic get twoFaMethod => _twoFaMethod;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['google_id'] = _googleId;
    map['role'] = _role;
    map['position'] = _position;
    map['phone_number'] = _phoneNumber;
    map['status'] = _status;
    map['last_login'] = _lastLogin;
    map['email_notifications'] = _emailNotifications;
    map['push_notifications'] = _pushNotifications;
    map['sms_notifications'] = _smsNotifications;
    map['allow_location'] = _allowLocation;
    map['auto_sync'] = _autoSync;
    map['profile_picture'] = _profilePicture;
    map['is_temporary_password'] = _isTemporaryPassword;
    map['is_2fa_enabled'] = _is2faEnabled;
    map['two_fa_method'] = _twoFaMethod;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}