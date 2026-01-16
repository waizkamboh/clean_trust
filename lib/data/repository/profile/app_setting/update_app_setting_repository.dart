

import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';
import '../../../model/profile/app_setting/UpdateAppSettingModel.dart';

class UpdateAppSettingRepository {
  final _api = NetworkApiServices();

  Future<UpdateAppSettingModel> updateAppSettingApi(
      Map<String, dynamic> body, Map<String, String>? headers) async {
    // Use PUT since backend requires it
    final response =
    await _api.updateApi(body, AppUrl.updateAppSettingApi, headers: headers);

    return UpdateAppSettingModel.fromJson(response);
  }
}
