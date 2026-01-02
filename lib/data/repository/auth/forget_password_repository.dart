

import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class ForgetPasswordRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> forgetPasswordApi(Map<String, String>? headers,var data) async{
    //print(AppUrl.loginApi);
    dynamic response = await _apiService.postApi(data, AppUrl.forgetPasswordApi, headers: headers);
    return response;
  }
}