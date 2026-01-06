import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_constant.dart';
import '../../../util/language_module/utils/localization_page.dart';
import '../../../util/text_style.dart';
import '../../../view_model/controller/general_controller.dart';
import '../../base/round_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'languageScreen1'.tr),
          SizedBox(height: getHeight(50),),
          selectLanguageCard(
              image: AppImages.languageScreen1,
              title: 'languageScreen2'.tr,
              isSelected: selectedIndex == 0,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });

            },
          ),
          selectLanguageCard(
              image: AppImages.languageScreen2,
              title: 'languageScreen3'.tr,
              isSelected: selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });

            },
          ),
          selectLanguageCard(
              image: AppImages.languageScreen3,
              title: 'languageScreen4'.tr,
              isSelected: selectedIndex == 2,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });

            },
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getWidth(30)),
            child: RoundButton(
              onPress: () async {

                if (selectedIndex == 0) {
                  // English
                  LocalizationService().changeLocale("english");
                  Get.find<GeneralController>()
                      .sharedPreferences
                      .setString(language, "en");

                } else if (selectedIndex == 1) {
                  // Czech
                  LocalizationService().changeLocale("czech");
                  Get.find<GeneralController>()
                      .sharedPreferences
                      .setString(language, "cs");

                } else if (selectedIndex == 2) {
                  // Russian
                  LocalizationService().changeLocale("russian");
                  Get.find<GeneralController>()
                      .sharedPreferences
                      .setString(language, "ru");
                }

              },
              radius: BorderRadius.circular(12),
              title: 'languageScreen5'.tr,
              textStyle: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                color: AppColors.kWhiteColor,
              ),
              buttonColor: AppColors.kSkyBlueColor,
              width: getWidth(343),
              height: getHeight(56),
            ),
          ),


          SizedBox(height: getHeight(50),)

        ],
      ),
    );
  }

  Widget selectLanguageCard({
    required String image,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getWidth(24)),
        child: Container(
          width: getWidth(353),
          margin: EdgeInsets.only(bottom: getHeight(15)),
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(17),
            vertical: getHeight(15),
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kSkyBlueColor : AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? AppColors.kSkyBlueColor
                  : AppColors.kBlackColor.withOpacity(0.08),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image.asset(image),
        
              SizedBox(width: getWidth(15)),
        
              Text(
                title,
                style: kSize16W400kDarkGraphiteOpenSansRegular.copyWith(
                  color: isSelected
                      ? AppColors.kWhiteColor
                      : AppColors.kDarkGraphite,
                ),
              ),
        
              const Spacer(),
        
              // Show icon only when selected
              if (isSelected)
                const Icon(
                  Icons.check,
                  size: 18.76,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }

}




