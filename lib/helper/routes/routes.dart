

import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen1.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen2.dart';
import 'package:clean_trust/view/screens/onboarding/onboarding_screen3.dart';
import 'package:get/get.dart';

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


  ];
}