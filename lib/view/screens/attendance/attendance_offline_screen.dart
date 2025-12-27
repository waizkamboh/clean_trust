import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/text_style.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';

class AttendanceOfflineScreen extends StatelessWidget {
  const AttendanceOfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(title: 'attendanceOffline1'.tr),
            SizedBox(height: getHeight(30)),

            Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(20), vertical: getHeight(12)),
              width: getWidth(393),
              decoration: BoxDecoration(
                color: AppColors.kSkyBlueColor.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border(left: BorderSide(color: AppColors.kSkyBlueColor, width: 4)),
              ),
              child: Row(
                children: [
                  Image.asset(AppImages.networkIcon, color: AppColors.kSkyBlueColor,),
                  SizedBox(width: getWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'attendanceOffline2'.tr,
                        style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                          color: AppColors.kBlackColor,
                        ),
                      ),

                      Text(
                        'attendanceOffline3'.tr,
                        style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            color: AppColors.kBlackColor,
                            fontSize: getFont(12)
                        ),
                      ),
                    ],
                  ),





                ],
              ),
            ),
            SizedBox(height: getHeight(20)),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(17), vertical: getHeight(17)),
                    width: getWidth(361),
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
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
                      children: [
                        Container(
                          width: getWidth(40),
                          height: getHeight(40),
                          decoration: BoxDecoration(
                            color: AppColors.kLightGreenColor,
                            shape: BoxShape.circle
                          ),
                          child: Image.asset(AppImages.qrScreenIcon3, color: AppColors.kSkyBlueColor,),

                        ),
                        SizedBox(width: getWidth(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'attendanceOffline4'.tr,
                              style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                color: AppColors.kMidnightBlueColor,
                              ),
                            ),

                            Text(
                              'attendanceOffline5'.tr,
                              style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                  color: AppColors.kCoolGreyColor,
                                  fontSize: getFont(14)
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: getWidth(8),
                          height: getHeight(8),
                          decoration: BoxDecoration(
                              color: AppColors.kSoftPeach,
                              shape: BoxShape.circle
                          ),

                        ),







                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Text(
                    'attendanceOffline6'.tr,
                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                      fontSize: getFont(18),
                      color: AppColors.kMidnightBlueColor,
                    ),
                  ),
                  SizedBox(height: getHeight(10)),
                  reusableContainer(),
                  reusableContainer(),
                  reusableContainer(),

                  Container(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
                    width: getWidth(358),
                    decoration: BoxDecoration(
                      color: AppColors.kAliceBlue,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.attendanceDetailIcon2),
                            SizedBox(width: getWidth(5),),
                            Text(
                              'attendanceOffline11'.tr,
                              style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                fontSize: getFont(14),

                              ),
                            ),



                          ],


                        ),
                        Text(
                          'attendanceOffline12'.tr,
                          style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            fontSize: getFont(14),
                            color: AppColors.kBlackColor,


                          ),
                          textAlign: TextAlign.left,
                        ),






                      ],
                    ),
                  ),






                ],
              ),
            ),
            SizedBox(height: getHeight(50)),


          ],
        ),
      ),
    );
  }
  Widget reusableContainer() {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(17), vertical: getHeight(17)),
      margin: EdgeInsetsGeometry.only(bottom: getHeight(10)),
      width: getWidth(361),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.kLightGreenColor, width: 1),
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
        children: [
          Container(
            width: getWidth(40),
            height: getHeight(40),
            decoration: BoxDecoration(
                color: AppColors.kLightGreenColor,
                shape: BoxShape.circle
            ),
            child: Image.asset(AppImages.dragHandleIcon, color: AppColors.kSkyBlueColor,),

          ),
          SizedBox(width: getWidth(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'attendanceOffline7'.tr,
                style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                  color: AppColors.kMidnightBlueColor,
                ),
              ),

              Text(
                'attendanceOffline8'.tr,
                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                    color: AppColors.kCoolGreyColor,
                    fontSize: getFont(14)
                ),
              ),
              Text(
                'attendanceOffline9'.tr,
                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                    color: AppColors.kBlackColor,
                    fontSize: getFont(12)
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(8), ),
            width: getWidth(85),
            height: getHeight(30),
            decoration: BoxDecoration(
                color: AppColors.kSoftPeach,
                borderRadius: BorderRadius.circular(9999)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.qrScreenIcon3, color: AppColors.kVividOrange,),
                SizedBox(width: getWidth(5),),
                Text(
                  'attendanceOffline10'.tr,
                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kBurntOrange,
                      fontSize: getFont(12)
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
