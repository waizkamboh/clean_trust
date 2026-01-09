import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/home/attendance/GetAttendanceHistoryModel.dart';
import '../../../../util/app_images.dart';
import '../../../../util/text_style.dart';
import '../../../../view_model/controller/home/attendance/get_attendance_history_controller.dart';
import 'package:clean_trust/util/app_util.dart';

class AttendanceDetailsScreen extends StatelessWidget {
  final AttendanceRecords record;
  final GetAttendanceHistoryController controller = Get.find();

  AttendanceDetailsScreen({super.key, required this.record});


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
          children: [
            TopHeader(title: 'attendanceDetail1'.tr),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getWidth(30)),
                  child: Column(
                    children: [
                      SizedBox(height: getHeight(30),),
                      _attendanceDateCard(),
                      SizedBox(height: getHeight(15),),
                      _attendanceDetailCard(),
                      // SizedBox(height: getHeight(10),),
                      // Container(
                      //   padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(17), vertical: getHeight(17)),
                      //   width: getWidth(343),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.kWhiteColor,
                      //     borderRadius: BorderRadius.all(Radius.circular(12)),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: AppColors.kBlackColor.withOpacity(0.11),
                      //         offset: const Offset(0, 1),
                      //         blurRadius: 4,
                      //         spreadRadius: 0,
                      //       ),
                      //
                      //
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //
                      //     children: [
                      //       Text(
                      //         'attendanceDetail21'.tr,
                      //         style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      //           fontSize: getFont(14),
                      //           color: AppColors.kCoolGreyColor,
                      //
                      //         ),
                      //       ),
                      //       SizedBox(height: getHeight(5),),
                      //       Container(
                      //         padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(13), vertical: getHeight(13)),
                      //         width: getWidth(309),
                      //         decoration: BoxDecoration(
                      //           color: AppColors.kTealGreenLight.withOpacity(0.1),
                      //           borderRadius: BorderRadius.all(Radius.circular(8)),
                      //           border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                      //         ),
                      //         child: Column(
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Image.asset(AppImages.attendanceDetailIcon2),
                      //                 SizedBox(width: getWidth(5),),
                      //                 Text(
                      //                   'attendanceDetail22'.tr,
                      //                   style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                      //                     fontSize: getFont(14),
                      //
                      //                   ),
                      //                 ),
                      //
                      //
                      //
                      //               ],
                      //
                      //
                      //             ),
                      //             Text(
                      //               'attendanceDetail23'.tr,
                      //               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      //                 fontSize: getFont(14),
                      //                 color: AppColors.kBlackColor,
                      //
                      //
                      //               ),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(height: getHeight(10),),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Row(
                      //             children: [
                      //               Image.asset(AppImages.attendanceDetailIcon3),
                      //               SizedBox(width: getWidth(5),),
                      //               Text(
                      //                 'attendanceDetail24'.tr,
                      //                 style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      //                   fontSize: getFont(12),
                      //                   color: AppColors.kSlateGray,
                      //
                      //                 ),
                      //               ),
                      //
                      //             ],
                      //           ),
                      //           Text(
                      //             'attendanceDetail24'.tr,
                      //             style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      //               fontSize: getFont(12),
                      //               color: AppColors.kSlateGray,
                      //
                      //             ),
                      //           ),
                      //         ],
                      //       )
                      //
                      //
                      //
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: getHeight(20),),
                      _workSummaryCard(),
                      SizedBox(height: getHeight(50),),
                  
                    ],
                  
                  
                  ),
                ),
              ),
            ),




          ],
        ),
      
    );
  }
  Widget _attendanceDateCard(){
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(25), vertical: getHeight(27)),
      width: getWidth(343),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            controller.formatFullDate(record.date),
            style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
              fontSize: getFont(18),
              color: AppColors.kMidnightBlueColor,

            ),
          ),
          Text(
            DateFormat('EEEE').format(DateTime.parse(record.date!)),
            style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
              fontSize: getFont(14),
              color: AppColors.kSlateGray,

            ),
          ),
          SizedBox(height: getHeight(10),),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(12), vertical: getHeight(18)),
            width: getWidth(293),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.kVeryLightGreenColor,
                AppColors.kLightGreenColor.withOpacity(0.50),
              ]),

              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: AppColors.kLightGreen.withOpacity(0.3), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getWidth(40),
                  height: getHeight(40),
                  decoration: BoxDecoration(
                    color: AppColors.kGreenColor.withOpacity(0.10),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                  ),
                  child: Image.asset(AppImages.attendanceDetailIcon1),

                ),
                SizedBox(width: getWidth(20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${"attendanceDetail4".tr} ${DateFormat('d MMM').format(DateTime.parse(record.date!))}",
                      style: kSize14W500kForestGreenColorInterMedium.copyWith(
                          color: AppColors.kSlateGray,
                          fontSize: getFont(12)
                      ),
                    ),

                    Text(
                      controller.calculateTotalHours(record.checkInTime, record.checkOutTime),
                      style: kSize24W700kMidnightBlueColorInterBold.copyWith(
                        color: AppColors.darkSlateBlue,
                      ),
                    ),
                  ],
                ),





              ],
            ),
          ),



        ],
      ),
    );

  }

  Widget _attendanceDetailCard(){
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(25), vertical: getHeight(23)),
      width: getWidth(343),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.12),
            offset: const Offset(0, 1),
            blurRadius: 3.5,
            spreadRadius: 0,
          ),

          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.10),
            offset: const Offset(0, 4),
            blurRadius: 5.5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.workplace?.name ?? '--',
                      style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                        fontSize: getFont(18),
                        color: AppColors.kMidnightBlueColor,
                      ),
                    ),

                    SizedBox(height: getHeight(20)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'attendanceDetail7'.tr,
                              style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                fontSize: getFont(14),
                                color: AppColors.kCoolGreyColor,
                              ),
                            ),
                            Text(
                              controller.formatTime24To12(record.checkInTime),
                              style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                                fontSize: getFont(18),
                                color: AppColors.kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'attendanceDetail8'.tr,
                              style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                fontSize: getFont(14),
                                color: AppColors.kCoolGreyColor,
                              ),
                            ),
                            Text(
                              controller.formatTime24To12(record.checkOutTime),
                              style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                                fontSize: getFont(18),
                                color: AppColors.kBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: getWidth(20)),

              Container(
                width: getWidth(50),
                height: getHeight(52),
                decoration: BoxDecoration(
                  color: AppColors.kLightBlueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Image.asset(AppImages.offlineScreenIcon1),
                ),
              ),
            ],
          ),
          SizedBox(height: getHeight(20),),
          Text(
            'attendanceDetail11'.tr,
            style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
              fontSize: getFont(14),
              color: AppColors.kCoolGreyColor,

            ),
          ),
          Text(
            controller.calculateTotalHours(record.checkInTime, record.checkOutTime),
            style:kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                fontSize: getFont(18),
                color: AppColors.kBlackColor

            ),
          ),
          SizedBox(height: getHeight(20),),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'attendanceDetail13'.tr,
                      style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                        fontSize: getFont(14),
                        color: AppColors.kCoolGreyColor,
                      ),
                    ),
                    Text(
                      record.isManual == true ? 'Manual' : 'QR Code',
                      style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                        fontSize: getFont(18),
                        color: AppColors.kBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'attendanceDetail14'.tr,
                      style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                        fontSize: getFont(14),
                        color: AppColors.kCoolGreyColor,
                      ),
                    ),
                    Text(
                      record.status?.isNotEmpty == true
                          ? '${record.status![0].toUpperCase()}${record.status!.substring(1)}'
                          : '--',
                      style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                        fontSize: getFont(18),
                        color: AppColors.kBlackColor,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),


          SizedBox(height: getHeight(10),),
          GestureDetector(
              onTap: () => controller.openLocation(record.latitude, record.longitude),
              child: Image.asset(AppImages.attendanceDetailImg1)),
          SizedBox(height: getHeight(10),),

          GestureDetector(
              onTap: () => controller.openLocation(record.latitude, record.longitude),
              child: Image.asset(AppImages.attendanceDetailImg1)),






        ],
      ),
    );

  }

  Widget _workSummaryCard(){
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(17), vertical: getHeight(17)),
      width: getWidth(343),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.11),
            offset: const Offset(0, 1),
            blurRadius: 2.6,
            spreadRadius: 0,
          ),


        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'attendanceDetail26'.tr,
            style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                fontSize: getFont(14),
                color: AppColors.kMidnightBlueColor

            ),
          ),
          SizedBox(height: getHeight(10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.calculateTotalHours(record.checkInTime, record.checkOutTime),
                    style: kSize24W700kMidnightBlueColorInterBold.copyWith(
                      color: AppColors.kRoyalBlue,

                    ),
                  ),
                  Text(
                    'attendanceDetail29'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      fontSize: getFont(12),
                      color: AppColors.kSlateGray,

                    ),
                  ),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'attendanceDetail28'.tr,
                    style: kSize24W700kMidnightBlueColorInterBold.copyWith(
                      color: AppColors.kTealGreenLight,

                    ),
                  ),
                  Text(
                    'attendanceDetail30'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      fontSize: getFont(12),
                      color: AppColors.kSlateGray,

                    ),
                  ),

                ],
              ),



            ],
          ),

          SizedBox(height: getHeight(20),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'attendanceDetail31'.tr,
                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                  fontSize: getFont(14),
                  color: AppColors.kSlateGray,

                ),
              ),
              Text(
                controller.getOvertimeText(
                  record.checkInTime,
                  record.checkOutTime,
                ),
                style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                  fontSize: getFont(14),
                  color: AppColors.kTealGreenLight,

                ),
              ),

            ],
          ),




        ],
      ),
    );

  }
}
