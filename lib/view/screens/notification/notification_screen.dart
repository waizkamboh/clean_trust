import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view_model/controller/notification/mark_all_notification_read_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../helper/internet_check.dart';
import '../../../util/app_images.dart';
import '../../../util/text_style.dart';
import '../../../view_model/controller/notification/get_unread_count_controller.dart';
import '../../../view_model/controller/notification/mark_notification_read_controller.dart';
import '../../../view_model/controller/notification/get_notification_controller.dart';
import '../../../view_model/controller/profile/app_setting/get_app_setting_controller.dart';



class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GetNotificationController controller =
  Get.find<GetNotificationController>();

  final MarkNotificationReadController markReadController =
  Get.find<MarkNotificationReadController>();

  final MarkAllNotificationReadController markAllReadController =
  Get.find<MarkAllNotificationReadController>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final online = await isOnline();
    if (!online) return;

    controller.fetchNotifications(isInitial: true);
    Get.find<UnreadCountController>().fetchUnreadCount();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          Column(
            children: [
              Obx(() {
                final allowNotifications =
                    Get.find<AppSettingController>().allowNotifications.value;

                return TopHeader(
                  title: 'notificationsScreen1'.tr,
                  actions: allowNotifications
                      ? [
                    PopupMenuButton<int>(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onSelected: (value) {
                        if (value == 1 &&
                            !markAllReadController.isLoading.value) {
                          markAllReadController.markAllAsRead();
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: 1,
                          child: Text('Mark all as read'),
                        ),
                      ],
                    ),
                  ]
                      : [],
                );
              }),

              SizedBox(height: getHeight(20)),

              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: SpinKitSpinningLines(
                        color: AppColors.kSkyBlueColor,
                      ),
                    );
                  }

                  if (!Get.find<AppSettingController>().allowNotifications.value) {
                    return Center(
                      child: Text(
                        'Notifications are disabled. You can enable it anytime from settings.',
                        textAlign: TextAlign.center,
                        style:
                        kSize16W400KWhiteColorOutfitRegular
                            .copyWith(
                          color: AppColors.kCoolGreyColor,
                        ),
                      ),
                    );
                  }

                  if (controller.notifications.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: controller.refreshNotifications,
                      color: AppColors.kSkyBlueColor,
                      backgroundColor: AppColors.kWhiteColor,
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.3),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(20)),
                            child: Center(
                              child: Text(
                                'No notifications found',
                                textAlign: TextAlign.center,
                                style:
                                kSize16W400KWhiteColorOutfitRegular
                                    .copyWith(
                                  color: AppColors.kCoolGreyColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: controller.refreshNotifications,
                    color: AppColors.kSkyBlueColor,
                    backgroundColor: AppColors.kWhiteColor,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                            !controller.isPaginationLoading.value) {
                          controller.fetchNotifications();
                        }
                        return false;
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(20)),
                        itemCount: controller.notifications.length +
                            (controller.isPaginationLoading.value ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index ==
                              controller.notifications.length) {
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                  child: CircularProgressIndicator()),
                            );
                          }

                          final notification =
                          controller.notifications[index];

                          return InkWell(
                            onTap: () async {
                              if (notification.isRead == false &&
                                  !markReadController.isLoading.value) {
                                await markReadController.markAsRead(
                                  notificationId:
                                  notification.id!.toInt(),
                                );
                              }
                            },
                            child: buildNotificationCard(
                              iconPath: AppImages.appSettingIcon,
                              title: notification.title ?? '',
                              message: notification.message ?? '',
                              time:
                              formatDate(notification.createdAt),
                              isUnread:
                              notification.isRead == false,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),

          Obx(() {
            if (!markReadController.isLoading.value &&
                !markAllReadController.isLoading.value) {
              return const SizedBox();
            }

            return Container(
              color: Colors.black.withOpacity(0.35),
              child: const Center(
                child: SpinKitCircle(
                  color: Colors.white,
                  size: 55,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildNotificationCard({
    required String iconPath,
    required String title,
    required String message,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: getHeight(12)),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(16),
        vertical: getHeight(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        border: Border.all(color: AppColors.kLightCoolGreyColor),
      ),
      child: Row(
        children: [
          Container(
            width: getWidth(40),
            height: getHeight(40),
            decoration: BoxDecoration(
              color: AppColors.kIceBlueColor,
              shape: BoxShape.circle,
              border:
              Border.all(color: AppColors.kLightCoolGreyColor),
            ),
            child: Image.asset(
              iconPath,
              color: AppColors.kSkyBlueColor,
            ),
          ),
          SizedBox(width: getWidth(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                    kSize14W500kForestGreenColorInterMedium
                        .copyWith(
                      color: AppColors.kMidnightBlueColor,
                    )),
                Text(message,
                    style:
                    kSize17W400KCharcoalBlackColorInterRegular
                        .copyWith(
                      fontSize: getFont(14),
                      color: AppColors.kCoolGreyColor,
                    )),
                Text(time,
                    style:
                    kSize17W400KCharcoalBlackColorInterRegular
                        .copyWith(
                      fontSize: getFont(12),
                      color: AppColors.kMediumGrey,
                    )),
              ],
            ),
          ),
          if (isUnread)
            Container(
              width: getWidth(8),
              height: getHeight(8),
              decoration: const BoxDecoration(
                color: AppColors.kSkyBlueColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  String formatDate(String? date) {
    if (date == null) return '';
    return date.split('T').first;
  }
}

