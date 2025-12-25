import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Get.toNamed(RouteName.onboardingScreen1);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kDeepBlueColor,
      body: Center(
        child: Image.asset(AppImages.splashLogo),
      ),
    );
  }
}
