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
                    Container(
                      padding: EdgeInsetsGeometry.symmetric( horizontal: getWidth(24),
                        vertical: getHeight(24),),
                      width: getWidth(327),
                      decoration: BoxDecoration(
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        border: Border.all(
                          color: AppColors.kLightCoolGreyColor,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kBlackColor.withOpacity(0.10),
                            offset: const Offset(0, 10),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),

                          BoxShadow(
                            color: AppColors.kBlackColor.withOpacity(0.10),
                            offset: const Offset(0, 4),
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                        ],
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
                                SizedBox(height: getHeight(10),),
                                Container(
                                  width: getWidth(120),
                                  height: getHeight(120),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: controller.profilePicture.value.isNotEmpty
                                        ? DecorationImage(
                                      image: NetworkImage(controller.profilePicture.value),
                                      fit: BoxFit.cover,
                                    )
                                        : null,
                                    //color: Colors.white,
                                    border: Border.all(
                                      color: AppColors.kWhiteColor,
                                      width: 6,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.kLightCoolGreyColor.withOpacity(0.20),
                                        offset: const Offset(0, 10),
                                        blurRadius: 15,
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: AppColors.kLightCoolGreyColor.withOpacity(0.20),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: 0,

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
                              style: kSize24W700kMidnightBlueColorInterBold
                                  .copyWith(color: AppColors.kMidnightBlueColor, fontSize: getFont(20)),
                            ),
                            Text(
                              controller.position.value,
                              style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                fontSize: getFont(14),
                                color: AppColors.kCoolGreyColor,
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
                    SizedBox(height: getHeight(10)),

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
                    SizedBox(height: getHeight(10)),

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
                    SizedBox(height: getHeight(10)),

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
                    SizedBox(height: getHeight(10)),

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
                    SizedBox(height: getHeight(10)),

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                    fontSize: getFont(12),
                    color: AppColors.kCoolGreyColor,
                  ),
                ),
                Text(
                  subtitle.tr,
                  style: kSize14W500kForestGreenColorInterMedium.copyWith(
                    color: AppColors.kMidnightBlueColor,
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
            horizontal: getWidth(16),
            vertical: getHeight(16),
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kSkyBlueColor : AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.kBlackColor.withOpacity(0.06),
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
                      : AppColors.kVeryLightGreenColor,
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
                style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
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
                    ? AppColors.kWhiteColor
                    : isLogout
                    ? AppColors.kSoftRed
                    : AppColors.kMediumGrey,
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
                SizedBox(height: getHeight(20)),
                Text(
                  'logout1'.tr,
                  style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                      color: AppColors.kMidnightBlueColor, fontSize: getFont(20)),
                ),
                SizedBox(height: getHeight(10)),
                Text(
                  'logout2'.tr,
                  style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                    fontSize: getFont(16),
                    color: AppColors.kDarkSlateGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getHeight(50)),
                RoundButton(
                  onPress: () async {
                    UserPreference userPreference = UserPreference();
                    await userPreference.removeToken();
                    await userPreference.clearProfile();

                    Get.offAllNamed(RouteName.loginScreen);
                  },
                  radius: BorderRadius.circular(12),
                  title: 'logout3'.tr,
                  textStyle: kSize14W500kForestGreenColorInterMedium.copyWith(color: AppColors.kWhiteColor, fontSize: getFont(16)),
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
                  textStyle: kSize14W500kForestGreenColorInterMedium.copyWith(color: AppColors.kDarkSlateGray, fontSize: getFont(16)),

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
