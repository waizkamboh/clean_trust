import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view_model/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/get_di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() async{
    // TODO: implement initState
    await init();

    super.initState();
    splashServices.isLogin();
  }
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
