import 'package:clean_trust/data/model/app_setting/UpdateAppSettingModel.dart';
import 'package:clean_trust/data/model/employee/GetEmployeeByIdModel.dart';
import 'package:clean_trust/data/model/notification/MarkNotificationAsReadModel.dart';
import '../../../util/app_constant.dart';
import '../../api/network/network_api_services.dart';

class GetEmployeeByIdRepository {
  final _api = NetworkApiServices();

  Future<GetEmployeeByIdModel> getEmployeeByIdApi(Map<String, String>? headers, int employeeId,) async {
    // Use PUT since backend requires it
    final response = await _api.getApi(AppUrl.getEmployeeByIdApi(employeeId), headers: headers);

    return GetEmployeeByIdModel.fromJson(response);
  }
}
