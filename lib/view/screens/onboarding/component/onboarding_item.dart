import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/size_config.dart';
import '../../../../util/text_style.dart';
import '../../../base/round_button.dart';

class OnboardingItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onButtonPress;

  const OnboardingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onButtonPress,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body:Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.kGradientColor1,
                  AppColors.kGradientColor2,
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: getHeight(50),
                horizontal: getWidth(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Text(
                        title.tr,
                        style: kSize20W700KWhiteColorOutfitBold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: getHeight(10)),
                      Text(
                        subtitle.tr,
                        style: kSize16W400KWhiteColorOutfitRegular,
                        textAlign: TextAlign.center,
                      ),

                    ],
                  ),

                  SizedBox(height: getHeight(40)),
                  RoundButton(
                    onPress: onButtonPress,
                    radius: BorderRadius.circular(8),
                    title: 'onboardingScreen3'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold,
                    width: getWidth(332),
                    height: getHeight(54),
                  ),
                ],
              ),
            ),
          ),
        ],
      )

    );
  }
}
