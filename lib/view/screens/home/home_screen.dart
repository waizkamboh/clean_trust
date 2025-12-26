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



        ],
      ),
    );
  }
}
