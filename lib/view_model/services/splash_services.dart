// import 'dart:async';
// import 'package:car_project/res/routes/routes_name.dart';
// import 'package:get/get.dart';
//
// import '../user_preference/user_preference.dart';
//
// class SplashServices {
//   UserPreference userPreference = UserPreference();
//
//   void isLogin() {
//     userPreference.getUser().then((value) {
//       print(value.token);
//       if (value.token == null || value.token!.isEmpty || value.token == 'null') {
//         Timer(const Duration(seconds: 3), () {
//           Get.toNamed(RouteName.loginScreen);
//         });
//       } else {
//         Timer(const Duration(seconds: 3), () {
//           Get.toNamed(RouteName.dashboardScreen);
//         });
//       }
//     });
//   }
// }
