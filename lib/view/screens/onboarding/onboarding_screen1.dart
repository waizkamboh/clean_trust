import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_images.dart';
import '../../base/onboarding_item.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingItem(
      imagePath: AppImages.onboardingScreen1,
      title: 'onboardingScreen1',
      subtitle: 'onboardingScreen2',
      onButtonPress: () {
        Get.toNamed(RouteName.onboardingScreen2);
      },
    );
  }
}
