import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/size_config.dart';
import '../../util/text_style.dart';

class TopHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const TopHeader({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: double.infinity,
      height: getHeight(156),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.kGradientColor5,
            AppColors.kGradientColor6,
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onBack ?? () => Get.back(),
                child: Container(
                  width: getWidth(40),
                  height: getHeight(40),
                  decoration: BoxDecoration(
                    color: AppColors.kSkyBlue.withOpacity(0.57),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.kLightCoolGreyColor,
                      width: 1
                    )
                  ),
                  child:  Icon(

                    Icons.arrow_back,
                    color: AppColors.kWhiteColor,

                  ),
                ),
              ),
            ),

            Text(
              title,
              style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                fontSize: getFont(18),
                color: AppColors.kWhiteColor,
              ),
            ),

            if (actions != null)
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
