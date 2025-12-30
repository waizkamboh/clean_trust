/// success : true
/// message : "Please change your temporary password"
/// data : {"user":{"id":3,"full_name":"hamza","email":"hamza2@example.com","google_id":null,"role":"employee","position":"Software Developer","phone_number":"+12245271901","status":"active","last_login":"2025-12-30T06:55:10.507Z","email_notifications":true,"push_notifications":true,"sms_notifications":false,"allow_location":false,"auto_sync":true,"profile_picture":null,"is_temporary_password":true,"is_2fa_enabled":false,"two_fa_method":null,"created_at":"2025-12-29T17:09:16.950Z","updated_at":"2025-12-30T06:55:10.507Z"},"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywicm9sZSI6ImVtcGxveWVlIiwiZW1haWwiOiJoYW16YTJAZXhhbXBsZS5jb20iLCJpYXQiOjE3NjcwNzc3MTAsImV4cCI6MTc2OTY2OTcxMH0.CtxjpjfBsAFaRbbVP5ko6peWXfFmnwvCAFha_QUfkAw"}
/// requiresPasswordChange : true

class LoginModel {
  LoginModel({
      bool? success, 
      String? message, 
      Data? data, 
      bool? requiresPasswordChange,}){
    _success = success;
    _message = message;
    _data = data;
    _requiresPasswordChange = requiresPasswordChange;
}

  LoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _requiresPasswordChange = json['requiresPasswordChange'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  bool? _requiresPasswordChange;
LoginModel copyWith({  bool? success,
  String? message,
  Data? data,
  bool? requiresPasswordChange,
}) => LoginModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  requiresPasswordChange: requiresPasswordChange ?? _requiresPasswordChange,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
  bool? get requiresPasswordChange => _requiresPasswordChange;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['requiresPasswordChange'] = _requiresPasswordChange;
    return map;
  }

}

/// user : {"id":3,"full_name":"hamza","email":"hamza2@example.com","google_id":null,"role":"employee","position":"Software Developer","phone_number":"+12245271901","status":"active","last_login":"2025-12-30T06:55:10.507Z","email_notifications":true,"push_notifications":true,"sms_notifications":false,"allow_location":false,"auto_sync":true,"profile_picture":null,"is_temporary_password":true,"is_2fa_enabled":false,"two_fa_method":null,"created_at":"2025-12-29T17:09:16.950Z","updated_at":"2025-12-30T06:55:10.507Z"}
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywicm9sZSI6ImVtcGxveWVlIiwiZW1haWwiOiJoYW16YTJAZXhhbXBsZS5jb20iLCJpYXQiOjE3NjcwNzc3MTAsImV4cCI6MTc2OTY2OTcxMH0.CtxjpjfBsAFaRbbVP5ko6peWXfFmnwvCAFha_QUfkAw"

class Data {
  Data({
      User? user, 
      String? accessToken,}){
    _user = user;
    _accessToken = accessToken;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['accessToken'];
  }
  User? _user;
  String? _accessToken;
Data copyWith({  User? user,
  String? accessToken,
}) => Data(  user: user ?? _user,
  accessToken: accessToken ?? _accessToken,
);
  User? get user => _user;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['accessToken'] = _accessToken;
    return map;
  }

}

/// id : 3
/// full_name : "hamza"
/// email : "hamza2@example.com"
/// google_id : null
/// role : "employee"
/// position : "Software Developer"
/// phone_number : "+12245271901"
/// status : "active"
/// last_login : "2025-12-30T06:55:10.507Z"
/// email_notifications : true
/// push_notifications : true
/// sms_notifications : false
/// allow_location : false
/// auto_sync : true
/// profile_picture : null
/// is_temporary_password : true
/// is_2fa_enabled : false
/// two_fa_method : null
/// created_at : "2025-12-29T17:09:16.950Z"
/// updated_at : "2025-12-30T06:55:10.507Z"

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