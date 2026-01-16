import '../../../../util/app_constant.dart';
import '../../../api/network/network_api_services.dart';
import '../../../model/profile/profile/UpdateEmployeeModel.dart';

class UpdateEmployeeRepository {
  final _api = NetworkApiServices();

  Future<UpdateEmployeeModel> updateEmployeeApi(
      Map<String, dynamic> body, Map<String, String>? headers, int employeeId) async {
    // Use PUT since backend requires it
    final response = await _api.updateApi(body, AppUrl.updateEmployeeApi(employeeId), headers: headers, );

    return UpdateEmployeeModel.fromJson(response);
  }
}
