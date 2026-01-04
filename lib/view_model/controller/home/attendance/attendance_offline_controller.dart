import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../../data/model/hive/offline_attendance_model.dart';
import '../../../../data/model/home/attendance/SyncOfflineAttendanceModel.dart';
import '../../../../data/repository/home/attendance/sync_offline_attendance_repository.dart';
import '../../../../helper/internet_check.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';
import '../../../../util/size_config.dart';
import '../../../../util/text_style.dart';
import '../../../user_preference/user_preference.dart';

class AttendanceOfflineController extends GetxController {
  late Box<OfflineAttendance> box;

  RxList<OfflineAttendance> offlineList = <OfflineAttendance>[].obs;
  final UserPreference _userPreference = UserPreference();
  final AttendanceSyncRepository _syncRepo = AttendanceSyncRepository();

  late int currentUserId;
  RxDouble uploadProgress = 0.0.obs;
  RxBool uploadCompleted = false.obs;




  @override
  void onInit() {
    super.onInit();
    box = Hive.box<OfflineAttendance>('offline_attendance');
    _init();
  }

  Future<void> _init() async {
    currentUserId = await _userPreference.getUserId() ?? 0;
    loadData();

    // Hive DB change listener
    box.watch().listen((event) {
      loadData();
    });

  }

  void loadData() {
    offlineList.value = box.values
        .where((e) => e.synced == false && e.userId == currentUserId)
        .toList()
        .reversed
        .toList();
  }


  int get count => offlineList.length;

  String formatAttendanceTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime);
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (dateOnly == today) {
      return 'Today, ${_formatTime(dateTime)}';
    } else if (dateOnly == yesterday) {
      return 'Yesterday, ${_formatTime(dateTime)}';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}, ${_formatTime(dateTime)}';
    }
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final amPm = dt.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $amPm';
  }
  RxBool syncing = false.obs;

  Future<void> syncOfflineAttendance() async {
    if (offlineList.isEmpty) {
      if (Get.isDialogOpen == true) Get.back();
      return;
    }

    syncing.value = true;
    uploadCompleted.value = false;
    uploadProgress.value = 0.0;

    final total = offlineList.length;
    int uploaded = 0;

    final token = await _userPreference.getToken();
    if (token == null) {
      syncing.value = false;
      if (Get.isDialogOpen == true) Get.back();
      return;
    }

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    for (final item in List<OfflineAttendance>.from(offlineList)) {
      final request = AttendanceSyncRequest(
        records: [
          AttendanceSyncItem(
            qrCode: item.qrCode,
            scanTime: item.scanTime,
            latitude: item.latitude,
            longitude: item.longitude,
          ),
        ],
      );

      final response =
      await _syncRepo.syncOfflineAttendance(headers, request.toJson());

      if (response?['success'] == true) {
        await box.delete(item.key);
        offlineList.removeWhere((e) => e.key == item.key);

        uploaded++;
        uploadProgress.value = uploaded / total; // ⭐ progress update
      }
    }

    syncing.value = false;
    uploadCompleted.value = true;

    // // Auto close dialog (optional delay for UX)
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   if (Get.isDialogOpen == true) Get.back();
    // });
  }



}
//
// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import '../../../../data/model/hive/offline_attendance_model.dart';
// import '../../../../data/model/home/attendance/SyncOfflineAttendanceModel.dart';
// import '../../../../data/repository/home/attendance/sync_offline_attendance_repository.dart';
// import '../../../../helper/internet_check.dart';
// import '../../../../util/app_colors.dart';
// import '../../../../util/app_images.dart';
// import '../../../../util/size_config.dart';
// import '../../../../util/text_style.dart';
// import '../../../user_preference/user_preference.dart';
//
// class AttendanceOfflineController extends GetxController {
//   late Box<OfflineAttendance> box;
//
//   RxList<OfflineAttendance> offlineList = <OfflineAttendance>[].obs;
//   final UserPreference _userPreference = UserPreference();
//   final AttendanceSyncRepository _syncRepo = AttendanceSyncRepository();
//
//   late int currentUserId;
//   RxBool isOnlineRx = false.obs;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySub;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     box = Hive.box<OfflineAttendance>('offline_attendance');
//     _init();
//   }
//
//   Future<void> _init() async {
//     currentUserId = await _userPreference.getUserId() ?? 0;
//     loadData();
//
//     // Hive DB change listener
//     box.watch().listen((event) {
//       loadData();
//     });
//
//     // Initial internet check
//     isOnlineRx.value = await isOnline();
//
//     // Connectivity stream
//     _connectivitySub =
//         Connectivity().onConnectivityChanged.listen((results) async {
//           if (results.contains(ConnectivityResult.none)) {
//             isOnlineRx.value = false;
//           } else {
//             isOnlineRx.value = await isOnline();
//           }
//         });
//
//
//
//     // 🔁 Auto sync jab net aaye
//     ever(isOnlineRx, (online) async {
//       if (online == true &&
//           offlineList.isNotEmpty &&
//           !syncing.value) {
//         attendanceAutoSync();
//       }
//     });
//   }
//
//   void loadData() {
//     offlineList.value = box.values
//         .where((e) => e.synced == false && e.userId == currentUserId)
//         .toList()
//         .reversed
//         .toList();
//   }
//   void attendanceAutoSync() {
//     if (offlineList.isEmpty) return;
//
//     // Show Dialog only once
//     if (Get.isDialogOpen != true) {
//       Get.dialog(
//         Dialog(
//           backgroundColor: AppColors.kWhiteColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: SizedBox(
//             width: getWidth(327),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: getWidth(32), vertical: getHeight(34)),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     width: getWidth(64),
//                     height: getHeight(64),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.kSkyBlueColor.withOpacity(0.08),
//                       border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//                     ),
//                     child: Image.asset(AppImages.profileScreenIcon7, color: AppColors.kSkyBlueColor,),
//                   ),
//                   SizedBox(height: getHeight(10)),
//                   Text('backOnline1'.tr,
//                     style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                       color: AppColors.kMidnightBlueColor,
//                       fontSize: getFont(20),
//                     ),
//                   ),
//                   SizedBox(height: getHeight(5)),
//                   Text('backOnline2'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kDarkSlateGray,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: getHeight(5)),
//                   Text('backOnline3'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kCoolGreyColor,
//                       fontSize: getFont(14),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: getHeight(20)),
//                   Text('backOnline4'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kCoolGreyColor,
//                       fontSize: getFont(12),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: getHeight(30)),
//                   Obx(() => syncing.value
//                       ? CircularProgressIndicator()
//                       : SizedBox.shrink()),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         barrierDismissible: false, // Prevent close by tapping outside
//       );
//     }
//
//     // Start syncing
//     syncOfflineAttendance();
//   }
//
//
//   int get count => offlineList.length;
//
//   String formatAttendanceTime(String isoTime) {
//     final dateTime = DateTime.parse(isoTime);
//     final now = DateTime.now();
//
//     final today = DateTime(now.year, now.month, now.day);
//     final yesterday = today.subtract(const Duration(days: 1));
//
//     final dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
//
//     if (dateOnly == today) {
//       return 'Today, ${_formatTime(dateTime)}';
//     } else if (dateOnly == yesterday) {
//       return 'Yesterday, ${_formatTime(dateTime)}';
//     } else {
//       return '${dateTime.day}/${dateTime.month}/${dateTime.year}, ${_formatTime(dateTime)}';
//     }
//   }
//
//   String _formatTime(DateTime dt) {
//     final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
//     final minute = dt.minute.toString().padLeft(2, '0');
//     final amPm = dt.hour >= 12 ? 'PM' : 'AM';
//     return '$hour:$minute $amPm';
//   }
//   RxBool syncing = false.obs;
//
//   Future<void> syncOfflineAttendance() async {
//     if (offlineList.isEmpty) {
//       if (Get.isDialogOpen == true) Get.back();
//       return;
//     }
//
//     syncing.value = true;
//
//     final token = await _userPreference.getToken();
//     if (token == null) {
//       syncing.value = false;
//       if (Get.isDialogOpen == true) Get.back();
//       return;
//     }
//
//     final headers = {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//     };
//
//     // Upload one by one
//     for (final item in List<OfflineAttendance>.from(offlineList)) {
//       final request = AttendanceSyncRequest(
//         records: [
//           AttendanceSyncItem(
//             qrCode: item.qrCode,
//             scanTime: item.scanTime,
//             latitude: item.latitude,
//             longitude: item.longitude,
//           ),
//         ],
//       );
//
//       final response =
//       await _syncRepo.syncOfflineAttendance(headers, request.toJson());
//
//       if (response?['success'] == true) {
//         await box.delete(item.key); // ✅ SAFE
//         offlineList.removeWhere((e) => e.key == item.key);
//       }
//     }
//
//     syncing.value = false;
//
//     // Close Dialog automatically after sync
//     if (Get.isDialogOpen == true) Get.back();
//   }
//
//   @override
//   void onClose() {
//     _connectivitySub.cancel();
//     super.onClose();
//   }
//
// }
