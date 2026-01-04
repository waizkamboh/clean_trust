// import 'package:clean_trust/util/app_colors.dart';
// import 'package:clean_trust/util/app_images.dart';
// import 'package:clean_trust/util/size_config.dart';
// import 'package:clean_trust/view/base/top_header.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../helper/routes/routes_name.dart';
// import '../../../util/text_style.dart';
// import '../../base/custom_drop_down.dart';
// import '../../base/input_text_field.dart';
// import '../../base/round_button.dart';
//
// class AttendanceHistoryScreen extends StatelessWidget {
//   const AttendanceHistoryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: AppColors.kWhiteColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TopHeader(title: 'attendanceHistory1'.tr),
//             SizedBox(height: getHeight(30),),
//             Container(
//               padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
//               width: getWidth(373),
//               decoration: BoxDecoration(
//                 color: AppColors.kWhiteColor,
//                 borderRadius: BorderRadius.all(Radius.circular(12)),
//                 border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.kBlackColor.withOpacity(0.10),
//                     offset: const Offset(0, 10),
//                     blurRadius: 15,
//                     spreadRadius: 0,
//                   ),
//
//                   BoxShadow(
//                     color: AppColors.kBlackColor.withOpacity(0.10),
//                     offset: const Offset(0, 4),
//                     blurRadius: 6,
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                 children: [
//                   Text(
//                     'attendanceHistory2'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kBlackColor,
//
//                     ),
//                   ),
//                   SizedBox(height: getHeight(10),),
//                   Text(
//                     'attendanceHistory3'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       fontSize: getFont(14),
//                       color: AppColors.kCoolGreyColor,
//
//                     ),
//                   ),
//                   SizedBox(height: getHeight(5),),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InputTextField(
//                         width: getWidth(150),
//                         contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
//                         keyBoardType: TextInputType.emailAddress,
//                         readOnly: true,
//                         hintText: 'attendanceHistory4'.tr,
//                         borderSideColor: AppColors.kLightCoolGreyColor,
//                         textFormFieldColor: AppColors.kWhiteColor,
//                       ),
//                       InputTextField(
//                         width: getWidth(150),
//                         contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
//                         keyBoardType: TextInputType.emailAddress,
//                         readOnly: true,
//                         hintText: 'attendanceHistory5'.tr,
//                         borderSideColor: AppColors.kLightCoolGreyColor,
//                         textFormFieldColor: AppColors.kWhiteColor,
//                       ),
//                       Icon(Icons.calendar_today_outlined, color: AppColors.kBlackColor,size: 18,)
//
//                     ],
//                   ),
//                   SizedBox(height: getHeight(10),),
//                   Text(
//                     'attendanceHistory6'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       fontSize: getFont(14),
//                       color: AppColors.kCoolGreyColor,
//
//                     ),
//                   ),
//                   SizedBox(height: getHeight(5),),
//                   CustomDropdownField(
//                     width: getWidth(309),
//                     contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
//                     hintText: 'attendanceHistory7'.tr,
//                     hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor),
//                     borderSideColor: AppColors.kLightCoolGreyColor,
//                     borderRadius: 8,
//                     items:   ['attendanceHistory7'.tr, 'attendanceHistory7'.tr],
//                     dropdownFieldColor: AppColors.kWhiteColor,
//                     suffixIcon: Image.asset(AppImages.dropDownIcon),
//                   ),
//                   SizedBox(height: getHeight(20),),
//                   Row(
//                     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       RoundButton(
//                         onPress: (){},
//                         radius: BorderRadius.circular(8),
//                         title: 'attendanceHistory8'.tr,
//                         textStyle: kSize16W400KWhiteColorOutfitRegular,
//                         buttonColor: AppColors.kSkyBlueColor,
//                         width: getWidth(230),
//                         height: getHeight(38),
//
//                       ),
//                       SizedBox(width: getWidth(10),),
//
//                       RoundButton(
//                         onPress: (){},
//                         radius: BorderRadius.circular(8),
//                         title: 'attendanceHistory9'.tr,
//                         textStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                           fontSize: getFont(14),
//                           color: AppColors.kCoolGreyColor,
//
//                         ),
//                         buttonColor: AppColors.kBlackColor.withOpacity(0),
//                         borderColor: AppColors.kLightCoolGreyColor,
//                         width: getWidth(70),
//                         height: getHeight(38),
//
//                       ),
//
//                     ],
//                   )
//
//
//                 ],
//               ),
//             ),
//             SizedBox(height: getHeight(20),),
//             Container(
//               padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(18), vertical: getHeight(18)),
//               width: getWidth(362),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   AppColors.kAliceBlue,
//                   AppColors.kLavenderBlue,
//                 ]),
//                 borderRadius: BorderRadius.all(Radius.circular(12)),
//                 border: Border.all(color: AppColors.kLightBlueColor, width: 1),
//               ),
//               child: Column(
//                // crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'attendanceHistory10'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kDarkSlateGray,
//
//                     ),
//                   ),Text(
//                     'attendanceHistory11'.tr,
//                     style: kSize20W700KWhiteColorOutfitBold.copyWith(
//                       fontSize: getFont(32),
//                       color: AppColors.kRoyalBlue,
//
//                     ),
//                   ),
//                   Text(
//                     'attendanceHistory12'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       fontSize: getFont(13),
//                       color: AppColors.kSlateGray,
//
//                     ),
//                   ),
//
//
//
//                 ],
//               ),
//             ),
//             SizedBox(height: getHeight(20),),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'attendanceHistory13'.tr,
//                   style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                     fontSize: getFont(20),
//                     color: AppColors.kMidnightBlueColor,
//
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: getHeight(5),),
//
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'attendanceHistory14'.tr,
//                   style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                     color: AppColors.kMidnightBlueColor,
//
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: getHeight(20),),
//             reuseContainer(),
//             reuseContainer(),
//             reuseContainer(),
//             reuseContainer(),
//             reuseContainer(),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'attendanceHistory22'.tr,
//                   style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                     color: AppColors.kMidnightBlueColor,
//
//                   ),
//                 ),
//               ),
//             ),
//             reuseContainer(),
//             reuseContainer(),
//             reuseContainer(),
//             reuseContainer(),
//             reuseContainer(),
//             reuseContainer(),
//             SizedBox(height: getHeight(30),),
//
//             RoundButton(
//               onPress: (){},
//               radius: BorderRadius.circular(12),
//               title: 'attendanceHistory23'.tr,
//               textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
//               buttonColor: AppColors.kSkyBlueColor,
//               width: getWidth(343),
//               height: getHeight(64),
//
//             ),
//
//             SizedBox(height: getHeight(50),),
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
//   Widget reuseContainer() {
//     return GestureDetector(
//       onTap: (){
//         Get.toNamed(RouteName.attendanceDetailsScreen);
//
//       },
//       child: Container(
//         padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(25)),
//         margin: EdgeInsetsGeometry.only(bottom: getHeight(10)),
//         width: getWidth(362),
//         decoration: BoxDecoration(
//           color: AppColors.kWhiteColor,
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//           border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.kBlackColor.withOpacity(0.10),
//               offset: const Offset(0, 10),
//               blurRadius: 15,
//               spreadRadius: 0,
//             ),
//
//             BoxShadow(
//               color: AppColors.kBlackColor.withOpacity(0.10),
//               offset: const Offset(0, 4),
//               blurRadius: 6,
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'attendanceHistory15'.tr,
//               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                 color: AppColors.kMidnightBlueColor,
//
//               ),
//             ),
//             SizedBox(height: getHeight(5),),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(AppImages.qrScreenIcon1, color: AppColors.kRedColor,),
//                     SizedBox(width: getWidth(5),),
//
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                               text: "attendanceHistory16".tr,
//                               style: kSize16W400KWhiteColorOutfitRegular.copyWith(color: AppColors.kCoolGreyColor, fontSize: getFont(14))
//                           ),
//                           TextSpan(
//                             text: "attendanceHistory17".tr,
//                             style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                               color: AppColors.kMidnightBlueColor,
//
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(AppImages.qrScreenIcon1, color: AppColors.kGreenColor,),
//                     SizedBox(width: getWidth(5),),
//
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                               text: "attendanceHistory18".tr,
//                               style: kSize16W400KWhiteColorOutfitRegular.copyWith(color: AppColors.kCoolGreyColor, fontSize: getFont(14))
//                           ),
//                           TextSpan(
//                             text: "attendanceHistory19".tr,
//                             style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                               color: AppColors.kMidnightBlueColor,
//
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//
//                   ],
//                 ),
//
//
//               ],
//             ),
//             SizedBox(height: getHeight(5),),
//
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                       text: "attendanceHistory20".tr,
//                       style: kSize16W400KWhiteColorOutfitRegular.copyWith(color: AppColors.kCoolGreyColor, fontSize: getFont(14))
//                   ),
//                   TextSpan(
//                     text: "attendanceHistory21".tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kMidnightBlueColor,
//
//                     ),
//                   ),
//                 ],
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//
//   }
// }
import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/text_style.dart';
import '../../../helper/routes/routes_name.dart';
import '../../../view_model/controller/home/attendance/get_attendance_history_controller.dart';
import '../../base/custom_drop_down.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  AttendanceHistoryScreen({super.key});

  final GetAttendanceHistoryController controller =
  Get.put(GetAttendanceHistoryController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            TopHeader(title: 'attendanceHistory1'.tr),
            SizedBox(height: getHeight(30),),
            Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(16)),
              width: getWidth(373),
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
                    'attendanceHistory2'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kBlackColor,

                    ),
                  ),
                  SizedBox(height: getHeight(10),),
                  Text(
                    'attendanceHistory3'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      fontSize: getFont(14),
                      color: AppColors.kCoolGreyColor,

                    ),
                  ),
                  SizedBox(height: getHeight(5),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputTextField(
                        width: getWidth(150),
                        contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                        keyBoardType: TextInputType.emailAddress,
                        readOnly: true,
                        hintText: 'attendanceHistory4'.tr,
                        borderSideColor: AppColors.kLightCoolGreyColor,
                        textFormFieldColor: AppColors.kWhiteColor,
                      ),
                      InputTextField(
                        width: getWidth(150),
                        contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                        keyBoardType: TextInputType.emailAddress,
                        readOnly: true,
                        hintText: 'attendanceHistory5'.tr,
                        borderSideColor: AppColors.kLightCoolGreyColor,
                        textFormFieldColor: AppColors.kWhiteColor,
                      ),
                      Icon(Icons.calendar_today_outlined, color: AppColors.kBlackColor,size: 18,)

                    ],
                  ),
                  SizedBox(height: getHeight(10),),
                  Text(
                    'attendanceHistory6'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      fontSize: getFont(14),
                      color: AppColors.kCoolGreyColor,

                    ),
                  ),
                  SizedBox(height: getHeight(5),),
                  CustomDropdownField(
                    width: getWidth(309),
                    contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                    hintText: 'attendanceHistory7'.tr,
                    hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor),
                    borderSideColor: AppColors.kLightCoolGreyColor,
                    borderRadius: 8,
                    items:   ['attendanceHistory7'.tr, 'attendanceHistory7'.tr],
                    dropdownFieldColor: AppColors.kWhiteColor,
                    suffixIcon: Image.asset(AppImages.dropDownIcon),
                  ),
                  SizedBox(height: getHeight(20),),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundButton(
                        onPress: (){},
                        radius: BorderRadius.circular(8),
                        title: 'attendanceHistory8'.tr,
                        textStyle: kSize16W400KWhiteColorOutfitRegular,
                        buttonColor: AppColors.kSkyBlueColor,
                        width: getWidth(230),
                        height: getHeight(38),

                      ),
                      SizedBox(width: getWidth(10),),

                      RoundButton(
                        onPress: (){},
                        radius: BorderRadius.circular(8),
                        title: 'attendanceHistory9'.tr,
                        textStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(
                          fontSize: getFont(14),
                          color: AppColors.kCoolGreyColor,

                        ),
                        buttonColor: AppColors.kBlackColor.withOpacity(0),
                        borderColor: AppColors.kLightCoolGreyColor,
                        width: getWidth(70),
                        height: getHeight(38),

                      ),

                    ],
                  )


                ],
              ),
            ),
            SizedBox(height: getHeight(20),),
            Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(18), vertical: getHeight(18)),
              width: getWidth(362),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.kAliceBlue,
                  AppColors.kLavenderBlue,
                ]),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: AppColors.kLightBlueColor, width: 1),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'attendanceHistory10'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kDarkSlateGray,

                    ),
                  ),Text(
                    'attendanceHistory11'.tr,
                    style: kSize20W700KWhiteColorOutfitBold.copyWith(
                      fontSize: getFont(32),
                      color: AppColors.kRoyalBlue,

                    ),
                  ),
                  Text(
                    'attendanceHistory12'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      fontSize: getFont(13),
                      color: AppColors.kSlateGray,

                    ),
                  ),



                ],
              ),
            ),
            SizedBox(height: getHeight(20),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'attendanceHistory13'.tr,
                  style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                    fontSize: getFont(20),
                    color: AppColors.kMidnightBlueColor,

                  ),
                ),
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(top: getHeight(50)),
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.attendanceList.isEmpty) {
                return Padding(
                  padding: EdgeInsets.only(top: getHeight(50)),
                  child: Text(
                    "No attendance found",
                    style: kSize16W400KWhiteColorOutfitRegular,
                  ),
                );
              }

              return Column(
                children: controller.groupedByDate.entries.map((entry) {
                  final date = entry.key;
                  final records = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: getWidth(5), vertical: getHeight(10)),
                        child: Text(
                          controller.formatShortDate(date),
                          style:
                          kSize16W400KWhiteColorOutfitRegular.copyWith(
                            color: AppColors.kMidnightBlueColor,
                          ),
                        ),
                      ),

                      ...records.map(
                            (record) => reuseContainer(record),
                      ),
                    ],
                  );
                }).toList(),
              );
            }),
            SizedBox(height: getHeight(50),),

            RoundButton(
              onPress: (){},
              radius: BorderRadius.circular(12),
              title: 'attendanceHistory23'.tr,
              textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
              buttonColor: AppColors.kSkyBlueColor,
              width: getWidth(343),
              height: getHeight(64),

            ),

            SizedBox(height: getHeight(50),),

          ],
        ),
      ),
    );
  }


  Widget reuseContainer(record) {
    return GestureDetector(
      onTap: () {
        controller.openLocation(
          record.latitude,
          record.longitude,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(16),
          vertical: getHeight(25),
        ),
        margin: EdgeInsets.only(bottom: getHeight(10)),
        width: getWidth(362),
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.kLightCoolGreyColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlackColor.withOpacity(0.10),
              offset: Offset(0, 10),
              blurRadius: 15,
            ),
            BoxShadow(
              color: AppColors.kBlackColor.withOpacity(0.10),
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              record.workplace?.address ?? '--',
              style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                color: AppColors.kMidnightBlueColor,
              ),
            ),

            SizedBox(height: getHeight(5)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Image.asset(
                      AppImages.qrScreenIcon1,
                      color: AppColors.kRedColor,
                    ),
                    SizedBox(width: getWidth(5)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Check In: ",
                            style:
                            kSize16W400KWhiteColorOutfitRegular.copyWith(
                              color: AppColors.kCoolGreyColor,
                              fontSize: getFont(14),
                            ),
                          ),
                          TextSpan(
                            text: controller.formatTime24To12(
                              record.checkInTime,
                            ),
                            style:
                            kSize16W400KWhiteColorOutfitRegular.copyWith(
                              color: AppColors.kMidnightBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// CHECK OUT
                Row(
                  children: [
                    Image.asset(
                      AppImages.qrScreenIcon1,
                      color: AppColors.kGreenColor,
                    ),
                    SizedBox(width: getWidth(5)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Check Out: ",
                            style:
                            kSize16W400KWhiteColorOutfitRegular.copyWith(
                              color: AppColors.kCoolGreyColor,
                              fontSize: getFont(14),
                            ),
                          ),
                          TextSpan(
                            text: controller.formatTime24To12(
                              record.checkOutTime,
                            ),
                            style:
                            kSize16W400KWhiteColorOutfitRegular.copyWith(
                              color: AppColors.kMidnightBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: getHeight(5)),

            /// ⏱ TOTAL HOURS
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Total hours: ",
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kCoolGreyColor,
                      fontSize: getFont(14),
                    ),
                  ),
                  TextSpan(
                    text: controller.calculateTotalHours(
                      record.checkInTime,
                      record.checkOutTime,
                    ),
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kMidnightBlueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
