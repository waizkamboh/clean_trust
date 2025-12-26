import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view/screens/auth/component/auth_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: getWidth(393),
            height: getHeight(156),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.kGradientColor5,
                    AppColors.kGradientColor6,

                  ]),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Back Button (Left)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: getWidth(40),
                      height: getHeight(40),
                      decoration: BoxDecoration(
                        color: AppColors.kDeepSkyBlueColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),

                  // Center Title
                  Text(
                    'profileScreen1'.tr,
                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                      fontSize: getFont(18),
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AuthCard(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(24), vertical: getHeight(24)),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Profile Circle
                        Container(
                          width: getWidth(120),
                          height: getHeight(120),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kWhiteColor,
                            border: Border.all(
                              color: AppColors.kLightCoolGreyColor,
                              width: 4,
                            ),
                            boxShadow: [
                              // Shadow 1
                              BoxShadow(
                                color: AppColors.kBlackColor.withOpacity(0.10),
                                offset: Offset(0, 10),
                                blurRadius: 15,
                                spreadRadius: 0,
                              ),

                              // Shadow 2
                              BoxShadow(
                                color: AppColors.kBlackColor.withOpacity(0.10),
                                offset: Offset(0, 4),
                                blurRadius: 6,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),

                        // Camera Button
                        Positioned(
                          bottom: 2,
                          right: 10,
                          child: Container(
                            width: getWidth(32),
                            height: getHeight(32),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kSkyBlueColor,
                            ),
                            child:  Icon(
                              Icons.camera_alt,
                              size: 14,
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(20),),
                    Text(
                      'profileScreen2'.tr,
                      style: kSize20W700KWhiteColorOutfitBold.copyWith(color: AppColors.kBlackColor),
                    ),
                    SizedBox(height: getHeight(10),),
                    Text(
                      'profileScreen3'.tr,
                      style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
                    ),
                    SizedBox(height: getHeight(20),),

                    Container(
                      width: getWidth(279),
                     // height: getHeight(64),
                      padding: EdgeInsets.symmetric(horizontal: getWidth(12), vertical: getHeight(12)),
                      decoration: BoxDecoration(
                        color: AppColors.kColor1,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1)
                      ),
                      child: Row(
                        children: [
                          Container(
                              width: getWidth(40),
                              height: getHeight(40),
                              decoration: BoxDecoration(
                                  color: AppColors.kColor2.withOpacity(0.10),
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1)
                              ),
                              child: ImageIcon(AssetImage(AppImages.profileScreenIcon1), color: AppColors.kSkyBlueColor,)
                          ),
                          SizedBox(width: getWidth(10),),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'profileScreen4'.tr,
                                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kBlackColor.withOpacity(0.66)),
                                ),
                                Text(
                                  'profileScreen5'.tr,
                                  style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor),
                                ),

                              ],
                            ),
                          ),
                        ],
                      )
                    ),






                    Container(
                        width: getWidth(327),
                        height: getHeight(74),
                        padding: EdgeInsets.symmetric(horizontal: getWidth(12), vertical: getHeight(12)),
                        decoration: BoxDecoration(
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: AppColors.kBlackColor.withOpacity(0.6), width: 1)
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: getWidth(40),
                                height: getHeight(40),
                                padding: EdgeInsets.symmetric(horizontal: getWidth(12), vertical: getHeight(12)),
                                decoration: BoxDecoration(
                                    color: AppColors.kColor3,
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1)
                                ),
                                child:Icon(Icons.message)
                            ),
                            Column(
                              children: [
                                Text(
                                  'profileScreen4'.tr,
                                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kBlackColor.withOpacity(0.66)),
                                ),
                                Text(
                                  'profileScreen5'.tr,
                                  style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor),
                                ),

                              ],
                            ),
                          ],
                        )
                    ),






                  ],
                ),
              )
          )


        ],
      ),
    );
  }
  Widget profileInfoTile({
    required String iconPath,
    required String title,
    required String subtitle,
  }) {
    return  Container(
        width: getWidth(279),
        // height: getHeight(64),
        padding: EdgeInsets.symmetric(horizontal: getWidth(12), vertical: getHeight(12)),
        decoration: BoxDecoration(
            color: AppColors.kColor1,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1)
        ),
        child: Row(
          children: [
            Container(
                width: getWidth(40),
                height: getHeight(40),
                decoration: BoxDecoration(
                    color: AppColors.kColor2.withOpacity(0.10),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1)
                ),
                child: ImageIcon(AssetImage(AppImages.profileScreenIcon1), color: AppColors.kSkyBlueColor,)
            ),
            SizedBox(width: getWidth(10),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'profileScreen4'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kBlackColor.withOpacity(0.66)),
                  ),
                  Text(
                    'profileScreen5'.tr,
                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor),
                  ),

                ],
              ),
            ),
          ],
        )
    )
    ;
  }

}
