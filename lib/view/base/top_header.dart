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
      width: getWidth(393),
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
            /// 🔙 Back button
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onBack ?? () => Get.back(),
                child: Container(
                  width: getWidth(40),
                  height: getHeight(40),
                  decoration: BoxDecoration(
                    color: AppColors.kDeepSkyBlueColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.kWhiteColor,
                  ),
                ),
              ),
            ),

            /// 🏷 Title
            Text(
              title,
              style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                fontSize: getFont(18),
                color: AppColors.kWhiteColor,
              ),
            ),

            /// ⚙️ Right actions (optional)
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
