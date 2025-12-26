import 'package:clean_trust/util/en.dart';
import 'package:clean_trust/view/screens/auth/login_screen.dart';
import 'package:clean_trust/view/screens/auth/signup_screen.dart';
import 'package:clean_trust/view/screens/home/home_screen.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen1.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen2.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen3.dart';
import 'package:clean_trust/view/screens/profile/profile_screen.dart';
import 'package:clean_trust/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/routes/routes.dart';

void main() {
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
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale:  const Locale('en', 'US'),
     // getPages: AppRoutes.appRoutes(),
    );
  }
}


