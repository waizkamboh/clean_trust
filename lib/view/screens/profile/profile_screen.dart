import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view/screens/auth/component/auth_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(title: 'profileScreen1'.tr),
            AuthCard(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getWidth(24), vertical: getHeight(24)),
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
                                // Shadow 1
                                BoxShadow(
                                  color: AppColors.kBlackColor.withOpacity(0.10),
                                  offset: Offset(0, 10),
                                  blurRadius: 15,
                                  spreadRadius: 0,
                                ),
        
                                // Shadow 2
                                BoxShadow(
                                  color: AppColors.kBlackColor.withOpacity(0.10),
                                  offset: Offset(0, 4),
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
                              child:  Icon(
                                Icons.camera_alt,
                                size: 14,
                                color: AppColors.kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(20),),
                      Text(
                        'profileScreen2'.tr,
                        style: kSize20W700KWhiteColorOutfitBold.copyWith(color: AppColors.kBlackColor),
                      ),
                      SizedBox(height: getHeight(10),),
                      Text(
                        'profileScreen3'.tr,
                        style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
                      ),
                      SizedBox(height: getHeight(20),),
        
                      profileInfoTile(
                          iconPath: AppImages.profileScreenIcon1,
                          title: 'profileScreen4',
                          subtitle: 'profileScreen5'
                      ),
                      SizedBox(height: getHeight(10),),
                      profileInfoTile(
                          iconPath: AppImages.profileScreenIcon2,
                          title: 'profileScreen6',
                          subtitle: 'profileScreen7'
                      ),
        
        
        
        
        
        
        
        
        
        
        
        
                    ],
                  ),
                )
            ),
            SizedBox(height: getHeight(40),),
            ProfileOptionTile(
              leadingIcon: AppImages.profileScreenIcon3,
              title: 'profileScreen8'.tr,
              onTap: () {  },
        
            ),
            SizedBox(height: getHeight(20),),

            ProfileOptionTile(
              leadingIcon: AppImages.profileScreenIcon4,
              title: 'profileScreen9'.tr,
              onTap: () {  },
        
            ),
            SizedBox(height: getHeight(20),),

            ProfileOptionTile(
              leadingIcon: AppImages.profileScreenIcon4,
              title: 'profileScreen10'.tr,
              onTap: () {  },
        
            ),
            SizedBox(height: getHeight(20),),

            ProfileOptionTile(
              leadingIcon: AppImages.profileScreenIcon5,
              title: 'profileScreen11'.tr,
              onTap: () {  },
        
            ),
            SizedBox(height: getHeight(20),),

            ProfileOptionTile(
              leadingIcon: AppImages.profileScreenIcon6,
              title: 'profileScreen12'.tr,
              onTap: () {  },
        
            ),
            SizedBox(height: getHeight(20),),

            ProfileOptionTile(
              leadingIcon: AppImages.profileScreenIcon7,
              title: 'profileScreen13'.tr,
              onTap: () {  },
        
            ),
            SizedBox(height: getHeight(50),),




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
    return  Container(
        width: getWidth(279),
        // height: getHeight(64),
        padding: EdgeInsets.symmetric(horizontal: getWidth(12), vertical: getHeight(12)),
        decoration: BoxDecoration(
            color: AppColors.kColor1,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1)
        ),
        child: Row(
          children: [
            Container(
                width: getWidth(40),
                height: getHeight(40),
                decoration: BoxDecoration(
                    color: AppColors.kColor2.withOpacity(0.10),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1)
                ),
                child: Image.asset(iconPath, color: AppColors.kSkyBlueColor)
            ),
            SizedBox(width: getWidth(10),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kBlackColor.withOpacity(0.66)),
                  ),
                  Text(
                    subtitle.tr,
                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor),
                  ),

                ],
              ),
            ),
          ],
        )
    )
    ;
  }

}
class ProfileOptionTile extends StatefulWidget {
  final String leadingIcon;
  final String title;
  final VoidCallback onTap;

  const ProfileOptionTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  });

  @override
  State<ProfileOptionTile> createState() => _ProfileOptionTileState();
}

class _ProfileOptionTileState extends State<ProfileOptionTile> {
  bool isSelected = false;

  bool get isLogout => widget.title.trim() == 'Logout';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      child: Container(
        width: getWidth(327),
        height: getHeight(74),
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(17),
          vertical: getHeight(17),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kSkyBlueColor
              : AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.kBlackColor.withOpacity(0.6),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Leading Icon Box
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
                widget.leadingIcon,
                color: isSelected
                    ? AppColors.kWhiteColor
                    : isLogout
                    ? AppColors.kPrimaryRed
                    : AppColors.kSkyBlueColor,
              ),
            ),

            SizedBox(width: getWidth(5)),

            // Title
            Text(
              widget.title.tr,
              style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                color: isSelected
                    ? AppColors.kWhiteColor
                    : isLogout
                    ? AppColors.kPrimaryRed
                    : AppColors.kMidnightBlueColor,
              ),
            ),

            const Spacer(),

            // Arrow
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

