class GetMonthlyAttendanceModel {
  bool? success;
  String? message;
  Data? data;

  GetMonthlyAttendanceModel({this.success, this.message, this.data});

  GetMonthlyAttendanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  String? month;
  String? totalHours;
  TotalHoursBreakdown? totalHoursBreakdown;
  String? totalOvertime;
  TotalHoursBreakdown? totalOvertimeBreakdown;
  int? presentDays;
  int? totalDays;
  int? averageHoursPerDay;
  List<DailyBreakdown>? dailyBreakdown;

  Data({
    this.month,
    this.totalHours,
    this.totalHoursBreakdown,
    this.totalOvertime,
    this.totalOvertimeBreakdown,
    this.presentDays,
    this.totalDays,
    this.averageHoursPerDay,
    this.dailyBreakdown,
  });

  Data.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    totalHours = json['total_hours'];
    totalHoursBreakdown = json['total_hours_breakdown'] != null
        ? TotalHoursBreakdown.fromJson(json['total_hours_breakdown'])
        : null;
    totalOvertime = json['total_overtime'];
    totalOvertimeBreakdown = json['total_overtime_breakdown'] != null
        ? TotalHoursBreakdown.fromJson(json['total_overtime_breakdown'])
        : null;
    presentDays = json['present_days'];
    totalDays = json['total_days'];
    averageHoursPerDay = json['average_hours_per_day'];

    if (json['daily_breakdown'] != null) {
      dailyBreakdown = (json['daily_breakdown'] as List)
          .map((e) => DailyBreakdown.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'total_hours': totalHours,
      'total_hours_breakdown': totalHoursBreakdown?.toJson(),
      'total_overtime': totalOvertime,
      'total_overtime_breakdown': totalOvertimeBreakdown?.toJson(),
      'present_days': presentDays,
      'total_days': totalDays,
      'average_hours_per_day': averageHoursPerDay,
      'daily_breakdown': dailyBreakdown?.map((e) => e.toJson()).toList(),
    };
  }
}

class TotalHoursBreakdown {
  int? hours;
  int? minutes;
  int? seconds;
  int? totalSeconds;

  TotalHoursBreakdown({
    this.hours,
    this.minutes,
    this.seconds,
    this.totalSeconds,
  });

  TotalHoursBreakdown.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    totalSeconds = json['total_seconds'];
  }

  Map<String, dynamic> toJson() {
    return {
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds,
      'total_seconds': totalSeconds,
    };
  }
}

class DailyBreakdown {
  String? date;
  String? totalHours;

  DailyBreakdown({this.date, this.totalHours});

  DailyBreakdown.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalHours = json['total_hours'];
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'total_hours': totalHours,
    };
  }
}
