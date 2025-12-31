import 'package:clean_trust/util/language_module/data_binding.dart';
import 'package:clean_trust/util/language_module/utils/localization_page.dart';
import 'package:clean_trust/view/base/bottom_nav_bar.dart';
import 'package:clean_trust/view/screens/attendance/attendance_details_screen.dart';
import 'package:clean_trust/view/screens/attendance/attendance_history_screen.dart';
import 'package:clean_trust/view/screens/attendance/attendance_offline_screen.dart';
import 'package:clean_trust/view/screens/attendance/leave_request_screen.dart';
import 'package:clean_trust/view/screens/attendance/manual_entry_screen.dart';
import 'package:clean_trust/view/screens/auth/login_screen.dart';
import 'package:clean_trust/view/screens/auth/signup_screen.dart';
import 'package:clean_trust/view/screens/home/home_screen.dart';
import 'package:clean_trust/view/screens/home/scan_qrcode_screen.dart';
import 'package:clean_trust/view/screens/home/scan_result_screen.dart';
import 'package:clean_trust/view/screens/notification/notification_screen.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen1.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen2.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen3.dart';
import 'package:clean_trust/view/screens/profile/app_setting_Screen.dart';
import 'package:clean_trust/view/screens/profile/change_password_screen.dart';
import 'package:clean_trust/view/screens/profile/edit_profile_screen.dart';
import 'package:clean_trust/view/screens/profile/help_support_screen.dart';
import 'package:clean_trust/view/screens/profile/language_screen.dart';
import 'package:clean_trust/view/screens/profile/profile_screen.dart';
import 'package:clean_trust/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await DataBindings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNavScreen(),
      locale: LocalizationService.locale ,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      //getPages: AppRoutes.appRoutes(),
    );
  }
}


