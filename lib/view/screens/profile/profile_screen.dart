import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view/screens/auth/component/auth_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/routes/routes_name.dart';
import '../../../util/app_colors.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopHeader(title: 'profileScreen1'.tr),
          ),
          // Scrollable content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: getHeight(100)), // space for header
              child: Column(
                children: [
                  // Profile Card
                  AuthCard(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getWidth(24),
                        vertical: getHeight(24),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              // Profile Circle
                              Container(
                                width: getWidth(120),
                                height: getHeight(120),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.kWhiteColor,
                                  border: Border.all(
                                    color: AppColors.kLightCoolGreyColor,
                                    width: 4,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                      AppColors.kBlackColor.withOpacity(0.10),
                                      offset: Offset(0, 10),
                                      blurRadius: 15,
                                    ),
                                    BoxShadow(
                                      color:
                                      AppColors.kBlackColor.withOpacity(0.10),
                                      offset: Offset(0, 4),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              ),

                              // Camera Button
                              Positioned(
                                bottom: 2,
                                right: 10,
                                child: Container(
                                  width: getWidth(32),
                                  height: getHeight(32),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.kSkyBlueColor,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 14,
                                    color: AppColors.kWhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: getHeight(20)),

                          Text(
                            'profileScreen2'.tr,
                            style: kSize20W700KWhiteColorOutfitBold.copyWith(
                                color: AppColors.kBlackColor),
                          ),
                          SizedBox(height: getHeight(10)),

                          Text(
                            'profileScreen3'.tr,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                              fontSize: getFont(14),
                              color: AppColors.kBlackColor.withOpacity(0.66),
                            ),
                          ),
                          SizedBox(height: getHeight(20)),

                          profileInfoTile(
                            iconPath: AppImages.profileScreenIcon1,
                            title: 'profileScreen4',
                            subtitle: 'profileScreen5',
                          ),
                          SizedBox(height: getHeight(10)),

                          profileInfoTile(
                            iconPath: AppImages.profileScreenIcon2,
                            title: 'profileScreen6',
                            subtitle: 'profileScreen7',
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: getHeight(40)),

                  // Profile Options
                  profileOptionTile(
                    index: 0,
                    leadingIcon: AppImages.profileScreenIcon3,
                    title: 'profileScreen8',
                    onTap: () {
                      setState(() => selectedIndex = 0);
                      Get.toNamed(RouteName.editProfileScreen);
                    },
                  ),
                  SizedBox(height: getHeight(20)),

                  profileOptionTile(
                    index: 1,
                    leadingIcon: AppImages.profileScreenIcon4,
                    title: 'profileScreen9',
                    onTap: () {
                      setState(() => selectedIndex = 1);
                      Get.toNamed(RouteName.changePasswordScreen);
                    },
                  ),
                  SizedBox(height: getHeight(20)),

                  profileOptionTile(
                    index: 2,
                    leadingIcon: AppImages.profileScreenIcon4,
                    title: 'profileScreen10',
                    onTap: () {
                      setState(() => selectedIndex = 2);
                      Get.toNamed(RouteName.appSettingScreen);
                    },
                  ),
                  SizedBox(height: getHeight(20)),

                  profileOptionTile(
                    index: 3,
                    leadingIcon: AppImages.profileScreenIcon5,
                    title: 'profileScreen11',
                    onTap: () {
                      setState(() => selectedIndex = 3);
                      Get.toNamed(RouteName.languageScreen);
                    },
                  ),
                  SizedBox(height: getHeight(20)),

                  profileOptionTile(
                    index: 4,
                    leadingIcon: AppImages.profileScreenIcon6,
                    title: 'profileScreen12',
                    onTap: () {
                      setState(() => selectedIndex = 4);
                    },
                  ),
                  SizedBox(height: getHeight(20)),

                  profileOptionTile(
                    index: 5,
                    leadingIcon: AppImages.profileScreenIcon7,
                    title: 'profileScreen13',
                    onTap: () {
                      setState(() => selectedIndex = 5);
                    },
                  ),
                  SizedBox(height: getHeight(50)),
                ],
              ),
            ),
          ),

          // Fixed Top Header

        ],
      ),
    );
  }

  Widget profileInfoTile({
    required String iconPath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: getWidth(279),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(12),
        vertical: getHeight(12),
      ),
      decoration: BoxDecoration(
        color: AppColors.kColor1,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: getWidth(40),
            height: getHeight(40),
            decoration: BoxDecoration(
              color: AppColors.kColor2.withOpacity(0.10),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
            ),
            child: Image.asset(iconPath, color: AppColors.kSkyBlueColor),
          ),
          SizedBox(width: getWidth(10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr,
                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                    fontSize: getFont(12),
                    color: AppColors.kBlackColor.withOpacity(0.66),
                  ),
                ),
                Text(
                  subtitle.tr,
                  style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                    fontSize: getFont(14),
                    color: AppColors.kBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileOptionTile({
    required int index,
    required String leadingIcon,
    required String title,
    required VoidCallback onTap,
  }) {
    bool isSelected = selectedIndex == index;
    bool isLogout = title == 'profileScreen13';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getWidth(327),
        height: getHeight(74),
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(17),
          vertical: getHeight(17),
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kSkyBlueColor : AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.kBlackColor.withOpacity(0.6),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: getWidth(40),
              height: getHeight(40),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.kWhiteColor.withOpacity(0.2)
                    : isLogout
                    ? AppColors.kLightRed
                    : AppColors.kColor3,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                leadingIcon,
                color: isSelected
                    ? AppColors.kWhiteColor
                    : isLogout
                    ? AppColors.kPrimaryRed
                    : AppColors.kSkyBlueColor,
              ),
            ),
            SizedBox(width: getWidth(5)),
            Text(
              title.tr,
              style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                color: isSelected
                    ? AppColors.kWhiteColor
                    : isLogout
                    ? AppColors.kPrimaryRed
                    : AppColors.kMidnightBlueColor,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: isSelected
                  ? AppColors.kWhiteColor.withOpacity(0.50)
                  : isLogout
                  ? AppColors.kSoftRed
                  : AppColors.kBlackColor.withOpacity(0.50),
            ),
          ],
        ),
      ),
    );
  }
}
