import 'package:clean_trust/view_model/controller/app_setting/get_app_setting_controller.dart';
import 'package:clean_trust/view_model/controller/auth/change_password_controller.dart';
import 'package:clean_trust/view_model/controller/auth/forget_password_controller.dart';
import 'package:clean_trust/view_model/controller/auth/login_controller.dart';
import 'package:clean_trust/view_model/controller/auth/signup_controller.dart';
import 'package:clean_trust/view_model/controller/employee/editProfileController.dart';
import 'package:clean_trust/view_model/controller/home/attendance/attendance_offline_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/get_attendance_history_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/get_today_and_monthly_attendance_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/manual_attendance_entry_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/scanqrcode_controller.dart';
import 'package:clean_trust/view_model/controller/leave_request/leave_request_controller.dart';
import 'package:clean_trust/view_model/controller/notification/get_unread_count_controller.dart';
import 'package:clean_trust/view_model/controller/notification/mark_all_notification_read_controller.dart';
import 'package:clean_trust/view_model/controller/notification/mark_notification_read_controller.dart';
import 'package:clean_trust/view_model/controller/notification/notification_controller.dart';
import 'package:clean_trust/view_model/controller/workplaces/get_workplaces_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => EditProfileController(), fenix: true);
    Get.lazyPut(() => AttendanceOfflineController(), fenix: true);
    Get.lazyPut(() => GetTodayAndMonthlyAttendanceController(), fenix: true);
    Get.lazyPut(() => GetAttendanceHistoryController(), fenix: true);
    Get.lazyPut(() => ManualAttendanceEntryController(), fenix: true);
    Get.lazyPut(() => ScanQrCodeController(), fenix: true);
    Get.lazyPut(() => AppSettingController(), fenix: true);
    Get.lazyPut(() => LeaveRequestController(), fenix: true);
    Get.lazyPut(() => GetWorkplacesController(), fenix: true);
    Get.lazyPut(() => UnreadCountController(), fenix: true);
    Get.lazyPut(() => MarkAllNotificationReadController(), fenix: true);
    Get.lazyPut(() => MarkNotificationReadController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);

  }

}