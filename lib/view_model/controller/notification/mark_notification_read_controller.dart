import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/model/notification/MarkNotificationAsReadModel.dart';
import '../../../../data/repository/notification/mark_notification_read_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';
import 'get_unread_count_controller.dart';
import 'notification_controller.dart';

class MarkNotificationReadController extends GetxController {
  final MarkNotificationReadRepository _repo =
  MarkNotificationReadRepository();

  final UserPreference _userPreference = UserPreference();

  RxBool isLoading = false.obs;

  /// Mark notification as read by ID
  Future<void> markAsRead({
    required int notificationId,
  }) async {
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        'notification_id': notificationId,
      };

      final MarkNotificationAsReadModel response =
      await _repo.markNotificationReadApi(body, headers,notificationId);

      if (response.success != true) {
        showCustomSnackBar(response.message ?? 'Failed to mark as read');
        return;
      }

      /// 🔹 Update notification list locally
      Get.find<NotificationController>()
          .markNotificationReadLocally(notificationId);

      /// 🔹 Update unread badge
      final unreadController = Get.find<UnreadCountController>();
      if (unreadController.unreadCount.value > 0) {
        unreadController.unreadCount.value--;
      }
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
