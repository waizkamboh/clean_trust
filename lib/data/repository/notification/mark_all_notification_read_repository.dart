import 'package:clean_trust/data/model/app_setting/UpdateAppSettingModel.dart';
import 'package:clean_trust/data/model/notification/MarkAllNotificationAsReadModel.dart';
import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class MarkAllNotificationReadRepository {
  final _api = NetworkApiServices();

  Future<MarkAllNotificationAsReadModel> markAllNotificationReadApi(
      Map<String, dynamic> body, Map<String, String>? headers) async {
    // Use PUT since backend requires it
    final response =
    await _api.updateApi(body, AppUrl.markAllNotificationReadApi, headers: headers);

    return MarkAllNotificationAsReadModel.fromJson(response);
  }
}
