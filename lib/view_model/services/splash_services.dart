import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../helper/routes/routes_name.dart';
import '../user_preference/user_preference.dart';

class SplashServices {
  final UserPreference userPreference = UserPreference();

  void isLogin() async {
    String? token = await userPreference.getToken();
    bool seenOnboarding = await userPreference.isOnboardingSeen();

    if (kDebugMode) {
      print('Saved Token: $token, Onboarding Seen: $seenOnboarding');
    }

    Timer(const Duration(seconds: 5), () {
      if (!seenOnboarding) {
        Get.offAllNamed(RouteName.onboardingScreen1);
      } else if (token == null || token.isEmpty) {
        Get.offAllNamed(RouteName.loginScreen);
      } else {
        Get.offAllNamed(RouteName.bottomNavScreen);
      }
    });

  }
}
