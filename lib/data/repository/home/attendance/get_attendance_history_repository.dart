import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';
import '../../../model/home/attendance/AttendanceFilterModel.dart';
import '../../../model/home/attendance/GetAttendanceHistoryModel.dart';

class GetAttendanceHistoryRepository {
  final _api = NetworkApiServices();

  // NORMAL HISTORY
  Future<GetAttendanceHistoryModel> getAttendanceHistoryApi({
    required Map<String, String> headers,
    int page = 1,
    int limit = 20,
  }) async {
    final url =
        '${AppUrl.getAttendanceHistoryApi}?page=$page&limit=$limit';

    final response = await _api.getApi(url, headers: headers);

    return GetAttendanceHistoryModel.fromJson(response);
  }

  // 🔥 FILTERED HISTORY
  Future<AttendanceFilterModel> getFilteredAttendanceApi({
    required Map<String, String> headers,
    required String startDate,
    required String endDate,
    int limit = 20,
  }) async {
    final url =
        '${AppUrl.getAttendanceHistoryApi}?limit=$limit&start_date=$startDate&end_date=$endDate';

    final response = await _api.getApi(url, headers: headers);

    return AttendanceFilterModel.fromJson(response);
  }
}
