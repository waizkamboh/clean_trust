

import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class ChangePasswordRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> changePasswordApi(Map<String, String>? headers,var data) async{
    //print(AppUrl.loginApi);
    dynamic response = await _apiService.postApi(data, AppUrl.changePasswordApi, headers: headers);
    return response;
  }
}