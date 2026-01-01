


import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';

class ManualAttendanceEntryRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> manualAttendanceApi(Map<String, String>? headers,var data) async{
    //print(AppUrl.loginApi);
    dynamic response = await _apiService.postApi(data, AppUrl.manualAttendanceEntryApi, headers: headers);
    return response;
  }
}