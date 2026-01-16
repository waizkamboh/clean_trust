import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/model/notification/GetUnreadCountModel.dart';
import '../../../../data/repository/notification/get_unread_count_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';

class UnreadCountController extends GetxController {
  final GetUnreadCountRepository _repo = GetUnreadCountRepository();
  final UserPreference _userPreference = UserPreference();

  RxInt unreadCount = 0.obs;
  RxBool isLoading = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchUnreadCount();
  // }

  Future<void> fetchUnreadCount() async {
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final GetUnreadCountModel response =
      await _repo.getUnreadCountApi(headers);

      if (response.success != true) {
        showCustomSnackBar(response.message ?? 'Failed to get unread count');
        return;
      }

      unreadCount.value = response.data?.unreadCount ?? 0;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar('Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }


}
