

import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';
import '../../../model/profile/app_setting/GetAppVersionModel.dart';

class GetAppVersionRepository{
  final _api = NetworkApiServices();

  Future<GetAppVersionModel> getAppVersionApi(Map<String, String>? headers)async{
    final response = await _api.getApi(AppUrl.getAppVersionApi, headers: headers);

    return GetAppVersionModel.fromJson(response);

  }
}