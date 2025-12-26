import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/size_config.dart';
import '../../../util/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: getWidth(393),
                height: getHeight(201),
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.homePersonImage,
                          width: getWidth(49),
                          height: getHeight(49),
                        ),

                        SizedBox(width: getWidth(12)),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'homeScreen1'.tr,
                              style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                fontSize: getFont(14),
                              ),
                            ),

                            Row(
                              children: [
                                Text(
                                  'homeScreen2'.tr,
                                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                    fontSize: getFont(20),
                                  ),
                                ),

                                SizedBox(width: getWidth(6)),

                                Image.asset(AppImages.handIcon),
                              ],
                            ),
                          ],
                        ),

                        Spacer(),

                        Container(
                          width: getWidth(39),
                          height: getHeight(38),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.kWhiteColor.withOpacity(0.22),
                          ),
                          child: Image.asset(AppImages.bellIcon),
                        ),
                      ],
                    )

                ),
              ),
              Positioned(
                left: getWidth(30),
                right: getWidth(30),
                bottom: getHeight(-200),
                child: Container(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(24), vertical: getHeight(24)),
                  width: getWidth(327),
                  decoration: BoxDecoration(
                    color: AppColors.kWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
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
                   child: Column(
                     children: [
                       Container(
                         width: getWidth(118),
                         height: getHeight(28),
                         decoration: BoxDecoration(
                           color: AppColors.kLightGreenColor,
                           borderRadius: BorderRadius.circular(9999),
                           border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                               width: getWidth(8),
                               height: getHeight(8),
                               decoration: BoxDecoration(
                                 color: AppColors.kGreenColor,
                                 shape: BoxShape.circle,
                                 border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                               ),

                             ),
                             SizedBox(width: getWidth(10),),
                             Text(
                               'homeScreen3'.tr,
                               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                 color: AppColors.kForestGreenColor,
                               ),
                             ),




                           ],
                         ),
                       ),
                       SizedBox(height: getHeight(10),),
                       Text(
                         'homeScreen4'.tr,
                         style: kSize20W700KWhiteColorOutfitBold.copyWith(
                           color: AppColors.kMidnightBlueColor,
                           fontSize: getFont(24)
                         ),
                       ),
                       Text(
                         'homeScreen5'.tr,
                         style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                             color: AppColors.kCoolGreyColor,
                             fontSize: getFont(14)
                         ),
                       ),
                       SizedBox(height: getHeight(20),),
                       Container(
                         padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(12), vertical: getHeight(12)),
                         width: getWidth(131),
                         decoration: BoxDecoration(
                           color: AppColors.kColor1,
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                           border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),

                         ),
                         child: Column(
                           children: [
                             Text(
                               'homeScreen6'.tr,
                               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                   color: AppColors.kCoolGreyColor,
                                   fontSize: getFont(12)
                               ),
                             ),
                             Text(
                               'homeScreen7'.tr,
                               style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                   color: AppColors.kMidnightBlueColor,
                               ),
                             ),



                           ],
                         ),
                       ),



                     ],
                   ),
                ),
              ),



            ],
          ),
          SizedBox(height: getHeight(230)),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(24), vertical: getHeight(24)),
            width: getWidth(327),
            decoration: BoxDecoration(
              color: AppColors.kSkyBlueColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
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
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.dragHandleIcon,
                      width: getWidth(21),
                      height: getHeight(24),
                    ),

                    SizedBox(width: getWidth(20)),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'homeScreen8'.tr,
                          style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                            fontSize: getFont(18),
                            color: AppColors.kWhiteColor

                          ),
                        ),

                        Text(
                          'homeScreen9'.tr,
                          style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            fontSize: getFont(14),

                          ),
                        ),
                      ],
                    ),


                  ],
                )



              ],
            ),
          ),
          SizedBox(height: getHeight(15)),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(29), vertical: getHeight(22)),
            width: getWidth(327),
            decoration: BoxDecoration(
              color: AppColors.kColor1,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColors.kLightCoolGreyColor, width: 2),
            ),
            child: Center(
              child: Text(
                'homeScreen10'.tr,
                style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                    fontSize: getFont(14),
                    color: AppColors.kMidnightBlueColor.withOpacity(0.50)

                ),
              ),
            ),
          ),
          SizedBox(height: getHeight(15)),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(21), vertical: getHeight(21)),
            width: getWidth(335),
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(24)),
              border: Border.all(color: AppColors.kLightGreyColor, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackColor.withOpacity(0.25),
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),

              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'homeScreen11'.tr,
                  style: kSize20W700KWhiteColorOutfitBold.copyWith(
                      color: AppColors.kMidnightBlueColor,
                      fontSize: getFont(16)
                  ),
                ),
                Text(
                  'homeScreen12'.tr,
                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kCoolGreyColor,
                      fontSize: getFont(14)
                  ),
                ),
                Container(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(12), vertical: getHeight(18)),
                  width: getWidth(293),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.kVeryLightGreenColor,
                      AppColors.kLightGreenColor.withOpacity(0.50),
                    ]),

                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: getWidth(45),
                        height: getHeight(50),
                        decoration: BoxDecoration(
                          color: AppColors.kGreenColor.withOpacity(0.10),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                        ),
                        child: Image.asset(AppImages.circleTickIcon),

                      ),
                      SizedBox(width: getWidth(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'homeScreen13'.tr,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                color: AppColors.kCoolGreyColor,
                                fontSize: getFont(13)
                            ),
                          ),

                          Text(
                            'homeScreen14'.tr,
                            style: kSize20W700KWhiteColorOutfitBold.copyWith(
                                color: AppColors.kMidnightBlueColor,
                                fontSize: getFont(24)
                            ),
                          ),
                        ],
                      ),

                      



                    ],
                  ),
                ),



              ],
            ),
          ),






        ],
      ),
    );
  }
}
