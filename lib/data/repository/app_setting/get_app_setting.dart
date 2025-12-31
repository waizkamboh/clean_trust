


import 'package:clean_trust/data/model/app_setting/GetAppSettingModel.dart';

import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class GetAppSettingRepository{
  final _api = NetworkApiServices();

  Future<GetAppSettingModel> getAppSettingApi(Map<String, String>? headers)async{
    final response = await _api.getApi(AppUrl.getAppSettingApi, headers: headers);

    return GetAppSettingModel.fromJson(response);

  }
}