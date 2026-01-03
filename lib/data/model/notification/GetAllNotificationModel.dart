/// success : true
/// message : "Notifications retrieved successfully"
/// data : {"notifications":[{"id":8,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-26 to 2026-01-29","is_read":false,"read_at":null,"metadata":{"leave_request_id":4,"user_id":2},"created_at":"2026-01-02T17:37:36.479Z","updated_at":"2026-01-02T17:37:36.479Z"},{"id":6,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-07 to 2026-01-21","is_read":false,"read_at":null,"metadata":{"leave_request_id":3,"user_id":2},"created_at":"2026-01-02T17:19:57.392Z","updated_at":"2026-01-02T17:19:57.392Z"},{"id":4,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-02 to 2026-01-02","is_read":false,"read_at":null,"metadata":{"leave_request_id":2,"user_id":2},"created_at":"2026-01-02T17:19:09.143Z","updated_at":"2026-01-02T17:19:09.143Z"},{"id":2,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2027-02-04 to 2027-02-05","is_read":false,"read_at":null,"metadata":{"leave_request_id":1,"user_id":2},"created_at":"2026-01-02T15:16:49.890Z","updated_at":"2026-01-02T15:16:49.890Z"}],"unread_count":4,"pagination":{"total":4,"page":1,"limit":20,"pages":1}}

class GetAllNotificationModel {
  GetAllNotificationModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAllNotificationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetAllNotificationModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetAllNotificationModel(  success: success ?? _success,
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

/// notifications : [{"id":8,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-26 to 2026-01-29","is_read":false,"read_at":null,"metadata":{"leave_request_id":4,"user_id":2},"created_at":"2026-01-02T17:37:36.479Z","updated_at":"2026-01-02T17:37:36.479Z"},{"id":6,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-07 to 2026-01-21","is_read":false,"read_at":null,"metadata":{"leave_request_id":3,"user_id":2},"created_at":"2026-01-02T17:19:57.392Z","updated_at":"2026-01-02T17:19:57.392Z"},{"id":4,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2026-01-02 to 2026-01-02","is_read":false,"read_at":null,"metadata":{"leave_request_id":2,"user_id":2},"created_at":"2026-01-02T17:19:09.143Z","updated_at":"2026-01-02T17:19:09.143Z"},{"id":2,"user_id":2,"type":"approval_request","title":"Leave Request Pending","message":"null requested leave from 2027-02-04 to 2027-02-05","is_read":false,"read_at":null,"metadata":{"leave_request_id":1,"user_id":2},"created_at":"2026-01-02T15:16:49.890Z","updated_at":"2026-01-02T15:16:49.890Z"}]
/// unread_count : 4
/// pagination : {"total":4,"page":1,"limit":20,"pages":1}

class Data {
  Data({
      List<Notifications>? notifications, 
      num? unreadCount, 
      Pagination? pagination,}){
    _notifications = notifications;
    _unreadCount = unreadCount;
    _pagination = pagination;
}

  Data.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
    _unreadCount = json['unread_count'];
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<Notifications>? _notifications;
  num? _unreadCount;
  Pagination? _pagination;
Data copyWith({  List<Notifications>? notifications,
  num? unreadCount,
  Pagination? pagination,
}) => Data(  notifications: notifications ?? _notifications,
  unreadCount: unreadCount ?? _unreadCount,
  pagination: pagination ?? _pagination,
);
  List<Notifications>? get notifications => _notifications;
  num? get unreadCount => _unreadCount;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    map['unread_count'] = _unreadCount;
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}

/// total : 4
/// page : 1
/// limit : 20
/// pages : 1

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

/// id : 8
/// user_id : 2
/// type : "approval_request"
/// title : "Leave Request Pending"
/// message : "null requested leave from 2026-01-26 to 2026-01-29"
/// is_read : false
/// read_at : null
/// metadata : {"leave_request_id":4,"user_id":2}
/// created_at : "2026-01-02T17:37:36.479Z"
/// updated_at : "2026-01-02T17:37:36.479Z"

class Notifications {
  Notifications({
      num? id, 
      num? userId, 
      String? type, 
      String? title, 
      String? message, 
      bool? isRead, 
      dynamic readAt, 
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

  Notifications.fromJson(dynamic json) {
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
  dynamic _readAt;
  Metadata? _metadata;
  String? _createdAt;
  String? _updatedAt;
Notifications copyWith({  num? id,
  num? userId,
  String? type,
  String? title,
  String? message,
  bool? isRead,
  dynamic readAt,
  Metadata? metadata,
  String? createdAt,
  String? updatedAt,
}) => Notifications(  id: id ?? _id,
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
  dynamic get readAt => _readAt;
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