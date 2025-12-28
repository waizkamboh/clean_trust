import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/text_style.dart';
import '../../base/round_button.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'helpSupportScreen1'.tr),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Column(
                  children: [
                    SizedBox(height: getHeight(30),),
                    Container(
                      width: getWidth(80),
                      height: getHeight(80),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kSkyBlueColor,
                        border: Border.all(
                          color: AppColors.kLightCoolGreyColor,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kBlackColor.withOpacity(0.10),
                            offset: const Offset(0, 10),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),

                          BoxShadow(
                            color: AppColors.kBlackColor.withOpacity(0.10),
                            offset: const Offset(0, 4),
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                        ],

                      ),
                      child: Image.asset(AppImages.helpScreenIcon1),
                    ),
                    SizedBox(height: getHeight(20),),
                    Text(
                      'helpSupportScreen2'.tr,
                      style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                          color: AppColors.kMidnightBlueColor,
                          fontSize: getFont(20)
                      ),
                    ),
                    SizedBox(height: getHeight(10),),

                    Text(
                      'helpSupportScreen3'.tr,
                      style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                          color: AppColors.kSlateGray,
                          fontSize: getFont(14)
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: getHeight(20),),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'helpSupportScreen4'.tr,
                        style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                            color: AppColors.kMidnightBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(10),),
                    contactSupportContainer(
                        leadingIcon: AppImages.helpScreenIcon2,
                        title: 'helpSupportScreen5',
                        subTitle: 'helpSupportScreen6',
                        buttonText: 'helpSupportScreen7'
                    ),
                    SizedBox(height: getHeight(20),),

                    contactSupportContainer(
                        leadingIcon: AppImages.helpScreenIcon3,
                        title: 'helpSupportScreen8',
                        subTitle: 'helpSupportScreen9',
                        buttonText: 'helpSupportScreen10'
                    ),

                    SizedBox(height: getHeight(20),),
                    Container(
                      width: getWidth(361),
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                           AppColors.kGradientColor5,
                           AppColors.kGradientColor7,

                        ]),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.kLightGrayBackground,
                          width: 1,
                        ),


                      ),
                      child: Column(
                        children: [
                          Image.asset(AppImages.helpScreenIcon4),
                          SizedBox(height: getHeight(5),),

                          Text(
                            'helpSupportScreen11'.tr,
                            style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                           SizedBox(height: getHeight(5),),
                          Text(
                            'helpSupportScreen12'.tr,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                color: AppColors.kLightBlueColor,
                                fontSize: getFont(14)
                            ),
                          ),
                          SizedBox(height: getHeight(20),),
                          RoundButton(
                            onPress: (){},
                            radius: BorderRadius.circular(8),
                            title: 'helpSupportScreen13'.tr,
                            textStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(color: AppColors.kSkyBlueColor),
                            buttonColor: AppColors.kWhiteColor,
                            width: getWidth(91),
                            height: getHeight(36),

                          )

                        ],
                      )
                    ),

                    SizedBox(height: getHeight(50),),










                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget contactSupportContainer({
    required String leadingIcon,
    required String title,
    required String subTitle,
    required String buttonText,


}){
    return Container(
      width: getWidth(362),
      padding: EdgeInsets.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.kLightGrayBackground,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),


        ],

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: getWidth(48),
            height: getHeight(48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.kAliceBlue,
              border: Border.all(
                color: AppColors.kLightCoolGreyColor,
                width: 1,
              ),


            ),
            child: Image.asset(leadingIcon),
          ),
          SizedBox(width: getWidth(10),),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr,
                  style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                    color: AppColors.kMidnightBlueColor,
                  ),
                ),
                SizedBox(height: getHeight(5),),
                Text(
                  subTitle.tr,
                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kSlateGray,
                      fontSize: getFont(14)
                  ),
                ),
                SizedBox(height: getHeight(20),),
                RoundButton(
                  onPress: (){},
                  radius: BorderRadius.circular(8),
                  title: buttonText.tr,
                  textStyle: kSize16W400KWhiteColorOutfitRegular,
                  buttonColor: AppColors.kSkyBlueColor,
                  width: getWidth(245),
                  height: getHeight(44),

                ),

              ],
            ),
          )


        ],
      ),
    );


  }
}
