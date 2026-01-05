

import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class ConfirmPasswordRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> resetPasswordApi(var data) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.resetPasswordApi,
    );
    return response;
  }

}