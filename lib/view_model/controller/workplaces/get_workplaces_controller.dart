import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/model/workplaces/GetAllWorkPlacesModel.dart';
import '../../../../data/repository/workplaces/get_workplaces_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';

class GetWorkplacesController extends GetxController {
  final GetWorkplacesRepository _repo = GetWorkplacesRepository();
  final UserPreference _userPreference = UserPreference();

  RxBool isLoading = false.obs;

  RxList<String> workplaceNames = <String>[].obs;

  Map<String, int> workplaceIdMap = {};

  RxString selectedWorkplaceName = ''.obs;
  RxInt selectedWorkplaceId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWorkplaces();
  }

  Future<void> fetchWorkplaces() async {
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final GetAllWorkPlacesModel response =
      await _repo.getWorkplacesApi(headers);

      final workplaces = response.data?.workplaces;

      if (workplaces != null && workplaces.isNotEmpty) {
        workplaceNames.clear();
        workplaceIdMap.clear();

        for (var wp in workplaces) {
          if (wp.name != null && wp.id != null) {
            workplaceNames.add(wp.name!);
            workplaceIdMap[wp.name!] = wp.id!.toInt();
          }
        }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar("Failed to load workplaces");
    } finally {
      isLoading.value = false;
    }
  }

  void onWorkplaceSelected(String? name) {
    if (name == null) return;

    selectedWorkplaceName.value = name;
    selectedWorkplaceId.value = workplaceIdMap[name] ?? 0;

    if (kDebugMode) {
      print('Selected workplace name: $name');
      print('Selected workplace id: ${selectedWorkplaceId.value}');
    }
  }

}
