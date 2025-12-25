import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/routes/routes_name.dart';
import '../../../util/app_images.dart';
import '../../base/onboarding_item.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingItem(
      imagePath: AppImages.onboardingScreen2,
      title: 'onboardingScreen4',
      subtitle: 'onboardingScreen5',
      onButtonPress: () {
        Get.toNamed(RouteName.onboardingScreen3);

      },
    );
  }
}
