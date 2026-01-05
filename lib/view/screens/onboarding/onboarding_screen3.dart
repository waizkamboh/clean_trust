import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_images.dart';
import '../../../view_model/user_preference/user_preference.dart';
import 'component/onboarding_item.dart';

class OnboardingScreen3 extends StatelessWidget {
   OnboardingScreen3({super.key});
  final UserPreference userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return OnboardingItem(
      imagePath: AppImages.onboardingScreen3,
      title: 'onboardingScreen6',
      subtitle: 'onboardingScreen7',
      onButtonPress: () async{
        await userPreference.setOnboardingSeen();

        Get.offAllNamed(RouteName.loginScreen);
      },
    );
  }
}
