


import 'package:clean_trust/data/model/app_setting/GetAppSettingModel.dart';
import 'package:clean_trust/data/model/app_setting/GetAppVersionModel.dart';

import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class GetAppVersionRepository{
  final _api = NetworkApiServices();

  Future<GetAppVersionModel> getAppVersionApi(Map<String, String>? headers)async{
    final response = await _api.getApi(AppUrl.getAppVersionApi, headers: headers);

    return GetAppVersionModel.fromJson(response);

  }
}