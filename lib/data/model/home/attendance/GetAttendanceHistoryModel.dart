import 'dart:convert';
/// success : true
/// message : "Attendance history retrieved successfully"
/// data : {"records":[{"id":551,"user_id":16,"workplace_id":6,"qr_code_id":null,"type":"clock_in","scan_time":null,"date":"2026-01-16","check_in_time":"13:09:00","check_out_time":"14:11:00","latitude":"30.75675676","longitude":"73.34300615","is_valid":false,"validation_message":"Manual entry - pending approval","is_manual":true,"manual_reason":"very very ill. please approve","status":"approved","approved_by":12,"approved_at":"2026-01-07T15:51:37.998Z","notes":null,"is_offline":false,"synced_at":"2026-01-07T15:50:00.029Z","created_at":"2026-01-07T15:50:00.052Z","updated_at":"2026-01-07T15:51:37.999Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":null,"approver":{"id":12,"full_name":"Sarah Administrator","email":"sarah.admin@techcorp.com"}},{"id":553,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-09T00:31:11.149Z","date":"2026-01-09","check_in_time":"00:05:22","check_out_time":"00:31:11","latitude":"30.79253260","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":13,"approved_at":"2026-01-08T20:39:42.436Z","notes":"He is a very smart and interesting person","is_offline":false,"synced_at":"2026-01-08T19:35:24.559Z","created_at":"2026-01-08T19:08:56.524Z","updated_at":"2026-01-08T20:39:42.436Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":552,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-08T23:56:10.006Z","date":"2026-01-08","check_in_time":"09:45:54","check_out_time":"23:56:10","latitude":"30.79253270","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":"2026-01-08T18:59:37.416Z","created_at":"2026-01-08T09:45:55.005Z","updated_at":"2026-01-08T18:59:37.416Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null},{"id":550,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-07T21:07:28.994Z","date":"2026-01-07","check_in_time":"12:19:49","check_out_time":"21:07:28","latitude":"40.71280000","longitude":"-74.00600000","is_valid":true,"validation_message":"Location verified (0m from workplace)","is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":"Person work very well and good","is_offline":false,"synced_at":"2026-01-07T21:07:29.139Z","created_at":"2026-01-07T12:19:49.410Z","updated_at":"2026-01-08T19:21:11.648Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null},{"id":519,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_out","scan_time":"2026-01-02T18:22:00.000Z","date":"2026-01-02","check_in_time":null,"check_out_time":"18:22:00","latitude":"25.76182094","longitude":"-80.19152931","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"pending","approved_by":11,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:42.389Z","updated_at":"2026-01-03T15:21:42.389Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":518,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_in","scan_time":"2026-01-02T08:04:00.000Z","date":"2026-01-02","check_in_time":"08:04:00","check_out_time":null,"latitude":"25.76129974","longitude":"-80.19226051","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"pending","approved_by":11,"approved_at":"2026-01-02T08:04:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:42.289Z","updated_at":"2026-01-03T15:21:42.289Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":493,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_out","scan_time":"2026-01-01T17:52:00.000Z","date":"2026-01-01","check_in_time":null,"check_out_time":"17:52:00","latitude":"25.76132986","longitude":"-80.19212614","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"pending","approved_by":13,"approved_at":"2026-01-01T17:52:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.476Z","updated_at":"2026-01-03T15:21:40.476Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":495,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"break_end","scan_time":"2026-01-01T13:18:00.000Z","date":"2026-01-01","check_in_time":null,"check_out_time":null,"latitude":"25.76131633","longitude":"-80.19197421","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.577Z","updated_at":"2026-01-03T15:21:40.577Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":494,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"break_start","scan_time":"2026-01-01T12:52:00.000Z","date":"2026-01-01","check_in_time":null,"check_out_time":null,"latitude":"25.76134056","longitude":"-80.19157801","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.488Z","updated_at":"2026-01-03T15:21:40.488Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":492,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_in","scan_time":"2026-01-01T09:47:00.000Z","date":"2026-01-01","check_in_time":"09:47:00","check_out_time":null,"latitude":"25.76146441","longitude":"-80.19147189","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":13,"approved_at":"2026-01-01T09:47:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.192Z","updated_at":"2026-01-03T15:21:40.192Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":469,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"clock_out","scan_time":"2025-12-31T18:57:00.000Z","date":"2025-12-31","check_in_time":null,"check_out_time":"18:57:00","latitude":"40.71262558","longitude":"-74.00649849","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":15,"approved_at":"2025-12-31T18:57:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.388Z","updated_at":"2026-01-03T15:21:38.388Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":15,"full_name":"David Director","email":"david.director@techcorp.com"}},{"id":471,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"break_end","scan_time":"2025-12-31T14:19:00.000Z","date":"2025-12-31","check_in_time":null,"check_out_time":null,"latitude":"40.71301299","longitude":"-74.00633880","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.489Z","updated_at":"2026-01-03T15:21:38.489Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":470,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"break_start","scan_time":"2025-12-31T13:59:00.000Z","date":"2025-12-31","check_in_time":null,"check_out_time":null,"latitude":"40.71319645","longitude":"-74.00604536","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.477Z","updated_at":"2026-01-03T15:21:38.477Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":468,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"clock_in","scan_time":"2025-12-31T09:36:00.000Z","date":"2025-12-31","check_in_time":"09:36:00","check_out_time":null,"latitude":"40.71232927","longitude":"-74.00637029","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":15,"approved_at":"2025-12-31T09:36:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.289Z","updated_at":"2026-01-03T15:21:38.289Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":15,"full_name":"David Director","email":"david.director@techcorp.com"}},{"id":441,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_out","scan_time":"2025-12-30T17:01:00.000Z","date":"2025-12-30","check_in_time":null,"check_out_time":"17:01:00","latitude":"41.87770314","longitude":"-87.62970319","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":11,"approved_at":"2025-12-30T17:01:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:36.278Z","updated_at":"2026-01-03T15:21:36.278Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":440,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_in","scan_time":"2025-12-30T09:33:00.000Z","date":"2025-12-30","check_in_time":"09:33:00","check_out_time":null,"latitude":"41.87790616","longitude":"-87.62951924","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":11,"approved_at":"2025-12-30T09:33:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:36.177Z","updated_at":"2026-01-03T15:21:36.177Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":417,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_out","scan_time":"2025-12-29T18:52:00.000Z","date":"2025-12-29","check_in_time":null,"check_out_time":"18:52:00","latitude":"41.87838217","longitude":"-87.62976916","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":12,"approved_at":"2025-12-29T18:52:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:34.576Z","updated_at":"2026-01-03T15:21:34.576Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":12,"full_name":"Sarah Administrator","email":"sarah.admin@techcorp.com"}},{"id":416,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_in","scan_time":"2025-12-29T09:25:00.000Z","date":"2025-12-29","check_in_time":"09:25:00","check_out_time":null,"latitude":"41.87843070","longitude":"-87.63022093","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":12,"approved_at":"2025-12-29T09:25:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:34.477Z","updated_at":"2026-01-03T15:21:34.477Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":12,"full_name":"Sarah Administrator","email":"sarah.admin@techcorp.com"}},{"id":391,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_out","scan_time":"2025-12-26T18:06:00.000Z","date":"2025-12-26","check_in_time":null,"check_out_time":"18:06:00","latitude":"41.87796850","longitude":"-87.62998167","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":14,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:32.776Z","updated_at":"2026-01-03T15:21:32.776Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":14,"full_name":"Lisa Lead","email":"lisa.lead@techcorp.com"}},{"id":390,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_in","scan_time":"2025-12-26T09:04:00.000Z","date":"2025-12-26","check_in_time":"09:04:00","check_out_time":null,"latitude":"41.87828408","longitude":"-87.62978999","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":14,"approved_at":"2025-12-26T09:04:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:32.676Z","updated_at":"2026-01-03T15:21:32.676Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":14,"full_name":"Lisa Lead","email":"lisa.lead@techcorp.com"}}],"pagination":{"total":54,"page":1,"limit":20,"pages":3}}

GetAttendanceHistoryModel getAttendanceHistoryModelFromJson(String str) => GetAttendanceHistoryModel.fromJson(json.decode(str));
String getAttendanceHistoryModelToJson(GetAttendanceHistoryModel data) => json.encode(data.toJson());
class GetAttendanceHistoryModel {
  GetAttendanceHistoryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAttendanceHistoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetAttendanceHistoryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetAttendanceHistoryModel(  success: success ?? _success,
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

/// records : [{"id":551,"user_id":16,"workplace_id":6,"qr_code_id":null,"type":"clock_in","scan_time":null,"date":"2026-01-16","check_in_time":"13:09:00","check_out_time":"14:11:00","latitude":"30.75675676","longitude":"73.34300615","is_valid":false,"validation_message":"Manual entry - pending approval","is_manual":true,"manual_reason":"very very ill. please approve","status":"approved","approved_by":12,"approved_at":"2026-01-07T15:51:37.998Z","notes":null,"is_offline":false,"synced_at":"2026-01-07T15:50:00.029Z","created_at":"2026-01-07T15:50:00.052Z","updated_at":"2026-01-07T15:51:37.999Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":null,"approver":{"id":12,"full_name":"Sarah Administrator","email":"sarah.admin@techcorp.com"}},{"id":553,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-09T00:31:11.149Z","date":"2026-01-09","check_in_time":"00:05:22","check_out_time":"00:31:11","latitude":"30.79253260","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":13,"approved_at":"2026-01-08T20:39:42.436Z","notes":"He is a very smart and interesting person","is_offline":false,"synced_at":"2026-01-08T19:35:24.559Z","created_at":"2026-01-08T19:08:56.524Z","updated_at":"2026-01-08T20:39:42.436Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":552,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-08T23:56:10.006Z","date":"2026-01-08","check_in_time":"09:45:54","check_out_time":"23:56:10","latitude":"30.79253270","longitude":"73.44323320","is_valid":false,"validation_message":"Location invalid: 11387652m from workplace (max 50m allowed)","is_manual":false,"manual_reason":null,"status":"pending","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":"2026-01-08T18:59:37.416Z","created_at":"2026-01-08T09:45:55.005Z","updated_at":"2026-01-08T18:59:37.416Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null},{"id":550,"user_id":16,"workplace_id":8,"qr_code_id":8,"type":"clock_in","scan_time":"2026-01-07T21:07:28.994Z","date":"2026-01-07","check_in_time":"12:19:49","check_out_time":"21:07:28","latitude":"40.71280000","longitude":"-74.00600000","is_valid":true,"validation_message":"Location verified (0m from workplace)","is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":"Person work very well and good","is_offline":false,"synced_at":"2026-01-07T21:07:29.139Z","created_at":"2026-01-07T12:19:49.410Z","updated_at":"2026-01-08T19:21:11.648Z","workplace":{"id":8,"name":"Noor Office 2","address":"12s3 Business St, City"},"qrCode":{"id":8,"company_name":"Tech Solutions Inc","department":"Engineering"},"approver":null},{"id":519,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_out","scan_time":"2026-01-02T18:22:00.000Z","date":"2026-01-02","check_in_time":null,"check_out_time":"18:22:00","latitude":"25.76182094","longitude":"-80.19152931","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"pending","approved_by":11,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:42.389Z","updated_at":"2026-01-03T15:21:42.389Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":518,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_in","scan_time":"2026-01-02T08:04:00.000Z","date":"2026-01-02","check_in_time":"08:04:00","check_out_time":null,"latitude":"25.76129974","longitude":"-80.19226051","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"pending","approved_by":11,"approved_at":"2026-01-02T08:04:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:42.289Z","updated_at":"2026-01-03T15:21:42.289Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":493,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_out","scan_time":"2026-01-01T17:52:00.000Z","date":"2026-01-01","check_in_time":null,"check_out_time":"17:52:00","latitude":"25.76132986","longitude":"-80.19212614","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"pending","approved_by":13,"approved_at":"2026-01-01T17:52:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.476Z","updated_at":"2026-01-03T15:21:40.476Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":495,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"break_end","scan_time":"2026-01-01T13:18:00.000Z","date":"2026-01-01","check_in_time":null,"check_out_time":null,"latitude":"25.76131633","longitude":"-80.19197421","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.577Z","updated_at":"2026-01-03T15:21:40.577Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":494,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"break_start","scan_time":"2026-01-01T12:52:00.000Z","date":"2026-01-01","check_in_time":null,"check_out_time":null,"latitude":"25.76134056","longitude":"-80.19157801","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.488Z","updated_at":"2026-01-03T15:21:40.488Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":492,"user_id":16,"workplace_id":6,"qr_code_id":6,"type":"clock_in","scan_time":"2026-01-01T09:47:00.000Z","date":"2026-01-01","check_in_time":"09:47:00","check_out_time":null,"latitude":"25.76146441","longitude":"-80.19147189","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":13,"approved_at":"2026-01-01T09:47:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:40.192Z","updated_at":"2026-01-03T15:21:40.192Z","workplace":{"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"},"qrCode":{"id":6,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":13,"full_name":"Mike Manager","email":"mike.manager@techcorp.com"}},{"id":469,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"clock_out","scan_time":"2025-12-31T18:57:00.000Z","date":"2025-12-31","check_in_time":null,"check_out_time":"18:57:00","latitude":"40.71262558","longitude":"-74.00649849","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":15,"approved_at":"2025-12-31T18:57:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.388Z","updated_at":"2026-01-03T15:21:38.388Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":15,"full_name":"David Director","email":"david.director@techcorp.com"}},{"id":471,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"break_end","scan_time":"2025-12-31T14:19:00.000Z","date":"2025-12-31","check_in_time":null,"check_out_time":null,"latitude":"40.71301299","longitude":"-74.00633880","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.489Z","updated_at":"2026-01-03T15:21:38.489Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":470,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"break_start","scan_time":"2025-12-31T13:59:00.000Z","date":"2025-12-31","check_in_time":null,"check_out_time":null,"latitude":"40.71319645","longitude":"-74.00604536","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":null,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.477Z","updated_at":"2026-01-03T15:21:38.477Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":null},{"id":468,"user_id":16,"workplace_id":2,"qr_code_id":2,"type":"clock_in","scan_time":"2025-12-31T09:36:00.000Z","date":"2025-12-31","check_in_time":"09:36:00","check_out_time":null,"latitude":"40.71232927","longitude":"-74.00637029","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":15,"approved_at":"2025-12-31T09:36:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:38.289Z","updated_at":"2026-01-03T15:21:38.289Z","workplace":{"id":2,"name":"Main Office - New York","address":"123 Tech Street, New York, NY 10001"},"qrCode":{"id":2,"company_name":"TechCorp Solutions","department":"Operations"},"approver":{"id":15,"full_name":"David Director","email":"david.director@techcorp.com"}},{"id":441,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_out","scan_time":"2025-12-30T17:01:00.000Z","date":"2025-12-30","check_in_time":null,"check_out_time":"17:01:00","latitude":"41.87770314","longitude":"-87.62970319","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":11,"approved_at":"2025-12-30T17:01:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:36.278Z","updated_at":"2026-01-03T15:21:36.278Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":440,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_in","scan_time":"2025-12-30T09:33:00.000Z","date":"2025-12-30","check_in_time":"09:33:00","check_out_time":null,"latitude":"41.87790616","longitude":"-87.62951924","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":11,"approved_at":"2025-12-30T09:33:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:36.177Z","updated_at":"2026-01-03T15:21:36.177Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":11,"full_name":"John Admin","email":"admin@techcorp.com"}},{"id":417,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_out","scan_time":"2025-12-29T18:52:00.000Z","date":"2025-12-29","check_in_time":null,"check_out_time":"18:52:00","latitude":"41.87838217","longitude":"-87.62976916","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":12,"approved_at":"2025-12-29T18:52:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:34.576Z","updated_at":"2026-01-03T15:21:34.576Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":12,"full_name":"Sarah Administrator","email":"sarah.admin@techcorp.com"}},{"id":416,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_in","scan_time":"2025-12-29T09:25:00.000Z","date":"2025-12-29","check_in_time":"09:25:00","check_out_time":null,"latitude":"41.87843070","longitude":"-87.63022093","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":12,"approved_at":"2025-12-29T09:25:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:34.477Z","updated_at":"2026-01-03T15:21:34.477Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":12,"full_name":"Sarah Administrator","email":"sarah.admin@techcorp.com"}},{"id":391,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_out","scan_time":"2025-12-26T18:06:00.000Z","date":"2025-12-26","check_in_time":null,"check_out_time":"18:06:00","latitude":"41.87796850","longitude":"-87.62998167","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":14,"approved_at":null,"notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:32.776Z","updated_at":"2026-01-03T15:21:32.776Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":14,"full_name":"Lisa Lead","email":"lisa.lead@techcorp.com"}},{"id":390,"user_id":16,"workplace_id":4,"qr_code_id":4,"type":"clock_in","scan_time":"2025-12-26T09:04:00.000Z","date":"2025-12-26","check_in_time":"09:04:00","check_out_time":null,"latitude":"41.87828408","longitude":"-87.62978999","is_valid":true,"validation_message":null,"is_manual":false,"manual_reason":null,"status":"approved","approved_by":14,"approved_at":"2025-12-26T09:04:00.000Z","notes":null,"is_offline":false,"synced_at":null,"created_at":"2026-01-03T15:21:32.676Z","updated_at":"2026-01-03T15:21:32.676Z","workplace":{"id":4,"name":"Remote Workspace - Chicago","address":"789 Business Blvd, Chicago, IL 60601"},"qrCode":{"id":4,"company_name":"TechCorp Solutions","department":"General"},"approver":{"id":14,"full_name":"Lisa Lead","email":"lisa.lead@techcorp.com"}}]
/// pagination : {"total":54,"page":1,"limit":20,"pages":3}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<AttendanceRecords>? records,
      Pagination? pagination,}){
    _records = records;
    _pagination = pagination;
}

  Data.fromJson(dynamic json) {
    if (json['records'] != null) {
      _records = [];
      json['records'].forEach((v) {
        _records?.add(AttendanceRecords.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<AttendanceRecords>? _records;
  Pagination? _pagination;
Data copyWith({  List<AttendanceRecords>? records,
  Pagination? pagination,
}) => Data(  records: records ?? _records,
  pagination: pagination ?? _pagination,
);
  List<AttendanceRecords>? get records => _records;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_records != null) {
      map['records'] = _records?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}

/// total : 54
/// page : 1
/// limit : 20
/// pages : 3

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

/// id : 551
/// user_id : 16
/// workplace_id : 6
/// qr_code_id : null
/// type : "clock_in"
/// scan_time : null
/// date : "2026-01-16"
/// check_in_time : "13:09:00"
/// check_out_time : "14:11:00"
/// latitude : "30.75675676"
/// longitude : "73.34300615"
/// is_valid : false
/// validation_message : "Manual entry - pending approval"
/// is_manual : true
/// manual_reason : "very very ill. please approve"
/// status : "approved"
/// approved_by : 12
/// approved_at : "2026-01-07T15:51:37.998Z"
/// notes : null
/// is_offline : false
/// synced_at : "2026-01-07T15:50:00.029Z"
/// created_at : "2026-01-07T15:50:00.052Z"
/// updated_at : "2026-01-07T15:51:37.999Z"
/// workplace : {"id":6,"name":"Sales Office - Miami","address":"654 Commerce Way, Miami, FL 33101"}
/// qrCode : null
/// approver : {"id":12,"full_name":"Sarah Administrator","email":"sarah.admin@techcorp.com"}

AttendanceRecords recordsFromJson(String str) => AttendanceRecords.fromJson(json.decode(str));
String recordsToJson(AttendanceRecords data) => json.encode(data.toJson());
class AttendanceRecords {
  AttendanceRecords({
      num? id, 
      num? userId, 
      num? workplaceId, 
      dynamic qrCodeId, 
      String? type, 
      dynamic scanTime, 
      String? date, 
      String? checkInTime, 
      String? checkOutTime, 
      String? latitude, 
      String? longitude, 
      bool? isValid, 
      String? validationMessage, 
      bool? isManual, 
      String? manualReason, 
      String? status, 
      num? approvedBy, 
      String? approvedAt, 
      dynamic notes, 
      bool? isOffline, 
      String? syncedAt, 
      String? createdAt, 
      String? updatedAt, 
      Workplace? workplace, 
      dynamic qrCode, 
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

  AttendanceRecords.fromJson(dynamic json) {
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
    _qrCode = json['qrCode'];
    _approver = json['approver'] != null ? Approver.fromJson(json['approver']) : null;
  }
  num? _id;
  num? _userId;
  num? _workplaceId;
  dynamic _qrCodeId;
  String? _type;
  dynamic _scanTime;
  String? _date;
  String? _checkInTime;
  String? _checkOutTime;
  String? _latitude;
  String? _longitude;
  bool? _isValid;
  String? _validationMessage;
  bool? _isManual;
  String? _manualReason;
  String? _status;
  num? _approvedBy;
  String? _approvedAt;
  dynamic _notes;
  bool? _isOffline;
  String? _syncedAt;
  String? _createdAt;
  String? _updatedAt;
  Workplace? _workplace;
  dynamic _qrCode;
  Approver? _approver;
AttendanceRecords copyWith({  num? id,
  num? userId,
  num? workplaceId,
  dynamic qrCodeId,
  String? type,
  dynamic scanTime,
  String? date,
  String? checkInTime,
  String? checkOutTime,
  String? latitude,
  String? longitude,
  bool? isValid,
  String? validationMessage,
  bool? isManual,
  String? manualReason,
  String? status,
  num? approvedBy,
  String? approvedAt,
  dynamic notes,
  bool? isOffline,
  String? syncedAt,
  String? createdAt,
  String? updatedAt,
  Workplace? workplace,
  dynamic qrCode,
  Approver? approver,
}) => AttendanceRecords(  id: id ?? _id,
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
  dynamic get qrCodeId => _qrCodeId;
  String? get type => _type;
  dynamic get scanTime => _scanTime;
  String? get date => _date;
  String? get checkInTime => _checkInTime;
  String? get checkOutTime => _checkOutTime;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  bool? get isValid => _isValid;
  String? get validationMessage => _validationMessage;
  bool? get isManual => _isManual;
  String? get manualReason => _manualReason;
  String? get status => _status;
  num? get approvedBy => _approvedBy;
  String? get approvedAt => _approvedAt;
  dynamic get notes => _notes;
  bool? get isOffline => _isOffline;
  String? get syncedAt => _syncedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Workplace? get workplace => _workplace;
  dynamic get qrCode => _qrCode;
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
    map['qrCode'] = _qrCode;
    if (_approver != null) {
      map['approver'] = _approver?.toJson();
    }
    return map;
  }

}

/// id : 12
/// full_name : "Sarah Administrator"
/// email : "sarah.admin@techcorp.com"

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

/// id : 6
/// name : "Sales Office - Miami"
/// address : "654 Commerce Way, Miami, FL 33101"

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