import 'package:clean_trust/helper/get_di.dart';
import 'package:clean_trust/util/language_module/data_binding.dart';
import 'package:clean_trust/util/language_module/utils/localization_page.dart';
import 'package:clean_trust/view/base/bottom_nav_bar.dart';
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
import 'package:hive_flutter/adapters.dart';
import 'data/model/hive/offline_attendance_model.dart';
import 'helper/internet_check.dart';
import 'helper/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DataBindings();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(OfflineAttendanceAdapter());
  }
  await Hive.openBox<OfflineAttendance>('offline_attendance');
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
      //home: ManualEntryScreen(),
      locale: LocalizationService.locale ,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      getPages: AppRoutes.appRoutes(),
      initialBinding: AppBindings(),
    );
  }
}


