import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';
import '../../../../util/text_style.dart';

class SocialAuthSection extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback? onTap;
   SocialAuthSection({super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.googleIcon,

            ),
            SizedBox(width: getWidth(15),),

            Image.asset(
                AppImages.facebookIcon,

            ),
            SizedBox(width: getWidth(15),),

            Image.asset(
                AppImages.appleIcon,

            ),

          ],
        ),
        SizedBox(height: getHeight(10),),
        Text(
          text1.tr,
          style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12.32), color: AppColors.kCharcoalBlackColor.withOpacity(0.60)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2.tr,
            style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(12.32),),
          ),
        ),
      ],
    );
  }
}
