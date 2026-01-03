import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';

class AttendanceSyncRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> syncOfflineAttendance(
      Map<String, String>? headers,
      dynamic data,
      ) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.syncOfflineAttendance,
      headers: headers,
    );
    return response;
  }
}
