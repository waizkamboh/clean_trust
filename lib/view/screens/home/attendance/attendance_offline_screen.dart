import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view_model/controller/home/attendance/attendance_offline_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/hive/offline_attendance_model.dart';
import '../../../../helper/internet_check.dart';
import '../../../../util/text_style.dart';
import '../../../base/round_button.dart';



class AttendanceOfflineScreen extends StatelessWidget {
  AttendanceOfflineScreen({super.key});

  AttendanceOfflineController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'attendanceOffline1'.tr),
          SizedBox(height: getHeight(30)),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(() {
                    return controller.isOnlineStatus.value
                        ? SizedBox.shrink()
                        : _checkOfflineOrOnlineCard();
                  }),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _pendingSyncCard(),
                        SizedBox(height: getHeight(40)),
                        Text(
                          'attendanceOffline6'.tr,
                          style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                            fontSize: getFont(18),
                            color: AppColors.kMidnightBlueColor,
                          ),
                        ),
                        SizedBox(height: getHeight(20)),
                        Obx(() => Column(
                          children: controller.offlineList
                              .map((item) => offlineAttendanceContainer(item))
                              .toList(),
                        )),

                        SizedBox(height: getHeight(10)),


                        _autoSyncInformationCard(),




                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(50)),

                ],
              ),
            ),
          )



        ],
      ),
    );
  }

  Widget _checkOfflineOrOnlineCard(){
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(20), vertical: getHeight(12)),
      margin: EdgeInsetsGeometry.only(bottom: getHeight(30)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kSkyBlueColor.withOpacity(0.05),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border(left: BorderSide(color: AppColors.kSkyBlueColor, width: 4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.networkIcon, color: AppColors.kSkyBlueColor, width: getWidth(22.5),),
          SizedBox(width: getWidth(20)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'attendanceOffline2'.tr,
                  style: kSize14W500kForestGreenColorInterMedium.copyWith(
                    color: AppColors.kBlackColor,
                  ),
                ),

                Text(
                  'attendanceOffline3'.tr,
                  style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                      color: AppColors.kBlackColor,
                      fontSize: getFont(12)
                  ),
                ),
              ],
            ),
          ),





        ],
      ),
    );


  }

  Widget _pendingSyncCard(){
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(17), vertical: getHeight(17)),
      width: getWidth(361),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: getWidth(40),
            height: getHeight(40),
            decoration: BoxDecoration(
                color: AppColors.kLightGreenColor,
                shape: BoxShape.circle
            ),
            child: Image.asset(AppImages.offlineScreenIcon1, color: AppColors.kSkyBlueColor,),

          ),
          SizedBox(width: getWidth(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'attendanceOffline4'.tr,
                style: kSize14W500kForestGreenColorInterMedium.copyWith(
                  fontSize: getFont(16),
                  color: AppColors.kMidnightBlueColor,
                ),
              ),

              Obx(() => Text(
                '${controller.count} ${'attendanceOffline5'.tr}',
                style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                    color: AppColors.kCoolGreyColor,
                    fontSize: getFont(14)
                ),
              )),

            ],
          ),
          Spacer(),
          Container(
            width: getWidth(8),
            height: getHeight(8),
            decoration: BoxDecoration(
                color:  AppColors.kOrangeColor,
                shape: BoxShape.circle
            ),

          )







        ],
      ),
    );

  }



  Widget offlineAttendanceContainer(OfflineAttendance attendance) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(17), vertical: getHeight(17)),
      margin: EdgeInsetsGeometry.only(bottom: getHeight(10)),
      width: getWidth(361),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.kLightGreenColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: getWidth(40),
            height: getHeight(40),
            decoration: BoxDecoration(
                color: AppColors.kLightGreenColor,
                shape: BoxShape.circle
            ),
            child: Image.asset(AppImages.offlineScreenIcon2, color: AppColors.kSkyBlueColor,),

          ),
          SizedBox(width: getWidth(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'attendanceOffline7'.tr,
                style: kSize14W500kForestGreenColorInterMedium.copyWith(
                  fontSize: getFont(16),
                  color: AppColors.kMidnightBlueColor,
                ),
              ),

              Text(
                controller.formatAttendanceTime(attendance.scanTime),
                style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                  color: AppColors.kCoolGreyColor,
                  fontSize: getFont(14),
                ),
              ),


            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(8), vertical: getHeight(4)),

            decoration: BoxDecoration(
                color: AppColors.kSoftPeach,
                borderRadius: BorderRadius.circular(9999)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.offlineScreenIcon3, color: AppColors.kVividOrange,),
                SizedBox(width: getWidth(3),),
                Text(
                  'attendanceOffline10'.tr,
                  style: kSize14W500kForestGreenColorInterMedium.copyWith(
                      color: AppColors.kBurntOrange,
                      fontSize: getFont(12)
                  ),
                ),

              ],
            ),

          ),







        ],
      ),
    );


  }

  Widget _autoSyncInformationCard(){
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
      width: getWidth(358),
      decoration: BoxDecoration(
        color: AppColors.kAliceBlue,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.offlineScreenIcon, width: getWidth(18),),
          SizedBox(width: getWidth(10),),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'attendanceOffline11'.tr,
                  style: kSize14W500kForestGreenColorInterMedium.copyWith(
                      fontSize: getFont(16),
                      color: AppColors.kBlackColor

                  ),
                ),
                SizedBox(height: getHeight(5),),
                Text(
                  'attendanceOffline12'.tr,
                  style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                    fontSize: getFont(14),
                    color: AppColors.kBlackColor,


                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )




        ],


      ),






    );

  }
}

