


import 'package:clean_trust/data/model/home/attendance/GetTodayAttendanceHistoryModel.dart';
import 'package:clean_trust/data/model/notification/GetAllNotificationModel.dart';

import '../../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';


class GetAllNotificationRepository{
  final _api = NetworkApiServices();

  Future<GetAllNotificationModel> getAllNotificationApi(Map<String, String>? headers)async{
    final response = await _api.getApi(AppUrl.getAllNotificationApi, headers: headers);

    return GetAllNotificationModel.fromJson(response);

  }
}