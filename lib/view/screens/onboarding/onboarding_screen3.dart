import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_images.dart';
import 'component/onboarding_item.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingItem(
      imagePath: AppImages.onboardingScreen3,
      title: 'onboardingScreen6',
      subtitle: 'onboardingScreen7',
      onButtonPress: () {
        //Get.toNamed('/nextOnboarding');
      },
    );
  }
}
