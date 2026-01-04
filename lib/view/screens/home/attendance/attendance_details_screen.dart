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

class AttendanceDetailsScreen extends StatelessWidget {
  final Records record;
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
                child: Column(
                  children: [
                    SizedBox(height: getHeight(30),),
                    Container(
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
                            style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                              fontSize: getFont(18),
                              color: AppColors.kMidnightBlueColor,

                            ),
                          ),
                          Text(
                            DateFormat('EEEE').format(DateTime.parse(record.date!)),
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                              fontSize: getFont(14),
                              color: AppColors.kSlateGray,

                            ),
                          ),
                          SizedBox(height: getHeight(5),),
                          Container(
                            padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(12), vertical: getHeight(18)),
                            width: getWidth(293),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColors.kVeryLightGreenColor,
                                AppColors.kLightGreenColor.withOpacity(0.50),
                              ]),

                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: getWidth(45),
                                  height: getHeight(50),
                                  decoration: BoxDecoration(
                                    color: AppColors.kGreenColor.withOpacity(0.10),
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
                                  ),
                                  child: Image.asset(AppImages.attendanceDetailIcon1),

                                ),
                                SizedBox(width: getWidth(10)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${"attendanceDetail4".tr} ${DateFormat('d MMM').format(DateTime.parse(record.date!))}",
                                      style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                          color: AppColors.kCoolGreyColor,
                                          fontSize: getFont(13)
                                      ),
                                    ),

                                    Text(
                                      controller.calculateTotalHours(record.checkInTime, record.checkOutTime),
                                      style: kSize20W700KWhiteColorOutfitBold.copyWith(
                                          color: AppColors.kMidnightBlueColor,
                                          fontSize: getFont(24)
                                      ),
                                    ),
                                  ],
                                ),





                              ],
                            ),
                          ),



                        ],
                      ),
                    ),
                    SizedBox(height: getHeight(15),),
                    Container(
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
                          Text(
                            record.workplace?.address ?? '--',
                            style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                              fontSize: getFont(18),
                              color: AppColors.kMidnightBlueColor,

                            ),
                          ),
                          SizedBox(height: getHeight(5),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'attendanceDetail7'.tr,
                                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                      fontSize: getFont(14),
                                      color: AppColors.kCoolGreyColor,

                                    ),
                                  ),
                                  Text(
                                    controller.formatTime24To12(record.checkInTime),
                                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                      fontSize: getFont(18),

                                    ),
                                  ),


                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'attendanceDetail8'.tr,
                                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                      fontSize: getFont(14),
                                      color: AppColors.kCoolGreyColor,

                                    ),
                                  ),
                                  Text(
                                    controller.formatTime24To12(record.checkOutTime),
                                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                      fontSize: getFont(18),

                                    ),
                                  ),


                                ],
                              )
                            ],
                          ),

                          SizedBox(height: getHeight(10),),
                          Text(
                            'attendanceDetail11'.tr,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                              fontSize: getFont(14),
                              color: AppColors.kCoolGreyColor,

                            ),
                          ),
                          Text(
                            controller.calculateTotalHours(record.checkInTime, record.checkOutTime),
                            style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                              fontSize: getFont(18),

                            ),
                          ),
                          SizedBox(height: getHeight(10),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'attendanceDetail13'.tr,
                                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                      fontSize: getFont(14),
                                      color: AppColors.kCoolGreyColor,

                                    ),
                                  ),
                                  Text(
                                    record.type ?? '--',
                                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                      fontSize: getFont(18),

                                    ),
                                  ),


                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'attendanceDetail14'.tr,
                                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                      fontSize: getFont(14),
                                      color: AppColors.kCoolGreyColor,

                                    ),
                                  ),
                                  Text(
                                    record.status ?? '--',
                                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                      fontSize: getFont(14),


                                    ),
                                  ),


                                ],
                              )
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
                    ),
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
                    Container(
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
                            style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                              fontSize: getFont(14),
                              color: AppColors.kMidnightBlueColor,

                            ),
                          ),
                          SizedBox(height: getHeight(10),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                controller.calculateTotalHours(record.checkInTime, record.checkOutTime),
                                style: kSize20W700KWhiteColorOutfitBold.copyWith(
                                  fontSize: getFont(24),
                                  color: AppColors.kRoyalBlue,

                                ),
                              ),
                              Text(
                                'attendanceDetail28'.tr,
                                style: kSize20W700KWhiteColorOutfitBold.copyWith(
                                  fontSize: getFont(24),
                                  color: AppColors.kTealGreenLight,

                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'attendanceDetail29'.tr,
                                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                  fontSize: getFont(12),
                                  color: AppColors.kSlateGray,

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
                                style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                  fontSize: getFont(14),
                                  color: AppColors.kTealGreenLight,

                                ),
                              ),

                            ],
                          ),




                        ],
                      ),
                    ),
                    SizedBox(height: getHeight(50),),

                  ],


                ),
              ),
            ),




          ],
        ),
      
    );
  }
}
