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
      body:SafeArea(

        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset(
                    imagePath,
                    width: getWidth(279),
                    fit: BoxFit.contain),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: getHeight(57)
              ),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: getWidth(280),
                    child: Column(
                      children: [
                        Text(
                          title.tr,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          style: kSize20W700KWhiteColorOutfitBold.copyWith(
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: getHeight(12)),
                        Text(
                          subtitle.tr,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          softWrap: true,
                          style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: getHeight(60)),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: getWidth(25),
                    ),
                    child: RoundButton(
                      onPress: onButtonPress,
                      radius: BorderRadius.circular(8),
                      title: 'onboardingScreen3'.tr,
                      textStyle: kSize16W600KBlackColorOpenSansSemiBold,
                      width: getWidth(332),
                      height: getHeight(54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )

    );
  }
}
