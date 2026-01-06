import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/text_style.dart';
import '../../../view_model/controller/app_setting/get_app_setting_controller.dart';

class AppSettingScreen extends StatelessWidget {
  AppSettingScreen({super.key});

  final AppSettingController controller =
  Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(title: 'appSettingScreen1'.tr),
            SizedBox(height: getHeight(30)),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Column(
                children: [
                  Obx(() => GestureDetector(
                    onTap: () {
                      controller.updateAppSetting(
                        notifications: !controller.allowNotifications.value,
                      );
                    },
                    child: appSettingContainer(
                      leadingIcon: AppImages.bellIcon,
                      title: 'appSettingScreen2',
                      subTitle: 'appSettingScreen3',
                      trailingIcon: controller.getSwitchIcon(
                        controller.allowNotifications.value,
                      ),
                    ),
                  )),
              
              
                  SizedBox(height: getHeight(10)),
              
              
                  Obx(() => GestureDetector(
                    onTap: () {
                      controller.updateAppSetting(
                        location: !controller.allowLocation.value,
                      );
                    },
                    child: appSettingContainer(
                      leadingIcon: AppImages.qrScreenIcon1,
                      title: 'appSettingScreen4',
                      subTitle: 'appSettingScreen5',
                      trailingIcon: controller.getSwitchIcon(
                        controller.allowLocation.value,
                      ),
                    ),
                  )),
              
                  SizedBox(height: getHeight(10)),
              
                  Obx(() => GestureDetector(
                    onTap: () {
                      controller.updateAppSetting(
                        sync: !controller.autoSync.value,
                      );
                    },
                    child: appSettingContainer(
                      leadingIcon: AppImages.appSettingIcon1,
                      title: 'appSettingScreen6',
                      subTitle: 'appSettingScreen7',
                      trailingIcon: controller.getSwitchIcon(
                        controller.autoSync.value,
                      ),
                    ),
                  )),
              
              
                  SizedBox(height: getHeight(30)),
              
                  Container(
                    width: getWidth(362),
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(21),
                      vertical: getHeight(21),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.kLightCoolGreyColor,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: getWidth(56),
                              height: getHeight(56),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.kGradientColor5,
                                    AppColors.kGradientColor8,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(
                                AppImages.appSettingIcon2,
                                color: AppColors.kWhiteColor,
                              ),
                            ),
                            SizedBox(width: getWidth(15)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'appSettingScreen8'.tr,
                                  style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                                    color: AppColors.kMidnightBlueColor,
                                  ),
                                ),
                                Obx(() => Text(
                                  controller.appVersion.value, // appSettingScreen9
                                  style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                    fontSize: getFont(14),
                                    color: AppColors.kCoolGreyColor,
                                  ),
                                )),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: getWidth(59.72),
                              height: getHeight(36),
                              decoration: BoxDecoration(
                                color: AppColors.kLightGreenColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'appSettingScreen10'.tr,
                                  style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                                    fontSize: getFont(12),
                                    color: AppColors.kDeepGreen,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
              
                        SizedBox(height: getHeight(30)),
              
                        /// Last Updated
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'appSettingScreen11'.tr,
                              style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                fontSize: getFont(14),
                                color: AppColors.kSlateGray,
                              ),
                            ),
                            Obx(() => Text(
                              controller.lastUpdated.value, // appSettingScreen12
                              style: kSize14W500kForestGreenColorInterMedium.copyWith(
                                fontSize: getFont(14),
                                color: AppColors.kMidnightBlueColor,
                              ),
                            )),
                          ],
                        ),
              
                        SizedBox(height: getHeight(10)),
              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'appSettingScreen13'.tr,
                              style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                fontSize: getFont(14),
                                color: AppColors.kSlateGray,
                              ),
                            ),
                            Obx(() => Text(
                              controller.buildNumber.value, // appSettingScreen14
                              style: kSize14W500kForestGreenColorInterMedium.copyWith(
                                fontSize: getFont(14),
                                color: AppColors.kMidnightBlueColor,
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
              
                  SizedBox(height: getHeight(30)),
                  Text(
                    'appSettingScreen15'.tr,
                    style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                      fontSize: getFont(12),
                      color: AppColors.kMediumGrey,
                    ),
                  ),
                  SizedBox(height: getHeight(30)),
              
                  appSettingContainer(
                    leadingIcon: AppImages.profileScreenIcon6,
                    title: 'appSettingScreen16'.tr,
                    trailingIcon: AppImages.forwardIcon,
                  ),
              
                  SizedBox(height: getHeight(10)),
              
                  appSettingContainer(
                    leadingIcon: AppImages.profileScreenIcon7,
                    title: 'appSettingScreen17'.tr,
                    trailingIcon: AppImages.forwardIcon,
                  ),
              
                ],
              ),
            ),


            SizedBox(height: getHeight(50)),
          ],
        ),
      ),
    );
  }

  Widget appSettingContainer({
    required String leadingIcon,
    required String title,
    String? subTitle,
    required String trailingIcon,
  }) {
    return Container(
      width: getWidth(362),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(21),
        vertical: getHeight(21),
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.kLightCoolGreyColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: getWidth(44),
            height: getHeight(44),
            decoration: BoxDecoration(
              color: AppColors.kVeryLightGreenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              leadingIcon,
              color: AppColors.kSkyBlueColor,
            ),
          ),
          SizedBox(width: getWidth(15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr,
                style:
                kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                  color: AppColors.kMidnightBlueColor,
                ),
              ),
              if (subTitle != null)
                Text(
                  subTitle.tr,
                  style:
                  kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                    fontSize: getFont(14),
                    color: AppColors.kCoolGreyColor,
                  ),
                ),
            ],
          ),
          const Spacer(),
          Image.asset(trailingIcon),
        ],
      ),
    );
  }
}






// import 'package:clean_trust/util/app_colors.dart';
// import 'package:clean_trust/util/app_images.dart';
// import 'package:clean_trust/util/size_config.dart';
// import 'package:clean_trust/view/base/top_header.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../util/text_style.dart';
//
// class AppSettingScreen extends StatelessWidget {
//   const AppSettingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: AppColors.kWhiteColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TopHeader(title: 'appSettingScreen1'.tr),
//             SizedBox(height: getHeight(30),),
//             appSettingContainer(
//                 leadingIcon: AppImages.bellIcon,
//                 title: 'appSettingScreen2',
//                 subTitle: 'appSettingScreen3',
//                 trailingIcon: AppImages.switchButtonIcon,
//             ),
//             SizedBox(height: getHeight(10),),
//             appSettingContainer(
//               leadingIcon: AppImages.qrScreenIcon1,
//               title: 'appSettingScreen4',
//               subTitle: 'appSettingScreen5',
//               trailingIcon: AppImages.switchButtonIcon1,
//             ),
//             SizedBox(height: getHeight(10),),
//             appSettingContainer(
//               leadingIcon: AppImages.appSettingIcon1,
//               title: 'appSettingScreen6',
//               subTitle: 'appSettingScreen7',
//               trailingIcon: AppImages.switchButtonIcon,
//             ),
//             SizedBox(height: getHeight(30),),
//             Container(
//               width: getWidth(362),
//               padding: EdgeInsets.symmetric(
//                 horizontal: getWidth(21),
//                 vertical: getHeight(21),
//               ),
//               decoration: BoxDecoration(
//                 color: AppColors.kWhiteColor,
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(
//                   color: AppColors.kLightCoolGreyColor,
//                   width: 1,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       // Leading Icon Box
//                       Container(
//                         width: getWidth(56),
//                         height: getHeight(56),
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               colors: [
//                                 AppColors.kGradientColor5,
//                                 AppColors.kGradientColor6,
//
//                               ]),
//                           borderRadius: BorderRadius.circular(16),
//
//                         ),
//                         child: Image.asset(AppImages.appSettingIcon2, color: AppColors.kWhiteColor,),
//                       ),
//
//                       SizedBox(width: getWidth(15)),
//
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'appSettingScreen8'.tr,
//                             style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                               color: AppColors.kMidnightBlueColor,
//                             ),
//                           ),
//                           Text(
//                             'appSettingScreen9'.tr,
//                             style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                               fontSize: getFont(14),
//                               color: AppColors.kCoolGreyColor,
//                             ),
//                           ),
//
//                         ],
//                       ),
//
//                       // Title
//                       const Spacer(),
//
//                       // Arrow
//                       Container(
//                         width: getWidth(60),
//                         height: getHeight(36),
//                         decoration: BoxDecoration(
//                           color: AppColors.kLightGreenColor,
//                           borderRadius: BorderRadius.circular(8),
//
//                         ),
//                         child: Center(
//                           child: Text(
//                             'appSettingScreen10'.tr,
//                             style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                               fontSize: getFont(12),
//                               color: AppColors.kGreenColor,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   SizedBox(height: getHeight(30),),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'appSettingScreen11'.tr,
//                         style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                           fontSize: getFont(14),
//                           color: AppColors.kSlateGray,
//                         ),
//                       ),
//                       Text(
//                         'appSettingScreen12'.tr,
//                         style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                           fontSize: getFont(14),
//                           color: AppColors.kMidnightBlueColor,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   SizedBox(height: getHeight(10),),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                     children: [
//                       Text(
//                         'appSettingScreen13'.tr,
//                         style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                           fontSize: getFont(14),
//                           color: AppColors.kSlateGray,
//                         ),
//                       ),
//                       Text(
//                         'appSettingScreen14'.tr,
//                         style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                           fontSize: getFont(14),
//                           color: AppColors.kMidnightBlueColor,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: getHeight(30),),
//
//             Text(
//               'appSettingScreen15'.tr,
//               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                 fontSize: getFont(12),
//                 color: AppColors.kSlateGray,
//               ),
//             ),
//             SizedBox(height: getHeight(30),),
//             appSettingContainer(
//                 leadingIcon: AppImages.profileScreenIcon6,
//                 title: 'appSettingScreen16'.tr,
//                 trailingIcon: AppImages.forwardIcon
//             ),
//             SizedBox(height: getHeight(10),),
//             appSettingContainer(
//                 leadingIcon: AppImages.profileScreenIcon7,
//                 title: 'appSettingScreen17'.tr,
//                 trailingIcon: AppImages.forwardIcon
//             ),
//             SizedBox(height: getHeight(50),),
//
//
//
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//   Widget appSettingContainer({
//     required String leadingIcon,
//     required String title,
//     String? subTitle,
//     required String trailingIcon,
// }) {
//     return Container(
//       width: getWidth(362),
//       padding: EdgeInsets.symmetric(
//         horizontal: getWidth(21),
//         vertical: getHeight(21),
//       ),
//       decoration: BoxDecoration(
//         color: AppColors.kWhiteColor,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: AppColors.kLightCoolGreyColor,
//           width: 1,
//         ),
//       ),
//       child: Row(
//         children: [
//           // Leading Icon Box
//           Container(
//             width: getWidth(44),
//             height: getHeight(44),
//             decoration: BoxDecoration(
//               color: AppColors.kVeryLightGreenColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Image.asset(leadingIcon, color: AppColors.kSkyBlueColor,),
//           ),
//
//           SizedBox(width: getWidth(5)),
//
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title.tr,
//                 style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                   color: AppColors.kMidnightBlueColor,
//                 ),
//               ),
//               if(subTitle != null)
//               Text(
//                 subTitle.tr,
//                 style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                   fontSize: getFont(14),
//                   color: AppColors.kCoolGreyColor,
//                 ),
//               ),
//
//             ],
//           ),
//
//           // Title
//           const Spacer(),
//
//           // Arrow
//           Image.asset(trailingIcon),
//         ],
//       ),
//     );
//
//   }
// }
