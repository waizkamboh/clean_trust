


import '../../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class LeaveRequestRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> leaveRequestApi(Map<String, String>? headers,var data) async{
    //print(AppUrl.loginApi);
    dynamic response = await _apiService.postApi(data, AppUrl.scanQRCodeApi, headers: headers);
    return response;
  }
}