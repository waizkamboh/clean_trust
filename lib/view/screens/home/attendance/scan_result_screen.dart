import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/routes/routes_name.dart';
import '../../../../util/text_style.dart';
import '../../../../view_model/controller/home/attendance/scanqrcode_controller.dart';
import '../../../base/round_button.dart';

class ScanResultScreen extends StatelessWidget {
   ScanResultScreen({super.key});
  final ScanQrCodeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'scanResult1'.tr),
          SizedBox(height: getHeight(30),),
          Container(
            width: getWidth(96.38),
            height: getHeight(96.38),
            decoration: BoxDecoration(
              color: AppColors.kSkyBlueColor.withOpacity(0.11),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
            ),
            child: Center(
                child: Icon(Icons.check, color: AppColors.kSkyBlueColor, size: 50,)
            ),
          ),
          SizedBox(height: getHeight(20),),

          Text(
            'scanResult2'.tr,
            style: kSize20W700KWhiteColorOutfitBold.copyWith(
              fontSize: getFont(24),
              color: AppColors.kMidnightBlueColor,
            ),
          ),
          Text(
            'scanResult3'.tr,
            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
              color: AppColors.kCoolGreyColor,
            ),
          ),
          SizedBox(height: getHeight(30),),
          buildScanResultCard(
              iconPath: AppImages.qrScreenIcon3,
              firstText: 'scanResult4',
              secondText: controller.scannedTime.value,
             thirdText: controller.scannedDate.value,

          ),
          SizedBox(height: getHeight(20),),
          Obx(() => buildScanResultCard(
            iconPath: AppImages.qrScreenIcon1,
            firstText: controller.fullAddress.value ,
          )),

          SizedBox(height: getHeight(30),),

          RoundButton(
            onPress: (){
              Get.toNamed(RouteName.bottomNavScreen);
            },
            radius: BorderRadius.circular(12),
            title: 'scanResult9'.tr,
            textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor, fontSize: getFont(18)),
            buttonColor: AppColors.kSkyBlueColor,
            width: getWidth(327),
            height: getHeight(60),

          ),


        ],
      ),
    );
  }
   Widget buildScanResultCard({
     required String iconPath,
     String? firstText,
     String? secondText,
     String? thirdText,
   }) {
     return Container(
       padding: EdgeInsets.symmetric(
         horizontal: getWidth(24),
         vertical: getHeight(24),
       ),
       width: getWidth(327),
       decoration: BoxDecoration(
         color: AppColors.kWhiteColor,
         borderRadius: BorderRadius.circular(12),
         boxShadow: [
           BoxShadow(
             color: AppColors.kBlackColor.withOpacity(0.11),
             offset: const Offset(0, 1),
             blurRadius: 2,
           ),
         ],
       ),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             width: getWidth(48),
             height: getHeight(48),
             decoration: BoxDecoration(
               color: AppColors.kLightBlueColor,
               borderRadius: BorderRadius.circular(8),
               border: Border.all(
                 color: AppColors.kLightCoolGreyColor,
                 width: 1,
               ),
             ),
             child: Image.asset(iconPath),
           ),
           SizedBox(width: getWidth(12)),

           /// 🔴 IMPORTANT FIX
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if (firstText != null)
                   Text(
                     firstText.tr,
                     maxLines: 6, // ✅ allow 5–6 lines
                     overflow: TextOverflow.ellipsis,
                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                       fontSize: getFont(14),
                       color: AppColors.kCoolGreyColor,
                     ),
                   ),

                 if (secondText != null)
                   Text(
                     secondText.tr,
                     style: kSize20W700KWhiteColorOutfitBold.copyWith(
                       fontSize: getFont(30),
                       color: AppColors.kMidnightBlueColor,
                     ),
                   ),

                 if (thirdText != null)
                   Text(
                     thirdText.tr,
                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                       fontSize: getFont(14),
                       color: AppColors.kCoolGreyColor,
                     ),
                   ),
               ],
             ),
           ),
         ],
       ),
     );
   }
}
