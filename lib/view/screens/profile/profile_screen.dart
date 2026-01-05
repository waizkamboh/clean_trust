import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view/screens/auth/component/auth_card.dart';
import 'package:clean_trust/view_model/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../helper/internet_check.dart';
import '../../../helper/routes/routes_name.dart';
import '../../../util/app_colors.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import '../../../view_model/controller/employee/editProfileController.dart';
import '../../base/round_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final EditProfileController controller = Get.find();

  final RxInt selectedIndex = (-1).obs;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SizedBox.expand(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TopHeader(title: 'profileScreen1'.tr),


            Positioned.fill(
              top: getHeight(120),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AuthCard(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getWidth(24),
                          vertical: getHeight(24),
                        ),
                        child: Obx(() {
                          if (controller.isLoading.value) {
                            return SizedBox(
                              height: getHeight(200), // Adjust as needed
                              child:  Center(
                                child: SpinKitSpinningLines(color: AppColors.kSkyBlueColor),
                              ),
                            );
                          }

                          return Column(
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
                                      image: controller.profilePicture.value.isNotEmpty
                                          ? DecorationImage(
                                        image: NetworkImage(
                                          controller.profilePicture.value,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                          : null,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.kBlackColor.withOpacity(0.10),
                                          offset: const Offset(0, 10),
                                          blurRadius: 15,
                                        ),
                                        BoxShadow(
                                          color: AppColors.kBlackColor.withOpacity(0.10),
                                          offset: const Offset(0, 4),
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
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 14,
                                        color: AppColors.kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: getHeight(20)),

                              // Name & Email
                              Text(
                                controller.fullName.value,
                                style: kSize20W700KWhiteColorOutfitBold
                                    .copyWith(color: AppColors.kBlackColor),
                              ),
                              SizedBox(height: getHeight(10)),
                              Text(
                                controller.email.value,
                                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                  fontSize: getFont(14),
                                  color: AppColors.kBlackColor.withOpacity(0.66),
                                ),
                              ),
                              SizedBox(height: getHeight(20)),

                              // Profile Info Tiles
                              profileInfoTile(
                                iconPath: AppImages.profileScreenIcon1,
                                title: 'profileScreen4'.tr,
                                subtitle: controller.email.value,
                              ),
                              SizedBox(height: getHeight(10)),
                              profileInfoTile(
                                iconPath: AppImages.profileScreenIcon2,
                                title: 'profileScreen6'.tr,
                                subtitle: controller.phoneNumber.value,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: getHeight(40)),

                    profileOptionTile(
                      index: 0,
                      leadingIcon: AppImages.profileScreenIcon3,
                      title: 'profileScreen8'.tr,
                      onTap: () {
                        selectedIndex.value = 0;
                        Get.toNamed(RouteName.editProfileScreen)?.then((_) {
                          selectedIndex.value = -1;
                        });
                      },
                    ),
                    SizedBox(height: getHeight(20)),

                    profileOptionTile(
                      index: 1,
                      leadingIcon: AppImages.profileScreenIcon4,
                      title: 'profileScreen9'.tr,
                      onTap: () {
                        selectedIndex.value = 1;
                        Get.toNamed(RouteName.changePasswordScreen)?.then((_) {
                          selectedIndex.value = -1;
                        });
                      },
                    ),
                    SizedBox(height: getHeight(20)),

                    profileOptionTile(
                      index: 2,
                      leadingIcon: AppImages.profileScreenIcon4,
                      title: 'profileScreen10'.tr,
                      onTap: () {
                        selectedIndex.value = 2;
                        Get.toNamed(RouteName.appSettingScreen)?.then((_) {
                          selectedIndex.value = -1;
                        });
                      },
                    ),
                    SizedBox(height: getHeight(20)),

                    profileOptionTile(
                      index: 3,
                      leadingIcon: AppImages.profileScreenIcon5,
                      title: 'profileScreen11'.tr,
                      onTap: () {
                        selectedIndex.value = 3;
                        Get.toNamed(RouteName.languageScreen)?.then((_) {
                          selectedIndex.value = -1;
                        });
                      },
                    ),
                    SizedBox(height: getHeight(20)),

                    profileOptionTile(
                      index: 4,
                      leadingIcon: AppImages.profileScreenIcon6,
                      title: 'profileScreen12'.tr,
                      onTap: () {
                        selectedIndex.value = 4;
                        Get.toNamed(RouteName.helpSupportScreen)?.then((_) {
                          selectedIndex.value = -1;
                        });
                      },
                    ),
                    SizedBox(height: getHeight(20)),

                    profileOptionTile(
                      index: 5,
                      leadingIcon: AppImages.profileScreenIcon7,
                      title: 'profileScreen13'.tr,
                      onTap: () {
                        selectedIndex.value = 5;
                        showLogoutDialog();
                        // Reset after dialog closes
                        Future.delayed(const Duration(milliseconds: 100), () {
                          selectedIndex.value = -1;
                        });
                      },
                    ),
                    SizedBox(height: getHeight(50)),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: getWidth(40),
            height: getHeight(40),
            decoration: BoxDecoration(
              color: AppColors.kColor2.withOpacity(0.10),
              borderRadius: BorderRadius.circular(8),
              border:
              Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
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
    return Obx(() {
      bool isSelected = selectedIndex.value == index;
      bool isLogout = title == 'profileScreen13'.tr;

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
              const Spacer(),
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
    });
  }

  void showLogoutDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.kWhiteColor,
        shadowColor: AppColors.kBlackColor.withOpacity(0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: getWidth(327),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(32), vertical: getHeight(34)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: getWidth(64),
                  height: getHeight(64),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kSkyBlueColor.withOpacity(0.08),
                    border: Border.all(
                      color: AppColors.kLightCoolGreyColor,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    AppImages.profileScreenIcon7,
                    color: AppColors.kSkyBlueColor,
                  ),
                ),
                SizedBox(height: getHeight(10)),
                Text(
                  'logout1'.tr,
                  style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                      color: AppColors.kMidnightBlueColor, fontSize: getFont(20)),
                ),
                SizedBox(height: getHeight(5)),
                Text(
                  'logout2'.tr,
                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                    color: AppColors.kDarkSlateGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getHeight(30)),
                RoundButton(
                  onPress: () async {
                    UserPreference userPreference = UserPreference();
                    await userPreference.removeToken();
                    await userPreference.clearProfile();

                    Get.offAllNamed(RouteName.loginScreen);
                  },
                  radius: BorderRadius.circular(12),
                  title: 'logout3'.tr,
                  textStyle: kSize16W400KWhiteColorOutfitRegular,
                  buttonColor: AppColors.kSkyBlueColor,
                  borderColor: AppColors.kLightCoolGreyColor,
                  width: getWidth(263),
                  height: getHeight(48),
                ),
                SizedBox(height: getHeight(10)),
                RoundButton(
                  onPress: () {
                    Get.back();
                  },
                  radius: BorderRadius.circular(12),
                  title: 'logout4'.tr,
                  textStyle: kSize16W400KWhiteColorOutfitRegular
                      .copyWith(color: AppColors.kSkyBlueColor),
                  buttonColor: AppColors.kLightGrayBackground,
                  borderColor: AppColors.kLightCoolGreyColor,
                  width: getWidth(263),
                  height: getHeight(48),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
