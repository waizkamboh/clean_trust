import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/size_config.dart';
import '../../util/text_style.dart';

class TopHeader extends StatelessWidget {
  String title;

   TopHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
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
              title,
              style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                fontSize: getFont(18),
                color: AppColors.kWhiteColor,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
