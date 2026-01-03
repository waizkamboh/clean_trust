/// success : true
/// message : "Monthly hours retrieved successfully"
/// data : {"month":"2025-12","total_hours":"00:00:00","total_hours_breakdown":{"hours":0,"minutes":0,"seconds":0,"total_seconds":0},"total_overtime":"00:00:00","total_overtime_breakdown":{"hours":0,"minutes":0,"seconds":0,"total_seconds":0},"present_days":0,"total_days":0,"average_hours_per_day":0,"daily_breakdown":[]}

class GetMonthlyAttendanceModel {
  GetMonthlyAttendanceModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetMonthlyAttendanceModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetMonthlyAttendanceModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetMonthlyAttendanceModel(  success: success ?? _success,
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

/// month : "2025-12"
/// total_hours : "00:00:00"
/// total_hours_breakdown : {"hours":0,"minutes":0,"seconds":0,"total_seconds":0}
/// total_overtime : "00:00:00"
/// total_overtime_breakdown : {"hours":0,"minutes":0,"seconds":0,"total_seconds":0}
/// present_days : 0
/// total_days : 0
/// average_hours_per_day : 0
/// daily_breakdown : []

class Data {
  Data({
      String? month, 
      String? totalHours, 
      TotalHoursBreakdown? totalHoursBreakdown, 
      String? totalOvertime, 
      TotalOvertimeBreakdown? totalOvertimeBreakdown, 
      num? presentDays, 
      num? totalDays, 
      num? averageHoursPerDay, 
      List<dynamic>? dailyBreakdown,}){
    _month = month;
    _totalHours = totalHours;
    _totalHoursBreakdown = totalHoursBreakdown;
    _totalOvertime = totalOvertime;
    _totalOvertimeBreakdown = totalOvertimeBreakdown;
    _presentDays = presentDays;
    _totalDays = totalDays;
    _averageHoursPerDay = averageHoursPerDay;
    _dailyBreakdown = dailyBreakdown;
}

  Data.fromJson(dynamic json) {
    _month = json['month'];
    _totalHours = json['total_hours'];
    _totalHoursBreakdown = json['total_hours_breakdown'] != null ? TotalHoursBreakdown.fromJson(json['total_hours_breakdown']) : null;
    _totalOvertime = json['total_overtime'];
    _totalOvertimeBreakdown = json['total_overtime_breakdown'] != null ? TotalOvertimeBreakdown.fromJson(json['total_overtime_breakdown']) : null;
    _presentDays = json['present_days'];
    _totalDays = json['total_days'];
    _averageHoursPerDay = json['average_hours_per_day'];
    if (json['daily_breakdown'] != null) {
      _dailyBreakdown = [];
      json['daily_breakdown'].forEach((v) {
        _dailyBreakdown?.add(Dynamic.fromJson(v));
      });
    }
  }
  String? _month;
  String? _totalHours;
  TotalHoursBreakdown? _totalHoursBreakdown;
  String? _totalOvertime;
  TotalOvertimeBreakdown? _totalOvertimeBreakdown;
  num? _presentDays;
  num? _totalDays;
  num? _averageHoursPerDay;
  List<dynamic>? _dailyBreakdown;
Data copyWith({  String? month,
  String? totalHours,
  TotalHoursBreakdown? totalHoursBreakdown,
  String? totalOvertime,
  TotalOvertimeBreakdown? totalOvertimeBreakdown,
  num? presentDays,
  num? totalDays,
  num? averageHoursPerDay,
  List<dynamic>? dailyBreakdown,
}) => Data(  month: month ?? _month,
  totalHours: totalHours ?? _totalHours,
  totalHoursBreakdown: totalHoursBreakdown ?? _totalHoursBreakdown,
  totalOvertime: totalOvertime ?? _totalOvertime,
  totalOvertimeBreakdown: totalOvertimeBreakdown ?? _totalOvertimeBreakdown,
  presentDays: presentDays ?? _presentDays,
  totalDays: totalDays ?? _totalDays,
  averageHoursPerDay: averageHoursPerDay ?? _averageHoursPerDay,
  dailyBreakdown: dailyBreakdown ?? _dailyBreakdown,
);
  String? get month => _month;
  String? get totalHours => _totalHours;
  TotalHoursBreakdown? get totalHoursBreakdown => _totalHoursBreakdown;
  String? get totalOvertime => _totalOvertime;
  TotalOvertimeBreakdown? get totalOvertimeBreakdown => _totalOvertimeBreakdown;
  num? get presentDays => _presentDays;
  num? get totalDays => _totalDays;
  num? get averageHoursPerDay => _averageHoursPerDay;
  List<dynamic>? get dailyBreakdown => _dailyBreakdown;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = _month;
    map['total_hours'] = _totalHours;
    if (_totalHoursBreakdown != null) {
      map['total_hours_breakdown'] = _totalHoursBreakdown?.toJson();
    }
    map['total_overtime'] = _totalOvertime;
    if (_totalOvertimeBreakdown != null) {
      map['total_overtime_breakdown'] = _totalOvertimeBreakdown?.toJson();
    }
    map['present_days'] = _presentDays;
    map['total_days'] = _totalDays;
    map['average_hours_per_day'] = _averageHoursPerDay;
    if (_dailyBreakdown != null) {
      map['daily_breakdown'] = _dailyBreakdown?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// hours : 0
/// minutes : 0
/// seconds : 0
/// total_seconds : 0

class TotalOvertimeBreakdown {
  TotalOvertimeBreakdown({
      num? hours, 
      num? minutes, 
      num? seconds, 
      num? totalSeconds,}){
    _hours = hours;
    _minutes = minutes;
    _seconds = seconds;
    _totalSeconds = totalSeconds;
}

  TotalOvertimeBreakdown.fromJson(dynamic json) {
    _hours = json['hours'];
    _minutes = json['minutes'];
    _seconds = json['seconds'];
    _totalSeconds = json['total_seconds'];
  }
  num? _hours;
  num? _minutes;
  num? _seconds;
  num? _totalSeconds;
TotalOvertimeBreakdown copyWith({  num? hours,
  num? minutes,
  num? seconds,
  num? totalSeconds,
}) => TotalOvertimeBreakdown(  hours: hours ?? _hours,
  minutes: minutes ?? _minutes,
  seconds: seconds ?? _seconds,
  totalSeconds: totalSeconds ?? _totalSeconds,
);
  num? get hours => _hours;
  num? get minutes => _minutes;
  num? get seconds => _seconds;
  num? get totalSeconds => _totalSeconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hours'] = _hours;
    map['minutes'] = _minutes;
    map['seconds'] = _seconds;
    map['total_seconds'] = _totalSeconds;
    return map;
  }

}

/// hours : 0
/// minutes : 0
/// seconds : 0
/// total_seconds : 0

class TotalHoursBreakdown {
  TotalHoursBreakdown({
      num? hours, 
      num? minutes, 
      num? seconds, 
      num? totalSeconds,}){
    _hours = hours;
    _minutes = minutes;
    _seconds = seconds;
    _totalSeconds = totalSeconds;
}

  TotalHoursBreakdown.fromJson(dynamic json) {
    _hours = json['hours'];
    _minutes = json['minutes'];
    _seconds = json['seconds'];
    _totalSeconds = json['total_seconds'];
  }
  num? _hours;
  num? _minutes;
  num? _seconds;
  num? _totalSeconds;
TotalHoursBreakdown copyWith({  num? hours,
  num? minutes,
  num? seconds,
  num? totalSeconds,
}) => TotalHoursBreakdown(  hours: hours ?? _hours,
  minutes: minutes ?? _minutes,
  seconds: seconds ?? _seconds,
  totalSeconds: totalSeconds ?? _totalSeconds,
);
  num? get hours => _hours;
  num? get minutes => _minutes;
  num? get seconds => _seconds;
  num? get totalSeconds => _totalSeconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hours'] = _hours;
    map['minutes'] = _minutes;
    map['seconds'] = _seconds;
    map['total_seconds'] = _totalSeconds;
    return map;
  }

}