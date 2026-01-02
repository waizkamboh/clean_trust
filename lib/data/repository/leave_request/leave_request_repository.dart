import 'dart:io';
import '../../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class LeaveRequestRepository {
  final _apiService = NetworkApiServices();

  /// data should contain 'fields' and 'files'
  Future<dynamic> leaveRequestApi(Map<String, String>? headers, Map<String, dynamic> data) async {
    Map<String, String> fields = data['fields'] ?? {};
    List<File> files = List<File>.from(data['files'] ?? []);

    dynamic response = await _apiService.postMultipartApi(AppUrl.leaveRequestApi, fields: fields, files: files, headers: headers,);

    return response;
  }
}
