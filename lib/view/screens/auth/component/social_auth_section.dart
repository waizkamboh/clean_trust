import 'package:clean_trust/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';
import '../../../../util/text_style.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(AppImages.googleIcon,),
            ),
            SizedBox(width: getWidth(10),),

            ImageIcon(
              AssetImage(AppImages.facebookIcon),
            ),
            SizedBox(width: getWidth(10),),

            ImageIcon(
              AssetImage(AppImages.appleIcon),
            ),

          ],
        ),
        SizedBox(height: getHeight(10),),
        Text(
          'loginScreen9'.tr,
          style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(13), color: AppColors.kBlackColor.withOpacity(0.60)),
        ),
        SizedBox(height: getHeight(10),),
        Text(
          'loginScreen10'.tr,
          style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(13),),
        ),
      ],
    );
  }
}
