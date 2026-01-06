import 'package:clean_trust/helper/get_di.dart';
import 'package:clean_trust/util/language_module/utils/localization_page.dart';
import 'package:clean_trust/view/screens/auth/confirm_password_screen.dart';
import 'package:clean_trust/view/screens/auth/forgot_password_screen.dart';
import 'package:clean_trust/view/screens/auth/login_screen.dart';
import 'package:clean_trust/view/screens/auth/signup_screen.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen1.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen2.dart';
import 'package:clean_trust/view/screens/splash/splash_screen.dart';
import 'package:clean_trust/view_model/controller/general_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/routes/routes.dart';

void main() async{
 await init();

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
      home: HomeScreen(),
      locale: LocalizationService.locale ,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      //getPages: AppRoutes.appRoutes(),
    );
  }
}


