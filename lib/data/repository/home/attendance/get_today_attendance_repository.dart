


import 'package:clean_trust/data/model/home/attendance/GetTodayAttendanceHistoryModel.dart';

import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';


class GetTodayAttendanceRepository{
  final _api = NetworkApiServices();

  Future<GetTodayAttendanceHistoryModel> getTodayAttendanceApi(Map<String, String>? headers)async{
    final response = await _api.getApi(AppUrl.getTodayAttendanceApi, headers: headers);

    return GetTodayAttendanceHistoryModel.fromJson(response);

  }
}