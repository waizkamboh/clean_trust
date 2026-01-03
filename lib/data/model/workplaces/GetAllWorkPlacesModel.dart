/// success : true
/// message : "Workplaces retrieved successfully"
/// data : {"workplaces":[{"id":1,"name":"Hamzsa Office 2","address":"12s3 Business St, City","latitude":40.7128,"longitude":-74.006,"geofence_radius":50,"status":"active","description":null,"created_at":"2026-01-03T16:18:19.430Z","updated_at":"2026-01-03T16:18:19.430Z","qrCode":null,"today_check_ins":0}],"pagination":{"total":1,"page":1,"limit":20,"pages":1}}

class GetAllWorkPlacesModel {
  GetAllWorkPlacesModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAllWorkPlacesModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetAllWorkPlacesModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetAllWorkPlacesModel(  success: success ?? _success,
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

/// workplaces : [{"id":1,"name":"Hamzsa Office 2","address":"12s3 Business St, City","latitude":40.7128,"longitude":-74.006,"geofence_radius":50,"status":"active","description":null,"created_at":"2026-01-03T16:18:19.430Z","updated_at":"2026-01-03T16:18:19.430Z","qrCode":null,"today_check_ins":0}]
/// pagination : {"total":1,"page":1,"limit":20,"pages":1}

class Data {
  Data({
      List<Workplaces>? workplaces, 
      Pagination? pagination,}){
    _workplaces = workplaces;
    _pagination = pagination;
}

  Data.fromJson(dynamic json) {
    if (json['workplaces'] != null) {
      _workplaces = [];
      json['workplaces'].forEach((v) {
        _workplaces?.add(Workplaces.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<Workplaces>? _workplaces;
  Pagination? _pagination;
Data copyWith({  List<Workplaces>? workplaces,
  Pagination? pagination,
}) => Data(  workplaces: workplaces ?? _workplaces,
  pagination: pagination ?? _pagination,
);
  List<Workplaces>? get workplaces => _workplaces;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_workplaces != null) {
      map['workplaces'] = _workplaces?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}

/// total : 1
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

/// id : 1
/// name : "Hamzsa Office 2"
/// address : "12s3 Business St, City"
/// latitude : 40.7128
/// longitude : -74.006
/// geofence_radius : 50
/// status : "active"
/// description : null
/// created_at : "2026-01-03T16:18:19.430Z"
/// updated_at : "2026-01-03T16:18:19.430Z"
/// qrCode : null
/// today_check_ins : 0

class Workplaces {
  Workplaces({
      num? id, 
      String? name, 
      String? address, 
      num? latitude, 
      num? longitude, 
      num? geofenceRadius, 
      String? status, 
      dynamic description, 
      String? createdAt, 
      String? updatedAt, 
      dynamic qrCode, 
      num? todayCheckIns,}){
    _id = id;
    _name = name;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _geofenceRadius = geofenceRadius;
    _status = status;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _qrCode = qrCode;
    _todayCheckIns = todayCheckIns;
}

  Workplaces.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _geofenceRadius = json['geofence_radius'];
    _status = json['status'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _qrCode = json['qrCode'];
    _todayCheckIns = json['today_check_ins'];
  }
  num? _id;
  String? _name;
  String? _address;
  num? _latitude;
  num? _longitude;
  num? _geofenceRadius;
  String? _status;
  dynamic _description;
  String? _createdAt;
  String? _updatedAt;
  dynamic _qrCode;
  num? _todayCheckIns;
Workplaces copyWith({  num? id,
  String? name,
  String? address,
  num? latitude,
  num? longitude,
  num? geofenceRadius,
  String? status,
  dynamic description,
  String? createdAt,
  String? updatedAt,
  dynamic qrCode,
  num? todayCheckIns,
}) => Workplaces(  id: id ?? _id,
  name: name ?? _name,
  address: address ?? _address,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  geofenceRadius: geofenceRadius ?? _geofenceRadius,
  status: status ?? _status,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  qrCode: qrCode ?? _qrCode,
  todayCheckIns: todayCheckIns ?? _todayCheckIns,
);
  num? get id => _id;
  String? get name => _name;
  String? get address => _address;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  num? get geofenceRadius => _geofenceRadius;
  String? get status => _status;
  dynamic get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get qrCode => _qrCode;
  num? get todayCheckIns => _todayCheckIns;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['geofence_radius'] = _geofenceRadius;
    map['status'] = _status;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['qrCode'] = _qrCode;
    map['today_check_ins'] = _todayCheckIns;
    return map;
  }

}