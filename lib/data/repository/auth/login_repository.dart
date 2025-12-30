

import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class LoginRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(Map<String, String>? headers,var data) async{
    //print(AppUrl.loginApi);
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi, headers: headers);
    return response;
  }
}