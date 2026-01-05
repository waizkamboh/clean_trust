import 'package:clean_trust/util/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: getHeight(218),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.kGradientColor3,
              AppColors.kGradientColor4,

            ]),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
      ),
      child: Center(child: Image.asset(AppImages.appLogo, width: getWidth(97), height: getHeight(77),)),
    );
  }
}
