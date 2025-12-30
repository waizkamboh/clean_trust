

import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class SignupRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> signUpApi(Map<String, String>? headers,var data) async{
    //print(AppUrl.loginApi);
    dynamic response = await _apiService.postApi(data, AppUrl.signUpApi, headers: headers);
    return response;
  }
}