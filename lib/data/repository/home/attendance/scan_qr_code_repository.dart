


import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';

class ScanQrCodeRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> scanQRCodeApi(Map<String, String>? headers,var data) async{
    //print(AppUrl.loginApi);
    dynamic response = await _apiService.postApi(data, AppUrl.scanQRCodeApi, headers: headers);
    return response;
  }
}