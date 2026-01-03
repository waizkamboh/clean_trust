


import 'package:clean_trust/data/model/app_setting/GetAppSettingModel.dart';
import 'package:clean_trust/data/model/home/attendance/GetMonthlyAttendanceModel.dart';
import 'package:clean_trust/data/model/home/attendance/GetTodayAttendanceHistoryModel.dart';

import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';


class GetMonthlyAttendanceRepository{
  final _api = NetworkApiServices();

  Future<GetMonthlyAttendanceModel> getMonthlyAttendanceApi(Map<String, String>? headers)async{
    final response = await _api.getApi(AppUrl.getMonthlyAttendanceApi, headers: headers);

    return GetMonthlyAttendanceModel.fromJson(response);

  }
}