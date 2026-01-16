import 'package:clean_trust/view_model/controller/auth/change_password_controller.dart';
import 'package:clean_trust/view_model/controller/auth/confirm_password_controller.dart';
import 'package:clean_trust/view_model/controller/auth/forget_password_controller.dart';
import 'package:clean_trust/view_model/controller/auth/login_controller.dart';
import 'package:clean_trust/view_model/controller/auth/signup_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/attendance_offline_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/get_attendance_history_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/get_today_and_monthly_attendance_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/manual_attendance_entry_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/scanqrcode_controller.dart';
import 'package:clean_trust/view_model/controller/notification/get_unread_count_controller.dart';
import 'package:clean_trust/view_model/controller/notification/mark_all_notification_read_controller.dart';
import 'package:clean_trust/view_model/controller/notification/mark_notification_read_controller.dart';
import 'package:clean_trust/view_model/controller/notification/get_notification_controller.dart';
import 'package:clean_trust/view_model/controller/workplaces/get_workplaces_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/model/hive/offline_attendance_model.dart';
import '../util/language_module/data_binding.dart';
import '../view_model/controller/home/leave_request/leave_request_controller.dart';
import '../view_model/controller/profile/app_setting/get_app_setting_controller.dart';
import '../view_model/controller/profile/editProfileController.dart';
Future<void> init() async {
  // Core
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await DataBindings();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(OfflineAttendanceAdapter());
  }
  await Hive.openBox<OfflineAttendance>('offline_attendance');

  MyBindings binding = MyBindings();
  await binding.dependencies();


}

class MyBindings implements Bindings {
  @override
  Future<void> dependencies() async {
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
    Get.lazyPut(() => GetNotificationController(), fenix: true);
    Get.lazyPut(() => ConfirmPasswordController(), fenix: true);

  }

}








