/// success : true
/// message : "Notification marked as read"
/// data : {"notification":{"id":8,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-26 to 2026-01-29","is_read":true,"read_at":"2026-01-03T11:22:44.224Z","metadata":{"leave_request_id":4,"user_id":2},"created_at":"2026-01-02T17:37:36.479Z","updated_at":"2026-01-03T11:22:44.225Z"}}

class MarkNotificationAsReadModel {
  MarkNotificationAsReadModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  MarkNotificationAsReadModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
MarkNotificationAsReadModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => MarkNotificationAsReadModel(  success: success ?? _success,
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

/// notification : {"id":8,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-26 to 2026-01-29","is_read":true,"read_at":"2026-01-03T11:22:44.224Z","metadata":{"leave_request_id":4,"user_id":2},"created_at":"2026-01-02T17:37:36.479Z","updated_at":"2026-01-03T11:22:44.225Z"}

class Data {
  Data({
      Notification? notification,}){
    _notification = notification;
}

  Data.fromJson(dynamic json) {
    _notification = json['notification'] != null ? Notification.fromJson(json['notification']) : null;
  }
  Notification? _notification;
Data copyWith({  Notification? notification,
}) => Data(  notification: notification ?? _notification,
);
  Notification? get notification => _notification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_notification != null) {
      map['notification'] = _notification?.toJson();
    }
    return map;
  }

}

/// id : 8
/// user_id : 2
/// type : "approval_request"
/// title : "Leave Request Pending"
/// message : "null requested leave from 2026-01-26 to 2026-01-29"
/// is_read : true
/// read_at : "2026-01-03T11:22:44.224Z"
/// metadata : {"leave_request_id":4,"user_id":2}
/// created_at : "2026-01-02T17:37:36.479Z"
/// updated_at : "2026-01-03T11:22:44.225Z"

class Notification {
  Notification({
      num? id, 
      num? userId, 
      String? type, 
      String? title, 
      String? message, 
      bool? isRead, 
      String? readAt, 
      Metadata? metadata, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _type = type;
    _title = title;
    _message = message;
    _isRead = isRead;
    _readAt = readAt;
    _metadata = metadata;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Notification.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _type = json['type'];
    _title = json['title'];
    _message = json['message'];
    _isRead = json['is_read'];
    _readAt = json['read_at'];
    _metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _type;
  String? _title;
  String? _message;
  bool? _isRead;
  String? _readAt;
  Metadata? _metadata;
  String? _createdAt;
  String? _updatedAt;
Notification copyWith({  num? id,
  num? userId,
  String? type,
  String? title,
  String? message,
  bool? isRead,
  String? readAt,
  Metadata? metadata,
  String? createdAt,
  String? updatedAt,
}) => Notification(  id: id ?? _id,
  userId: userId ?? _userId,
  type: type ?? _type,
  title: title ?? _title,
  message: message ?? _message,
  isRead: isRead ?? _isRead,
  readAt: readAt ?? _readAt,
  metadata: metadata ?? _metadata,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get type => _type;
  String? get title => _title;
  String? get message => _message;
  bool? get isRead => _isRead;
  String? get readAt => _readAt;
  Metadata? get metadata => _metadata;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['type'] = _type;
    map['title'] = _title;
    map['message'] = _message;
    map['is_read'] = _isRead;
    map['read_at'] = _readAt;
    if (_metadata != null) {
      map['metadata'] = _metadata?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// leave_request_id : 4
/// user_id : 2

class Metadata {
  Metadata({
      num? leaveRequestId, 
      num? userId,}){
    _leaveRequestId = leaveRequestId;
    _userId = userId;
}

  Metadata.fromJson(dynamic json) {
    _leaveRequestId = json['leave_request_id'];
    _userId = json['user_id'];
  }
  num? _leaveRequestId;
  num? _userId;
Metadata copyWith({  num? leaveRequestId,
  num? userId,
}) => Metadata(  leaveRequestId: leaveRequestId ?? _leaveRequestId,
  userId: userId ?? _userId,
);
  num? get leaveRequestId => _leaveRequestId;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leave_request_id'] = _leaveRequestId;
    map['user_id'] = _userId;
    return map;
  }

}