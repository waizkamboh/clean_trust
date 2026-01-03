import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/app_images.dart';
import '../../../util/text_style.dart';
import '../../../view_model/controller/notification/get_unread_count_controller.dart';
import '../../../view_model/controller/notification/mark_notification_read_controller.dart';
import '../../../view_model/controller/notification/notification_controller.dart';



class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchNotifications(isInitial: true);
    Get.find<UnreadCountController>().fetchUnreadCount();

  }
  final NotificationController controller = Get.put(NotificationController());

  final markReadController = Get.put(MarkNotificationReadController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'notificationsScreen1'.tr),
          SizedBox(height: getHeight(20),),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.notifications.isEmpty) {
                return RefreshIndicator(
                  onRefresh: controller.refreshNotifications,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: 200),
                      Center(child: Text('No notifications found')),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                color: AppColors.kSkyBlueColor,
                backgroundColor: AppColors.kWhiteColor,
                onRefresh: controller.refreshNotifications,
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
                    padding:
                    EdgeInsets.symmetric(horizontal: getWidth(20)),
                    itemCount: controller.notifications.length +
                        (controller.isPaginationLoading.value ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index ==
                          controller.notifications.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final notification =
                      controller.notifications[index];

                      return  InkWell(
                        onTap: () {
                          if (notification.isRead == false) {
                            markReadController.markAsRead(
                              notificationId: notification.id!.toInt(),
                            );
                          }

                          // navigation if needed later
                        },
                        child: buildNotificationCard(
                          iconPath: AppImages.bellIcon,
                          title: notification.title ?? '',
                          message: notification.message ?? '',
                          time: formatDate(notification.createdAt),
                          isUnread: notification.isRead == false,
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
    );
  }

  /// 🔹 Notification Card UI
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
        border: Border.all(
          color: AppColors.kLightCoolGreyColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: getWidth(40),
            height: getHeight(40),
            decoration: BoxDecoration(
              color: isUnread
                  ? AppColors.kAliceBlue   // 🔵 Unread
                  : AppColors.kWhiteColor, // ⚪ Read
              border: Border.all(
                color: AppColors.kLightCoolGreyColor,

              ),
              shape: BoxShape.circle
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
                Text(
                  title,
                  style:
                  kSize16W600KBlackColorOutfitSemiBold.copyWith(
                    fontSize: getFont(14),
                  ),
                ),
                Text(
                  message,
                  style:
                  kSize16W400KWhiteColorOutfitRegular.copyWith(
                    fontSize: getFont(13),
                    color: AppColors.kCoolGreyColor,
                  ),
                ),
                Text(
                  time,
                  style:
                  kSize16W400KWhiteColorOutfitRegular.copyWith(
                    fontSize: getFont(12),
                    color:
                    AppColors.kCoolGreyColor.withOpacity(0.7),
                  ),
                ),
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

  /// 🔹 Date Formatter
  String formatDate(String? date) {
    if (date == null) return '';
    return date.split('T').first;
  }
}


// import 'package:clean_trust/util/app_colors.dart';
// import 'package:clean_trust/util/size_config.dart';
// import 'package:clean_trust/view/base/top_header.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../util/app_images.dart';
// import '../../../util/text_style.dart';
//
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: AppColors.kWhiteColor,
//       body: Column(
//         children: [
//           TopHeader(title: 'notificationsScreen1'.tr),
//           Expanded(
//             child: Padding(
//               padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
//               child: ListView(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(4, (index) {
//                       return ProfileOptionTile(
//                         title: 'notificationsScreen${index + 2}'.tr,
//                         isSelected: selectedIndex == index,
//                         onTap: () {
//                           setState(() {
//                             selectedIndex = index;
//                           });
//                         },
//                       );
//                     }),
//                   ),
//                   SizedBox(height: getHeight(30),),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen6',
//                       secondText: 'notificationsScreen7',
//                       thirdText: 'notificationsScreen8'
//                   ),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen9',
//                       secondText: 'notificationsScreen10',
//                       thirdText: 'notificationsScreen11'
//                   ),buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen6',
//                       secondText: 'notificationsScreen7',
//                       thirdText: 'notificationsScreen8'
//                   ),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen9',
//                       secondText: 'notificationsScreen10',
//                       thirdText: 'notificationsScreen11'
//                   ),buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen6',
//                       secondText: 'notificationsScreen7',
//                       thirdText: 'notificationsScreen8'
//                   ),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen9',
//                       secondText: 'notificationsScreen10',
//                       thirdText: 'notificationsScreen11'
//                   ),buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen6',
//                       secondText: 'notificationsScreen7',
//                       thirdText: 'notificationsScreen8'
//                   ),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen9',
//                       secondText: 'notificationsScreen10',
//                       thirdText: 'notificationsScreen11'
//                   ),buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen6',
//                       secondText: 'notificationsScreen7',
//                       thirdText: 'notificationsScreen8'
//                   ),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen9',
//                       secondText: 'notificationsScreen10',
//                       thirdText: 'notificationsScreen11'
//                   ),buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen6',
//                       secondText: 'notificationsScreen7',
//                       thirdText: 'notificationsScreen8'
//                   ),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen9',
//                       secondText: 'notificationsScreen10',
//                       thirdText: 'notificationsScreen11'
//                   ),buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen6',
//                       secondText: 'notificationsScreen7',
//                       thirdText: 'notificationsScreen8'
//                   ),
//                   buildNotificationCard(
//                       iconPath: AppImages.bellIcon,
//                       firstText: 'notificationsScreen9',
//                       secondText: 'notificationsScreen10',
//                       thirdText: 'notificationsScreen11'
//                   ),
//
//
//
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildNotificationCard({
//     required String iconPath,
//     required String firstText, // Optional
//     required String secondText, // Optional
//     required String thirdText, // Optional
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
//       // width: getWidth(362),
//       decoration: BoxDecoration(
//           color: AppColors.kWhiteColor,
//           border: BoxBorder.all(color: AppColors.kLightCoolGreyColor, width: 1)
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: getWidth(40),
//             height: getHeight(40),
//             decoration: BoxDecoration(
//               color: AppColors.kIceBlueColor,
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//             ),
//             child: Image.asset(iconPath, color: AppColors.kSkyBlueColor,),
//           ),
//           SizedBox(width: getWidth(12)),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   firstText.tr,
//                   style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                     fontSize: getFont(14),
//                     color: AppColors.kMidnightBlueColor,
//                   ),
//                 ),
//                 Text(
//                   secondText.tr,
//                   style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                     fontSize: getFont(14),
//                     color: AppColors.kCoolGreyColor,
//                   ),
//                 ),
//                 Text(
//                   thirdText.tr,
//                   style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                     fontSize: getFont(12),
//                     color: AppColors.kCoolGreyColor.withOpacity(0.7),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Spacer(),
//           //  Container(
//           //    width: getWidth(8),
//           //    height: getHeight(8),
//           //    decoration: BoxDecoration(
//           //      color: AppColors.kSkyBlueColor,
//           //      shape: BoxShape.circle,
//           //    ),
//           //  ),
//
//         ],
//       ),
//     );
//
//   }
// }
//
// class ProfileOptionTile extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const ProfileOptionTile({
//     super.key,
//     required this.title,
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: getWidth(82),
//         height: getHeight(34),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? AppColors.kSkyBlueColor
//               : AppColors.kLightGrayBackground,
//           borderRadius: BorderRadius.circular(9999),
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//               color: isSelected
//                   ? AppColors.kWhiteColor
//                   : AppColors.kSlateGray,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
