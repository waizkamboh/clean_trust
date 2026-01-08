import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../data/model/notification/GetAllNotificationModel.dart';
import '../../../../data/repository/notification/get_all_notification_repository.dart';
import '../../../../util/custom_snackbar.dart';
import '../../user_preference/user_preference.dart';

class GetNotificationController extends GetxController {
  final GetAllNotificationRepository _repo =
  GetAllNotificationRepository();
  final UserPreference _userPreference = UserPreference();

  RxBool isLoading = false.obs;
  RxBool isPaginationLoading = false.obs;
  RxList<Notifications> notifications = <Notifications>[].obs;
  RxInt unreadCount = 0.obs;

  int page = 1;
  int totalPages = 1;
  final int limit = 20;

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchNotifications(isInitial: true);
  // }

  Future<void> fetchNotifications({bool isInitial = false}) async {
    try {
      if (isInitial) {
        isLoading.value = true;
        page = 1;
        notifications.clear();
      } else {
        if (page >= totalPages) return;
        isPaginationLoading.value = true;
      }

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await _repo.getAllNotificationApi(headers);

      if (response.success != true) {
        showCustomSnackBar(response.message ?? 'Something went wrong');
        return;
      }

      final data = response.data;

      unreadCount.value = data?.unreadCount?.toInt() ?? 0;

      totalPages = data?.pagination?.pages?.toInt() ?? 1;

      if (data?.notifications != null) {
        notifications.addAll(data!.notifications!);
      }

      page++;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      showCustomSnackBar('Failed to load notifications');
    } finally {
      isLoading.value = false;
      isPaginationLoading.value = false;
    }
  }

  Future<void> refreshNotifications() async {
    page = 1;
    notifications.clear();
    await fetchNotifications(isInitial: true);
  }

  void markNotificationReadLocally(int notificationId) {
    final index =
    notifications.indexWhere((n) => n.id == notificationId);

    if (index != -1) {
      notifications[index] =
          notifications[index].copyWith(isRead: true);
    }
  }


}
