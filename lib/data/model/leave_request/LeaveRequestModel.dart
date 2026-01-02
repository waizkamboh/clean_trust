/// success : true
/// message : "Leave request submitted successfully"
/// data : {"leaveRequest":{"status":"pending","id":1,"user_id":2,"type":"sick","start_date":"2027-02-04","end_date":"2027-02-05","reason":"Medical certificate attached","documents":null,"updated_at":"2026-01-02T15:16:49.811Z","created_at":"2026-01-02T15:16:49.811Z","duration":2}}

class LeaveRequestModel {
  LeaveRequestModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  LeaveRequestModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
LeaveRequestModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => LeaveRequestModel(  success: success ?? _success,
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

/// leaveRequest : {"status":"pending","id":1,"user_id":2,"type":"sick","start_date":"2027-02-04","end_date":"2027-02-05","reason":"Medical certificate attached","documents":null,"updated_at":"2026-01-02T15:16:49.811Z","created_at":"2026-01-02T15:16:49.811Z","duration":2}

class Data {
  Data({
      LeaveRequest? leaveRequest,}){
    _leaveRequest = leaveRequest;
}

  Data.fromJson(dynamic json) {
    _leaveRequest = json['leaveRequest'] != null ? LeaveRequest.fromJson(json['leaveRequest']) : null;
  }
  LeaveRequest? _leaveRequest;
Data copyWith({  LeaveRequest? leaveRequest,
}) => Data(  leaveRequest: leaveRequest ?? _leaveRequest,
);
  LeaveRequest? get leaveRequest => _leaveRequest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_leaveRequest != null) {
      map['leaveRequest'] = _leaveRequest?.toJson();
    }
    return map;
  }

}

/// status : "pending"
/// id : 1
/// user_id : 2
/// type : "sick"
/// start_date : "2027-02-04"
/// end_date : "2027-02-05"
/// reason : "Medical certificate attached"
/// documents : null
/// updated_at : "2026-01-02T15:16:49.811Z"
/// created_at : "2026-01-02T15:16:49.811Z"
/// duration : 2

class LeaveRequest {
  LeaveRequest({
      String? status, 
      num? id, 
      num? userId, 
      String? type, 
      String? startDate, 
      String? endDate, 
      String? reason, 
      dynamic documents, 
      String? updatedAt, 
      String? createdAt, 
      num? duration,}){
    _status = status;
    _id = id;
    _userId = userId;
    _type = type;
    _startDate = startDate;
    _endDate = endDate;
    _reason = reason;
    _documents = documents;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _duration = duration;
}

  LeaveRequest.fromJson(dynamic json) {
    _status = json['status'];
    _id = json['id'];
    _userId = json['user_id'];
    _type = json['type'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _reason = json['reason'];
    _documents = json['documents'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _duration = json['duration'];
  }
  String? _status;
  num? _id;
  num? _userId;
  String? _type;
  String? _startDate;
  String? _endDate;
  String? _reason;
  dynamic _documents;
  String? _updatedAt;
  String? _createdAt;
  num? _duration;
LeaveRequest copyWith({  String? status,
  num? id,
  num? userId,
  String? type,
  String? startDate,
  String? endDate,
  String? reason,
  dynamic documents,
  String? updatedAt,
  String? createdAt,
  num? duration,
}) => LeaveRequest(  status: status ?? _status,
  id: id ?? _id,
  userId: userId ?? _userId,
  type: type ?? _type,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  reason: reason ?? _reason,
  documents: documents ?? _documents,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  duration: duration ?? _duration,
);
  String? get status => _status;
  num? get id => _id;
  num? get userId => _userId;
  String? get type => _type;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get reason => _reason;
  dynamic get documents => _documents;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get duration => _duration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['id'] = _id;
    map['user_id'] = _userId;
    map['type'] = _type;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['reason'] = _reason;
    map['documents'] = _documents;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['duration'] = _duration;
    return map;
  }

}