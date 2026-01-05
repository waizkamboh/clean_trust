import 'dart:convert';
/// success : true
/// message : "Workplaces retrieved successfully"
/// data : {"workplaces":[{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City","latitude":"40.71280000","longitude":"-74.00600000","geofence_radius":50,"status":"active","description":null,"created_at":"2026-01-04T16:07:04.277Z","updated_at":"2026-01-04T16:07:04.277Z","qrCode":{"id":8,"code":"bcb0a19b-c029-412c-989c-ca2b980c0839","status":"active","company_name":"Tech Solutions Inc","department":"Engineering","contact_number":"+12345678901","email":"hr@techsolutions.com"},"today_check_ins":0},{"id":7,"name":"Latest Workspace","address":"Amen Court, 3, West Smithfield, City of London, England, EC4M 7DA, United Kingdom","latitude":"51.51451600","longitude":"-0.10116400","geofence_radius":257,"status":"active","description":null,"created_at":"2026-01-04T13:53:34.035Z","updated_at":"2026-01-04T13:53:34.035Z","qrCode":{"id":7,"code":"727accbb-a453-4df3-8c1f-d3cf98b0e7fa","status":"active","company_name":"Gold Tech","department":"Tech","contact_number":"+15551234567","email":"gomezbrennan@gmail.com"},"today_check_ins":0},{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101","latitude":"25.76170000","longitude":"-80.19180000","geofence_radius":50,"status":"active","description":"Sales and marketing office","created_at":"2026-01-03T15:21:14.599Z","updated_at":"2026-01-03T15:21:14.599Z","qrCode":{"id":6,"code":"80a790e7-0048-4de1-8d9a-aae0b9cde772","status":"active","company_name":"TechCorp Solutions","department":"Operations","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":5,"name":"Development Center - Austin","address":"321 Startup Lane, Austin, TX 78701","latitude":"30.26720000","longitude":"-97.74310000","geofence_radius":60,"status":"active","description":"Software development center","created_at":"2026-01-03T15:21:14.588Z","updated_at":"2026-01-03T15:21:14.588Z","qrCode":{"id":5,"code":"2dfef2bd-3973-48e3-b4f7-5bd3ce73a698","status":"active","company_name":"TechCorp Solutions","department":"Engineering","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601","latitude":"41.87810000","longitude":"-87.62980000","geofence_radius":100,"status":"active","description":"Co-working space for remote employees","created_at":"2026-01-03T15:21:14.576Z","updated_at":"2026-01-03T15:21:14.576Z","qrCode":{"id":4,"code":"aad954be-676b-4db0-a9e9-062dd099ed91","status":"active","company_name":"TechCorp Solutions","department":"General","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":3,"name":"Branch Office - Los Angeles","address":"456 Innovation Drive, Los Angeles, CA 90001","latitude":"34.05220000","longitude":"-118.24370000","geofence_radius":75,"status":"active","description":"West coast branch office","created_at":"2026-01-03T15:21:14.518Z","updated_at":"2026-01-03T15:21:14.518Z","qrCode":{"id":3,"code":"f41eaffc-7d44-4b81-81fc-e5c2d4f995b3","status":"active","company_name":"TechCorp Solutions","department":"Operations","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001","latitude":"40.71280000","longitude":"-74.00600000","geofence_radius":50,"status":"active","description":"Main headquarters office","created_at":"2026-01-03T15:21:14.499Z","updated_at":"2026-01-03T15:21:14.499Z","qrCode":{"id":2,"code":"102f159e-55b7-4ae2-8e3b-e2f181e65f87","status":"active","company_name":"TechCorp Solutions","department":"Operations","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0}],"pagination":{"total":7,"page":1,"limit":20,"pages":1}}

GetAllWorkPlacesModel getAllWorkPlacesModelFromJson(String str) => GetAllWorkPlacesModel.fromJson(json.decode(str));
String getAllWorkPlacesModelToJson(GetAllWorkPlacesModel data) => json.encode(data.toJson());
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

/// workplaces : [{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City","latitude":"40.71280000","longitude":"-74.00600000","geofence_radius":50,"status":"active","description":null,"created_at":"2026-01-04T16:07:04.277Z","updated_at":"2026-01-04T16:07:04.277Z","qrCode":{"id":8,"code":"bcb0a19b-c029-412c-989c-ca2b980c0839","status":"active","company_name":"Tech Solutions Inc","department":"Engineering","contact_number":"+12345678901","email":"hr@techsolutions.com"},"today_check_ins":0},{"id":7,"name":"Latest Workspace","address":"Amen Court, 3, West Smithfield, City of London, England, EC4M 7DA, United Kingdom","latitude":"51.51451600","longitude":"-0.10116400","geofence_radius":257,"status":"active","description":null,"created_at":"2026-01-04T13:53:34.035Z","updated_at":"2026-01-04T13:53:34.035Z","qrCode":{"id":7,"code":"727accbb-a453-4df3-8c1f-d3cf98b0e7fa","status":"active","company_name":"Gold Tech","department":"Tech","contact_number":"+15551234567","email":"gomezbrennan@gmail.com"},"today_check_ins":0},{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101","latitude":"25.76170000","longitude":"-80.19180000","geofence_radius":50,"status":"active","description":"Sales and marketing office","created_at":"2026-01-03T15:21:14.599Z","updated_at":"2026-01-03T15:21:14.599Z","qrCode":{"id":6,"code":"80a790e7-0048-4de1-8d9a-aae0b9cde772","status":"active","company_name":"TechCorp Solutions","department":"Operations","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":5,"name":"Development Center - Austin","address":"321 Startup Lane, Austin, TX 78701","latitude":"30.26720000","longitude":"-97.74310000","geofence_radius":60,"status":"active","description":"Software development center","created_at":"2026-01-03T15:21:14.588Z","updated_at":"2026-01-03T15:21:14.588Z","qrCode":{"id":5,"code":"2dfef2bd-3973-48e3-b4f7-5bd3ce73a698","status":"active","company_name":"TechCorp Solutions","department":"Engineering","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601","latitude":"41.87810000","longitude":"-87.62980000","geofence_radius":100,"status":"active","description":"Co-working space for remote employees","created_at":"2026-01-03T15:21:14.576Z","updated_at":"2026-01-03T15:21:14.576Z","qrCode":{"id":4,"code":"aad954be-676b-4db0-a9e9-062dd099ed91","status":"active","company_name":"TechCorp Solutions","department":"General","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":3,"name":"Branch Office - Los Angeles","address":"456 Innovation Drive, Los Angeles, CA 90001","latitude":"34.05220000","longitude":"-118.24370000","geofence_radius":75,"status":"active","description":"West coast branch office","created_at":"2026-01-03T15:21:14.518Z","updated_at":"2026-01-03T15:21:14.518Z","qrCode":{"id":3,"code":"f41eaffc-7d44-4b81-81fc-e5c2d4f995b3","status":"active","company_name":"TechCorp Solutions","department":"Operations","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0},{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001","latitude":"40.71280000","longitude":"-74.00600000","geofence_radius":50,"status":"active","description":"Main headquarters office","created_at":"2026-01-03T15:21:14.499Z","updated_at":"2026-01-03T15:21:14.499Z","qrCode":{"id":2,"code":"102f159e-55b7-4ae2-8e3b-e2f181e65f87","status":"active","company_name":"TechCorp Solutions","department":"Operations","contact_number":"+1234567890","email":"info@techcorp.com"},"today_check_ins":0}]
/// pagination : {"total":7,"page":1,"limit":20,"pages":1}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
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

/// total : 7
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

/// id : 8
/// name : "Noor Office 2"
/// address : "12s3 Business St, City"
/// latitude : "40.71280000"
/// longitude : "-74.00600000"
/// geofence_radius : 50
/// status : "active"
/// description : null
/// created_at : "2026-01-04T16:07:04.277Z"
/// updated_at : "2026-01-04T16:07:04.277Z"
/// qrCode : {"id":8,"code":"bcb0a19b-c029-412c-989c-ca2b980c0839","status":"active","company_name":"Tech Solutions Inc","department":"Engineering","contact_number":"+12345678901","email":"hr@techsolutions.com"}
/// today_check_ins : 0

Workplaces workplacesFromJson(String str) => Workplaces.fromJson(json.decode(str));
String workplacesToJson(Workplaces data) => json.encode(data.toJson());
class Workplaces {
  Workplaces({
      num? id, 
      String? name, 
      String? address, 
      String? latitude, 
      String? longitude, 
      num? geofenceRadius, 
      String? status, 
      dynamic description, 
      String? createdAt, 
      String? updatedAt, 
      QrCode? qrCode, 
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
    _qrCode = json['qrCode'] != null ? QrCode.fromJson(json['qrCode']) : null;
    _todayCheckIns = json['today_check_ins'];
  }
  num? _id;
  String? _name;
  String? _address;
  String? _latitude;
  String? _longitude;
  num? _geofenceRadius;
  String? _status;
  dynamic _description;
  String? _createdAt;
  String? _updatedAt;
  QrCode? _qrCode;
  num? _todayCheckIns;
Workplaces copyWith({  num? id,
  String? name,
  String? address,
  String? latitude,
  String? longitude,
  num? geofenceRadius,
  String? status,
  dynamic description,
  String? createdAt,
  String? updatedAt,
  QrCode? qrCode,
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
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  num? get geofenceRadius => _geofenceRadius;
  String? get status => _status;
  dynamic get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  QrCode? get qrCode => _qrCode;
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
    if (_qrCode != null) {
      map['qrCode'] = _qrCode?.toJson();
    }
    map['today_check_ins'] = _todayCheckIns;
    return map;
  }

}

/// id : 8
/// code : "bcb0a19b-c029-412c-989c-ca2b980c0839"
/// status : "active"
/// company_name : "Tech Solutions Inc"
/// department : "Engineering"
/// contact_number : "+12345678901"
/// email : "hr@techsolutions.com"

QrCode qrCodeFromJson(String str) => QrCode.fromJson(json.decode(str));
String qrCodeToJson(QrCode data) => json.encode(data.toJson());
class QrCode {
  QrCode({
      num? id, 
      String? code, 
      String? status, 
      String? companyName, 
      String? department, 
      String? contactNumber, 
      String? email,}){
    _id = id;
    _code = code;
    _status = status;
    _companyName = companyName;
    _department = department;
    _contactNumber = contactNumber;
    _email = email;
}

  QrCode.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _status = json['status'];
    _companyName = json['company_name'];
    _department = json['department'];
    _contactNumber = json['contact_number'];
    _email = json['email'];
  }
  num? _id;
  String? _code;
  String? _status;
  String? _companyName;
  String? _department;
  String? _contactNumber;
  String? _email;
QrCode copyWith({  num? id,
  String? code,
  String? status,
  String? companyName,
  String? department,
  String? contactNumber,
  String? email,
}) => QrCode(  id: id ?? _id,
  code: code ?? _code,
  status: status ?? _status,
  companyName: companyName ?? _companyName,
  department: department ?? _department,
  contactNumber: contactNumber ?? _contactNumber,
  email: email ?? _email,
);
  num? get id => _id;
  String? get code => _code;
  String? get status => _status;
  String? get companyName => _companyName;
  String? get department => _department;
  String? get contactNumber => _contactNumber;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['status'] = _status;
    map['company_name'] = _companyName;
    map['department'] = _department;
    map['contact_number'] = _contactNumber;
    map['email'] = _email;
    return map;
  }

}