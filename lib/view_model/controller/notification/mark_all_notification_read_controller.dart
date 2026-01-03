import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/model/notification/MarkAllNotificationAsReadModel.dart';
import '../../../../data/repository/notification/mark_all_notification_read_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';
import 'get_unread_count_controller.dart';
import 'notification_controller.dart';

class MarkAllNotificationReadController extends GetxController {
  final MarkAllNotificationReadRepository _repo =
  MarkAllNotificationReadRepository();

  final UserPreference _userPreference = UserPreference();

  RxBool isLoading = false.obs;

  /// 🔹 Mark ALL notifications as read
  Future<void> markAllAsRead() async {
    try {
      isLoading.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final MarkAllNotificationAsReadModel response =
      await _repo.markAllNotificationReadApi({}, headers);

      if (response.success != true) {
        showCustomSnackBar(response.message ?? 'Failed to mark all as read');
        return;
      }

      /// 🔹 Update notification list locally
      final notificationController = Get.find<NotificationController>();
      notificationController.notifications.value =
          notificationController.notifications
              .map((n) => n.copyWith(isRead: true))
              .toList();

      /// 🔹 Reset unread badge
      Get.find<UnreadCountController>().unreadCount.value = 0;

      showCustomSnackBar(response.message ?? 'All notifications marked as read');
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
