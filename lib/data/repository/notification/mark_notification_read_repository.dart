import 'package:clean_trust/data/model/notification/MarkNotificationAsReadModel.dart';
import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class MarkNotificationReadRepository {
  final _api = NetworkApiServices();

  Future<MarkNotificationAsReadModel> markNotificationReadApi(
      Map<String, dynamic> body, Map<String, String>? headers, int notificationId,) async {
    // Use PUT since backend requires it
    final response = await _api.updateApi(body, AppUrl.markNotificationReadApi(notificationId), headers: headers);

    return MarkNotificationAsReadModel.fromJson(response);
  }
}
