import 'package:clean_trust/data/model/employee/GetEmployee.dart';
import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class GetEmployeeRepository {
  final _api = NetworkApiServices();

  Future<GetEmployee> getEmployeeByIdApi(Map<String, String>? headers,) async {
    // Use PUT since backend requires it
    final response = await _api.getApi(AppUrl.getEmployee, headers: headers);

    return GetEmployee.fromJson(response);
  }
}
