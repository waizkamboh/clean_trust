

import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/view/base/bottom_nav_bar.dart';
import 'package:clean_trust/view/screens/auth/confirm_password_screen.dart';
import 'package:clean_trust/view/screens/auth/forgot_password_screen.dart';
import 'package:clean_trust/view/screens/auth/login_screen.dart';
import 'package:clean_trust/view/screens/auth/signup_screen.dart';
import 'package:clean_trust/view/screens/notification/notification_screen.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen1.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen2.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen3.dart';
import 'package:clean_trust/view/screens/profile/app_setting_Screen.dart';
import 'package:clean_trust/view/screens/profile/change_password_screen.dart';
import 'package:clean_trust/view/screens/profile/edit_profile_screen.dart';
import 'package:clean_trust/view/screens/profile/help_support_screen.dart';
import 'package:clean_trust/view/screens/profile/language_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/home/attendance/attendance_history_screen.dart';
import '../../view/screens/home/attendance/manual_entry_screen.dart';
import '../../view/screens/home/attendance/scan_qrcode_screen.dart';
import '../../view/screens/home/attendance/scan_result_screen.dart';
import '../../view/screens/home/leave_request/leave_request_screen.dart';
import '../../view/screens/splash/splash_screen.dart';


class AppRoutes{

  static appRoutes () => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.onboardingScreen1,
      page: () => const OnboardingScreen1(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.onboardingScreen2,
      page: () => const OnboardingScreen2(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.onboardingScreen3,
      page: () => const OnboardingScreen3(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () =>  LoginScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
     ),
    GetPage(
      name: RouteName.signUpScreen,
      page: () =>  SignupScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
     ),

    GetPage(
      name: RouteName.forGetPasswordScreen,
      page: () =>  ForgotPasswordScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.confirmPasswordScreen,
      page: () => const ConfirmPasswordScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.confirmPasswordScreen,
      page: () => const ConfirmPasswordScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.bottomNavScreen,
      page: () => const BottomNavScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.notificationScreen,
      page: () =>  NotificationScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.scanQRCodeScreen,
      page: () =>  ScanQrcodeScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),

   GetPage(
      name: RouteName.scanResultScreen,
      page: () =>  ScanResultScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.attendanceHistoryScreen,
      page: () =>  AttendanceHistoryScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    // GetPage(
    //   name: RouteName.attendanceDetailsScreen,
    //   page: () =>  AttendanceDetailsScreen(),
    //   // transition: Transition.rightToLeftWithFade,
    //   //transitionDuration: const Duration(milliseconds: 250)
    // ),

    GetPage(
      name: RouteName.manualEntryScreen,
      page: () =>  ManualEntryScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),

    GetPage(
      name: RouteName.leaveRequestScreen,
      page: () =>  LeaveRequestScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.editProfileScreen,
      page: () =>  EditProfileScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
GetPage(
      name: RouteName.appSettingScreen,
      page: () =>  AppSettingScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),

GetPage(
      name: RouteName.changePasswordScreen,
      page: () =>  ChangePasswordScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),
    GetPage(
      name: RouteName.languageScreen,
      page: () => const LanguageScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),GetPage(
      name: RouteName.helpSupportScreen,
      page: () => const HelpSupportScreen(),
      // transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 250)
    ),


  ];
}