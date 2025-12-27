import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/routes/routes_name.dart';
import '../../../util/text_style.dart';
import '../../base/round_button.dart';

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'scanResult1'.tr),
          SizedBox(height: getHeight(30),),
          Container(
            width: getWidth(96.38),
            height: getHeight(96.38),
            decoration: BoxDecoration(
              color: AppColors.kSkyBlueColor.withOpacity(0.11),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
            ),
            child: Center(
                child: Icon(Icons.check, color: AppColors.kSkyBlueColor, size: 50,)
            ),
          ),
          SizedBox(height: getHeight(20),),

          Text(
            'scanResult2'.tr,
            style: kSize20W700KWhiteColorOutfitBold.copyWith(
              fontSize: getFont(24),
              color: AppColors.kMidnightBlueColor,
            ),
          ),
          Text(
            'scanResult3'.tr,
            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
              color: AppColors.kCoolGreyColor,
            ),
          ),
          SizedBox(height: getHeight(30),),
          buildScanResultCard(
              iconPath: AppImages.qrScreenIcon3,
              firstText: 'scanResult4',
              secondText: 'scanResult5',
              thirdText: 'scanResult6'
          ),
          SizedBox(height: getHeight(20),),
          buildScanResultCard(
              iconPath: AppImages.qrScreenIcon1,
              secondText: 'scanResult7',
              thirdText: 'scanResult8'
          ),
          SizedBox(height: getHeight(30),),

          RoundButton(
            onPress: (){

            },
            radius: BorderRadius.circular(12),
            title: 'scanResult9'.tr,
            textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor, fontSize: getFont(18)),
            buttonColor: AppColors.kSkyBlueColor,
            width: getWidth(327),
            height: getHeight(60),

          ),


        ],
      ),
    );
  }
  Widget buildScanResultCard({
    required String iconPath,
    String? firstText, // Optional
    required String secondText, // Optional
    required String thirdText, // Optional
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidth(24), vertical: getHeight(24)),
      width: getWidth(327),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.11),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: getWidth(48),
            height: getHeight(48),
            decoration: BoxDecoration(
              color: AppColors.kLightBlueColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
            ),
            child: Image.asset(iconPath),
          ),
          SizedBox(width: getWidth(12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (firstText != null)
                Text(
                firstText.tr,
                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                  fontSize: getFont(14),
                  color: AppColors.kCoolGreyColor,
                ),
              ),
              Text(
                secondText.tr,
                style: kSize20W700KWhiteColorOutfitBold.copyWith(
                  fontSize: getFont(30),
                  color: AppColors.kMidnightBlueColor,
                ),
              ),
              Text(
                thirdText.tr,
                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                  fontSize: getFont(14),
                  color: AppColors.kCoolGreyColor,
                ),
              ),
            ],
          ),

        ],
      ),
    );

  }
}
