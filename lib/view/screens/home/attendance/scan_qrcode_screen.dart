import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
// import '../../../helper/routes/routes_name.dart';
// import '../../../util/app_images.dart';
// import '../../../util/text_style.dart';
// import '../../base/round_button.dart';
//
// class ScanQrcodeScreen extends StatelessWidget {
//   const ScanQrcodeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: AppColors.kWhiteColor,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 TopHeader(title: 'scanQrCode1'.tr),
//                 Positioned(
//                   left: getWidth(30),
//                   right: getWidth(30),
//                   top: getHeight(120),
//                   child: Container(
//                     padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(20), vertical: getHeight(23)),
//                     width: getWidth(335),
//                     decoration: BoxDecoration(
//                       color: AppColors.kWhiteColor,
//                       borderRadius: BorderRadius.all(Radius.circular(16)),
//                       border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.kBlackColor.withOpacity(0.10),
//                           offset: const Offset(0, 10),
//                           blurRadius: 15,
//                           spreadRadius: 0,
//                         ),
//
//                         BoxShadow(
//                           color: AppColors.kBlackColor.withOpacity(0.10),
//                           offset: const Offset(0, 4),
//                           blurRadius: 6,
//                           spreadRadius: 0,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: getWidth(40),
//                           height: getHeight(40),
//                           decoration: BoxDecoration(
//                             color: AppColors.kSkyBlueColor,
//                             shape: BoxShape.circle,
//                             border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//                           ),
//                           child: Icon(Icons.location_on, color: AppColors.kWhiteColor,),
//
//                         ),
//                         SizedBox(width: getWidth(12)),
//
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'scanQrCode2'.tr,
//                               style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                                 fontSize: getFont(14),
//                               ),
//                             ),
//
//                             Text(
//                               'scanQrCode3'.tr,
//                               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                                 fontSize: getFont(12),
//                                 color: AppColors.kBlackColor
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         Spacer(),
//
//                         Text(
//                           'scanQrCode4'.tr,
//                           style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                             fontSize: getFont(12),
//                             decoration: TextDecoration.underline,
//                             decorationColor: AppColors.kBlackColor,
//                             decorationThickness: 2,
//
//                           ),
//
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//
//               ],
//             ),
//             SizedBox(height: getHeight(80),),
//             GestureDetector(
//               onTap: (){
//
//               },
//                 child: Image.asset(AppImages.QRCodeImage,)),
//             Container(
//               width: getWidth(64),
//               height: getHeight(64),
//               decoration: BoxDecoration(
//                 color: AppColors.kSkyBlueColor,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.kBlackColor.withOpacity(0.10),
//                       offset: const Offset(0, 10),
//                       blurRadius: 15,
//                       spreadRadius: 0,
//                     ),
//
//                     BoxShadow(
//                       color: AppColors.kBlackColor.withOpacity(0.10),
//                       offset: const Offset(0, 4),
//                       blurRadius: 6,
//                       spreadRadius: 0,
//                     ),
//                   ]
//               ),
//               child: Image.asset(AppImages.dragHandleIcon),
//
//             ),
//             Text(
//               'scanQrCode5'.tr,
//               style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                 fontSize: getFont(12),
//                 color: AppColors.kMidnightBlueColor
//               ),
//             ),
//             SizedBox(height: getHeight(20),),
//             RoundButton(
//               image: Image.asset(AppImages.flashIcon),
//               onPress: (){},
//               radius: BorderRadius.circular(16),
//               title: 'scanQrCode6'.tr,
//               textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor),
//               buttonColor: AppColors.kSkyBlueColor,
//               width: getWidth(287),
//               height: getHeight(60),
//
//             ),
//             SizedBox(height: getHeight(20),),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: getWidth(35)),
//               child: Row(
//                 children: [
//                   Text(
//                     'scanQrCode7'.tr,
//                     style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                       fontSize: getFont(18),
//                       color: AppColors.kMidnightBlueColor,
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     width: getWidth(8.48),
//                     height: getHeight(8.48),
//                     decoration: BoxDecoration(
//                         color: AppColors.kForestGreenColor,
//                         shape: BoxShape.circle,
//                         border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//
//                     ),
//
//                   ),
//                   SizedBox(width: getWidth(2),),
//
//                   Text(
//                     'scanQrCode8'.tr,
//                     style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                       fontSize: getFont(12),
//                       color: AppColors.kForestGreenColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: getHeight(10),),
//             buildInfoCard(
//               leadingWidget: Image.asset(AppImages.qrScreenIcon1, width: 24, height: 24),
//               title: 'scanQrCode9'.tr,
//               subtitle: 'scanQrCode10'.tr,
//               trailingWidget: Image.asset(AppImages.qrScreenIcon2, width: 20, height: 20),
//             ),
//
//             SizedBox(height: getHeight(10),),
//
//             buildInfoCard(
//               leadingWidget: Image.asset(AppImages.qrScreenIcon3, width: 24, height: 24),
//               title: 'scanQrCode11'.tr,
//               subtitle: 'scanQrCode12'.tr,
//               trailingWidget: Image.asset(AppImages.qrScreenIcon4, width: 20, height: 20),
//             ),
//
//             SizedBox(height: getHeight(50),),
//

//
//
//           ],
//         ),
//       ),
//     );
//   }
//   Widget buildInfoCard({
//     required Widget leadingWidget,   // Icon ya Image.asset
//     required String title,
//     required String subtitle,
//     required Widget trailingWidget,  // Icon ya Image.asset
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
//       width: getWidth(332),
//       decoration: BoxDecoration(
//         color: AppColors.kWhiteColor,
//         borderRadius: BorderRadius.all(Radius.circular(16)),
//         border: Border.all(color: AppColors.kBlackColor.withOpacity(0.6), width: 1),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.kBlackColor.withOpacity(0.10),
//             offset: const Offset(0, 4),
//             blurRadius: 8,
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: getWidth(48),
//             height: getHeight(48),
//             decoration: BoxDecoration(
//               color: AppColors.kLightBlueColor,
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//             ),
//             child: Center(child: leadingWidget),
//           ),
//           SizedBox(width: getWidth(12)),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                   fontSize: getFont(13),
//                   color: AppColors.kMidnightBlueColor,
//                 ),
//               ),
//               Text(
//                 subtitle,
//                 style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                   fontSize: getFont(12),
//                   color: AppColors.kCoolGreyColor,
//                 ),
//               ),
//             ],
//           ),
//           Spacer(),
//           Container(
//             width: getWidth(32),
//             height: getHeight(32),
//             decoration: BoxDecoration(
//               color: AppColors.kLightBlueColor,
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//             ),
//             child: Center(child: trailingWidget),
//           ),
//         ],
//       ),
//     );
//   }
//

// }

import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../util/app_images.dart';
import '../../../../util/text_style.dart';
import '../../../../view_model/controller/home/attendance/scanqrcode_controller.dart';
import '../../../base/round_button.dart';


class ScanQrcodeScreen extends StatelessWidget {
  ScanQrcodeScreen({super.key});

  final ScanQrCodeController controller =
  Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'scanQrCode1'.tr),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getHeight(30)),

                  _qrScanner(),





                  SizedBox(height: getHeight(30)),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(35)),
                    child: Row(
                      children: [
                        Text(
                          'scanQrCode7'.tr,
                          style: kSize16W600kMidnightBlueColorInterSemiBold
                              .copyWith(
                            fontSize: getFont(18),
                            color:
                            AppColors.kMidnightBlueColor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: getWidth(8.48),
                          height: getHeight(8.48),
                          decoration: BoxDecoration(
                            color:
                            AppColors.kTealGreenLight,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: getWidth(4)),
                        Text(
                          'scanQrCode8'.tr,
                          style: kSize14W500kForestGreenColorInterMedium
                              .copyWith(
                            color: AppColors.kTealGreenLight,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: getHeight(15)),

                  buildInfoCard(
                    leadingWidget: Image.asset(
                      AppImages.qrScreenIcon1,
                      width: 24,
                      height: 24,
                    ),
                    title: 'scanQrCode9'.tr,
                    subtitle: 'scanQrCode10'.tr,
                    trailingWidget: Image.asset(
                      AppImages.qrScreenIcon2,
                      width: 20,
                      height: 20,
                    ),
                  ),

                  SizedBox(height: getHeight(12)),

                  buildInfoCard(
                    leadingWidget: Image.asset(
                      AppImages.qrScreenIcon3,
                      width: 24,
                      height: 24,
                    ),
                    title: 'scanQrCode11'.tr,
                    subtitle: 'scanQrCode12'.tr,
                    trailingWidget: Image.asset(
                      AppImages.qrScreenIcon4,
                      width: 20,
                      height: 20,
                    ),
                  ),

                  SizedBox(height: getHeight(40)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoCard({
    required Widget leadingWidget,
    required String title,
    required String subtitle,
    required Widget trailingWidget,
  }) {
    return Container(
      width: getWidth(332),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(16),
        vertical: getHeight(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.9),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor:
            AppColors.kLightBlueColor,
            child: leadingWidget,
          ),
          SizedBox(width: getWidth(12)),
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                kSize14W500kForestGreenColorInterMedium
                    .copyWith(
                  color: AppColors.kMidnightBlueColor

                ),
              ),
              Text(
                subtitle,
                style:
                kSize17W400KCharcoalBlackColorInterRegular
                    .copyWith(
                  fontSize: getFont(12),
                  color:
                  AppColors.kCoolGreyColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 16,
            backgroundColor:
            AppColors.kLightBlueColor,
            child: trailingWidget,
          ),
        ],
      ),
    );
  }

  Widget _qrScanner(){
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.QRCodeImage,
              width: getWidth(327),
            ),

            Obx(() {
              if (!controller.showScanner.value) {
                return const SizedBox.shrink();
              }

              return Container(
                width: getWidth(240),
                height: getWidth(240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.kSkyBlueColor,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: MobileScanner(
                    controller:
                    controller.scannerController,
                    onDetect: (barcodeCapture) {
                      final qrCode = barcodeCapture
                          .barcodes.first.rawValue;
                      if (qrCode != null) {
                        controller.onQrDetected(qrCode);
                      }
                    },
                  ),
                ),
              );
            }),
          ],
        ),
        //SizedBox(height: getHeight(10)),

        GestureDetector(
          onTap: controller.openScanner,
          child: Container(
            width: getWidth(64),
            height: getHeight(64),
            decoration: BoxDecoration(
              color: AppColors.kSkyBlueColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Image.asset(
              AppImages.dragHandleIcon,
            ),
          ),
        ),
        SizedBox(height: getHeight(6)),

        Text(
          'scanQrCode5'.tr,
          style:
          kSize16W600KBlackColorOutfitSemiBold.copyWith(
            fontSize: getFont(12),
            color: AppColors.kMidnightBlueColor,
          ),
        ),
        SizedBox(height: getHeight(25)),

        Obx(() {
          return RoundButton(
            image: Icon(
              controller.torchOn.value
                  ? Icons.flash_on
                  : Icons.flash_off,
              color: Colors.white,
            ),
            onPress: controller.toggleTorch,
            radius: BorderRadius.circular(16),
            title: 'scanQrCode6'.tr,
            textStyle:
            kSize16W600kMidnightBlueColorInterSemiBold
                .copyWith(
              color: AppColors.kWhiteColor,
            ),
            buttonColor: AppColors.kSkyBlueColor,
            width: getWidth(287),
            height: getHeight(60),
          );
        }),

      ],
    );

  }
}

