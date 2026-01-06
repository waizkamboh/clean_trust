import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/app_util.dart';
import '../../../../util/text_style.dart';
import '../../../../view_model/controller/home/attendance/manual_attendance_entry_controller.dart';
import '../../../../view_model/controller/leave_request/leave_request_controller.dart';
import '../../../base/input_text_field.dart';
import '../../../base/round_button.dart';


class LeaveRequestScreen extends StatelessWidget {
   LeaveRequestScreen({super.key});
  LeaveRequestController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'leaveRequest1'.tr),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(29)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(30)),
                    _requestTimeCard(),
                    SizedBox(height: getHeight(20)),
                    Text(
                      'leaveRequest6'.tr,
                      style: kSize14W500kForestGreenColorInterMedium.copyWith(
                        color: AppColors.kDarkSlateGray,
                      ),
                    ),
                    SizedBox(height: getHeight(10)),
                    Obx(() {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            leaveTypeContainer(
                                controller, Image.asset(AppImages.leaveRequestIcon1), 'sick'),
                            leaveTypeContainer(
                                controller, Image.asset(AppImages.leaveRequestIcon2), 'vacation'),
                            leaveTypeContainer(
                                controller, Icon(Icons.person, size: 18,color: AppColors.kCoolGreyColor,), 'personal'),
                            leaveTypeContainer(
                                controller, Image.asset(AppImages.leaveRequestIcon3), 'other'),
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: getHeight(30)),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'leaveRequest10'.tr,
                              style: kSize14W500kForestGreenColorInterMedium.copyWith(
                                color: AppColors.kDarkSlateGray,
                              ),
                            ),
                            SizedBox(height: getHeight(5)),

                            InputTextField(
                              height: getHeight(48),
                              width: getWidth(163.5),
                              myController: controller.startDateController.value,
                              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                              onTap: ()=> datePicker(controller: controller.startDateController.value),
                              readOnly: true,
                              suffixIcon: Image.asset(AppImages.leaveRequestIcon4),
                              keyBoardType: TextInputType.datetime,
                              borderRadius: 8,
                              obscureText: false,
                              hintText: 'leaveRequest13'.tr,
                              hintTextStyle: kSize17W400KCharcoalBlackColorInterRegular
                                  .copyWith(
                                  fontSize: getFont(13),
                                  color: AppColors.kBlackColor),
                              borderSideColor: AppColors.kLightCoolGray,
                              textFormFieldColor: AppColors.kWhiteColor,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'leaveRequest12'.tr,
                              style: kSize14W500kForestGreenColorInterMedium.copyWith(
                                color: AppColors.kDarkSlateGray,
                              ),
                            ),

                            SizedBox(height: getHeight(5)),

                            InputTextField(
                              height: getHeight(48),
                              width: getWidth(163.5),
                              myController: controller.endDateController.value,
                              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                              onTap: ()=> datePicker(controller: controller.endDateController.value),
                              readOnly: true,
                              suffixIcon: Image.asset(AppImages.leaveRequestIcon4),
                              keyBoardType: TextInputType.datetime,
                              borderRadius: 8,
                              obscureText: false,
                              hintText: 'leaveRequest13'.tr,
                              hintTextStyle: kSize17W400KCharcoalBlackColorInterRegular
                                  .copyWith(
                                  fontSize: getFont(13),
                                  color: AppColors.kBlackColor),
                              borderSideColor: AppColors.kLightCoolGray,
                              textFormFieldColor: AppColors.kWhiteColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(30)),

                    Text(
                      'leaveRequest14'.tr,
                      style: kSize14W500kForestGreenColorInterMedium.copyWith(
                        color: AppColors.kDarkSlateGray,
                      ),
                    ),
                    SizedBox(height: getHeight(5)),

                    InputTextField(
                      height: getHeight(96),
                      myController: controller.reasonController.value,
                      width: getWidth(343),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20), vertical: getHeight(12)),
                      keyBoardType: TextInputType.text,
                      borderRadius: 8,
                      maxLines: 4,
                      obscureText: false,
                      hintText: 'leaveRequest14'.tr,
                      hintTextStyle:kSize17W400KCharcoalBlackColorInterRegular
                          .copyWith(
                          fontSize: getFont(13),
                          color: AppColors.kBlackColor),
                      borderSideColor: AppColors.kLightCoolGray,
                      textFormFieldColor: AppColors.kWhiteColor,
                    ),
                    SizedBox(height: getHeight(30)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "leaveRequest15".tr,
                            style: kSize14W500kForestGreenColorInterMedium.copyWith(
                              color: AppColors.kDarkSlateGray,
                            ),
                          ),
                          TextSpan(
                            text: "leaveRequest16".tr,
                            style: kSize14W500kForestGreenColorInterMedium.copyWith(
                              color: AppColors.kMediumGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: getHeight(10)),
                    Obx(()=>
                        GestureDetector(
                          onTap: controller.pickDocuments,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(16), vertical: getHeight(34)),
                            width: getWidth(343),
                            decoration: BoxDecoration(
                              color: AppColors.kBlackColor.withOpacity(0),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: AppColors.kLightCoolGray, width: 2),
                            ),
                            child: Column(
                              children: [
                                Image.asset(AppImages.leaveRequestIcon5),
                                Text(
                                  controller.documents.isEmpty
                                      ? 'leaveRequest17'.tr
                                      : '${controller.documents.length} file(s) selected',
                                  style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                      fontSize: getFont(14), color: AppColors.kSlateGray),
                                ),
                                Text(
                                  'leaveRequest18'.tr,
                                  style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                                      fontSize: getFont(12), color: AppColors.kMediumGrey),
                                ),
                              ],
                            ),
                          ),
                        ),),


                    // Container(
                    //   padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(34)),
                    //   width: getWidth(343),
                    //   decoration: BoxDecoration(
                    //     color: AppColors.kWhiteColor,
                    //     borderRadius: BorderRadius.all(Radius.circular(8)),
                    //
                    //     border: Border.all(color: AppColors.kLightCoolGray, width: 2),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Image.asset(AppImages.leaveRequestIcon5),
                    //       Text(
                    //         'leaveRequest17'.tr,
                    //         style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                    //           fontSize: getFont(14),
                    //           color: AppColors.kSlateGray,
                    //         ),
                    //       ),
                    //       Text(
                    //         'leaveRequest18'.tr,
                    //         style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                    //           fontSize: getFont(12),
                    //           color: AppColors.kCoolGreyColor,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: getHeight(60)),
                    Obx((){
                      return RoundButton(
                        loading: controller.loading.value,
                        onPress: controller.submitLeaveRequest,
                        radius: BorderRadius.circular(12),
                        title: 'leaveRequest19'.tr,
                        textStyle: kSize16W600kMidnightBlueColorInterSemiBold
                            .copyWith(color: AppColors.kWhiteColor),
                        buttonColor: AppColors.kSkyBlueColor,
                        width: getWidth(343),
                        height: getHeight(56),
                      );

                    }),
                    SizedBox(height: getHeight(30)),












                  ],
                ),
              ),

            ),
          )



        ],
      ),
    );
  }

  Widget leaveTypeContainer(
      LeaveRequestController controller, Widget image, String type) {
    return GestureDetector(
      onTap: () {
        controller.selectedLeaveType.value = type;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: getHeight(14)),
        margin: EdgeInsets.only(right: getWidth(5)),
        width: getWidth(109),
        height: getHeight(86),
        decoration: BoxDecoration(
          color: controller.selectedLeaveType.value == type
              ? AppColors.kSkyBlueColor
              : AppColors.kWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.kLightCoolGreyColor, width: 2),
        ),
        child: Column(
          children: [
            image,
            Text(
              type == 'sick'
                  ? 'leaveRequest7'.tr
                  : type == 'vacation'
                  ? 'leaveRequest8'.tr
                  : type == 'personal'
                  ? 'leaveRequest11'.tr
                  : 'leaveRequest9'.tr,
              style: kSize14W500kForestGreenColorInterMedium.copyWith(
                  color: controller.selectedLeaveType.value == type
                      ? AppColors.kWhiteColor
                      : AppColors.kDarkSlateGray,
                   fontSize: getFont(12)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _requestTimeCard(){
  return Container(
    padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(34)),
    width: getWidth(343),
    decoration: BoxDecoration(
      color: AppColors.kAliceBlue,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
    ),
    child: Row(
      children: [
        Container(
          width: getWidth(36),
          height: getHeight(34),
          decoration: BoxDecoration(
            color: AppColors.kSkyBlueColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
          ),
          child: Icon(Icons.calendar_month_outlined, color: AppColors.kWhiteColor,weight: 12.54,),

        ),
        SizedBox(width: getWidth(20)),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'leaveRequest4'.tr,
                style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                  color: AppColors.darkSlateBlue,
                ),
              ),

              Text(
                'leaveRequest5'.tr,
                style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                    color: AppColors.kSlateGray,
                    fontSize: getFont(14)
                ),
              ),
            ],
          ),
        ),





      ],
    ),
  );

}


// }
// import 'dart:io';
// import 'package:clean_trust/util/app_colors.dart';
// import 'package:clean_trust/util/app_images.dart';
// import 'package:clean_trust/util/size_config.dart';
// import 'package:clean_trust/view/base/top_header.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../util/text_style.dart';
// import '../../../view_model/controller/home/attendance/manual_attendance_entry_controller.dart';
// import '../../../view_model/controller/leave_request/leave_request_controller.dart';
// import '../../base/input_text_field.dart';
// import '../../base/round_button.dart';
//
// class LeaveRequestScreen extends StatelessWidget {
//   const LeaveRequestScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//
//     return Scaffold(
//       backgroundColor: AppColors.kWhiteColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TopHeader(title: 'leaveRequest1'.tr),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: getWidth(29)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: getHeight(20)),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: getWidth(16), vertical: getHeight(34)),
//                     width: getWidth(343),
//                     decoration: BoxDecoration(
//                       color: AppColors.kAliceBlue,
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                       border:
//                       Border.all(color: AppColors.kLightCoolGreyColor, width: 1),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: getWidth(36),
//                           height: getHeight(34),
//                           decoration: BoxDecoration(
//                             color: AppColors.kSkyBlueColor,
//                             borderRadius: BorderRadius.all(Radius.circular(8)),
//                             border: Border.all(
//                                 color: AppColors.kLightCoolGreyColor, width: 1),
//                           ),
//                           child: Icon(
//                             Icons.calendar_month_outlined,
//                             color: AppColors.kWhiteColor,
//                           ),
//                         ),
//                         SizedBox(width: getWidth(10)),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'leaveRequest4'.tr,
//                               style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                                 color: AppColors.kBlackColor,
//                               ),
//                             ),
//                             Text(
//                               'leaveRequest5'.tr,
//                               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                                   color: AppColors.kSlateGray, fontSize: getFont(14)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: getHeight(20)),
//                   Text(
//                     'leaveRequest6'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kDarkSlateGray,
//                     ),
//                   ),
//                   SizedBox(height: getHeight(10)),
//
//                   /// LEAVE TYPE ROW
//
//                   SizedBox(height: getHeight(20)),
//
//                   /// IF OTHER SELECTED SHOW TEXTFIELD
//
//                   /// Rest of your UI unchanged
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'leaveRequest10'.tr,
//                             style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                               color: AppColors.kDarkSlateGray,
//                             ),
//                           ),
//                           SizedBox(height: getHeight(5)),
//                           InputTextField(
//                             height: getHeight(48),
//                             width: getWidth(164),
//                             myController: controller.startDateController.value,
//                             contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
//                             onTap: ()=> manualAttendanceEntryController.datePicker(),
//                             readOnly: true,
//                             suffixIcon: Image.asset(AppImages.leaveRequestIcon4),
//                             keyBoardType: TextInputType.datetime,
//                             borderRadius: 8,
//                             obscureText: false,
//                             hintText: 'leaveRequest11'.tr,
//                             hintTextStyle: kSize16W400KWhiteColorOutfitRegular
//                                 .copyWith(
//                                 fontSize: getFont(13),
//                                 color: AppColors.kBlackColor),
//                             borderSideColor: AppColors.kLightCoolGray,
//                             textFormFieldColor: AppColors.kWhiteColor,
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'leaveRequest12'.tr,
//                             style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                               color: AppColors.kDarkSlateGray,
//                             ),
//                           ),
//                           SizedBox(height: getHeight(5)),
//                           InputTextField(
//                             myController: controller.endDateController.value,
//                             height: getHeight(48),
//                             width: getWidth(164),
//                             contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
//                             suffixIcon: Image.asset(AppImages.leaveRequestIcon4),
//                             onTap: ()=> manualAttendanceEntryController.datePicker(),
//                             readOnly: true,
//                             keyBoardType: TextInputType.datetime,
//                             borderRadius: 8,
//                             obscureText: false,
//                             hintText: 'leaveRequest13'.tr,
//                             hintTextStyle: kSize16W400KWhiteColorOutfitRegular
//                                 .copyWith(
//                                 fontSize: getFont(13),
//                                 color: AppColors.kBlackColor),
//                             borderSideColor: AppColors.kLightCoolGray,
//                             textFormFieldColor: AppColors.kWhiteColor,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: getHeight(20)),
//                   /// REASON TEXTFIELD
//                   Text(
//                     'leaveRequest14'.tr,
//                     style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                       color: AppColors.kDarkSlateGray,
//                     ),
//                   ),
//                   SizedBox(height: getHeight(5)),
//                   InputTextField(
//                     height: getHeight(96),
//                     width: getWidth(343),
//                     contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
//                     onValidator: (_) => null,
//                     keyBoardType: TextInputType.text,
//                     borderRadius: 8,
//                     maxLines: 4,
//                     obscureText: false,
//                     hintText: 'leaveRequest14'.tr,
//                     hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                         fontSize: getFont(13), color: AppColors.kBlackColor),
//                     borderSideColor: AppColors.kLightCoolGray,
//                     textFormFieldColor: AppColors.kWhiteColor,
//                     myController: controller.reasonController.value,
//                   ),
//
//                   SizedBox(height: getHeight(20)),
//
//                   /// DOCUMENT PICKER
//
//                   SizedBox(height: getHeight(30)),
//
//                   /// SUBMIT BUTTON
//
//
//                   SizedBox(height: getHeight(50)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// LEAVE TYPE BUTTONS
//
// }
