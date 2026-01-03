


import 'package:clean_trust/data/model/home/attendance/GetTodayAttendanceHistoryModel.dart';
import 'package:clean_trust/data/model/notification/GetAllNotificationModel.dart';
import 'package:clean_trust/data/model/notification/GetUnreadCountModel.dart';

import '../../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';


class GetUnreadCountRepository{
  final _api = NetworkApiServices();

  Future<GetUnreadCountModel> getUnreadCountApi(Map<String, String>? headers)async{
    final response = await _api.getApi(AppUrl.getUnreadCountNotificationApi, headers: headers);

    return GetUnreadCountModel.fromJson(response);

  }
}