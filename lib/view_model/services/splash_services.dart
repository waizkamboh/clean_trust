import 'dart:async';
import 'package:get/get.dart';
import '../../helper/routes/routes_name.dart';
import '../user_preference/user_preference.dart';

class SplashServices {
  final UserPreference userPreference = UserPreference();

  void isLogin() async {
    String? token = await userPreference.getToken();

    print('Saved Token: $token');

    Timer(const Duration(seconds: 3), () {
      if (token == null || token.isEmpty) {
        Get.toNamed(RouteName.loginScreen);
      } else {
        Get.toNamed(RouteName.bottomNavScreen);
      }
    });
  }
}
