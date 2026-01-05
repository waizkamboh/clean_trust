import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../helper/internet_check.dart';
import '../../../../util/text_style.dart';
import '../../../../view_model/controller/home/attendance/get_attendance_history_controller.dart';
import '../../../base/custom_drop_down.dart';
import '../../../base/input_text_field.dart';
import '../../../base/round_button.dart';
import 'attendance_details_screen.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  GetAttendanceHistoryController controller = Get.find<GetAttendanceHistoryController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  Future<void> _loadData() async {
    final online = await isOnline();

    if (!online) {
      debugPrint('OFFLINE → API not called');
      return;
    }

    controller.fetchAttendanceHistory();

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [

          TopHeader(title: 'attendanceHistory1'.tr),
          SizedBox(height: getHeight(30),),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                            Obx(()=>
                                InputTextField(
                                  width: getWidth(150),
                                  contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                                  keyBoardType: TextInputType.emailAddress,
                                  readOnly: true,
                                  hintText: controller.fromDate.value == null
                                      ? 'attendanceHistory4'.tr
                                      : DateFormat('yyyy-MM-dd')
                                      .format(controller.fromDate.value!),
                                  borderSideColor: AppColors.kLightCoolGreyColor,
                                  textFormFieldColor: AppColors.kWhiteColor,
                                ),),
                            Obx(()=>
                                InputTextField(
                                  width: getWidth(150),
                                  contentPadding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                                  keyBoardType: TextInputType.emailAddress,
                                  readOnly: true,
                                  hintText: controller.toDate.value == null
                                      ? 'attendanceHistory5'.tr
                                      : DateFormat('yyyy-MM-dd')
                                      .format(controller.toDate.value!),
                                  borderSideColor: AppColors.kLightCoolGreyColor,
                                  textFormFieldColor: AppColors.kWhiteColor,
                                ),),
                            GestureDetector(
                              onTap: controller.pickDateRange,
                              child: Icon(Icons.calendar_today_outlined,
                                  color: AppColors.kBlackColor, size: 20),
                            )


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
                          items:  ['attendanceHistory14'.tr, 'attendanceHistory15'.tr, 'attendanceHistory17'.tr],
                          hintText: 'attendanceHistory7'.tr,
                          onChanged: (value) {
                            controller.selectedStatus.value =
                                value.toString().toLowerCase();
                          },
                          hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor),
                          borderSideColor: AppColors.kLightCoolGreyColor,
                          borderRadius: 8,
                          dropdownFieldColor: AppColors.kWhiteColor,
                          suffixIcon: Image.asset(AppImages.dropDownIcon),
                        ),
                        SizedBox(height: getHeight(20),),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(
                              onPress: (){
                                controller.applyFilter();
                              },
                              radius: BorderRadius.circular(8),
                              title: 'attendanceHistory8'.tr,
                              textStyle: kSize16W400KWhiteColorOutfitRegular,
                              buttonColor: AppColors.kSkyBlueColor,
                              width: getWidth(230),
                              height: getHeight(38),

                            ),
                            SizedBox(width: getWidth(10),),

                            RoundButton(
                              onPress: (){
                                controller.resetFilter();
                              },
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
                        ),
                        Obx(()=>
                            Text(
                              controller.filteredTotalHours.value,
                              style: kSize20W700KWhiteColorOutfitBold.copyWith(
                                fontSize: getFont(32),
                                color: AppColors.kRoyalBlue,

                              ),
                            ),),
                        Obx(()=>
                            Text(
                              controller.filteredDateRangeText.value,
                              style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                fontSize: getFont(13),
                                color: AppColors.kSlateGray,

                              ),
                            ),),



                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(20),),

                  Obx(() {
                    if (controller.isLoading.value) {
                      return Padding(
                        padding: EdgeInsets.only(top: getHeight(50)),
                        child: SpinKitSpinningLines(color: AppColors.kSkyBlueColor),
                      );
                    }

                    if (controller.attendanceList.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: getHeight(40),
                          horizontal: getWidth(20),
                        ),
                        child: Center(
                          child: Text(
                            "attendanceHistory19".tr,
                            textAlign: TextAlign.center,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                              color: AppColors.kCoolGreyColor,
                            ),
                          ),
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


                ],
              ),
            ),
          ),

          // SizedBox(height: getHeight(50),),
          //
          // RoundButton(
          //   onPress: (){},
          //   radius: BorderRadius.circular(12),
          //   title: 'attendanceHistory23'.tr,
          //   textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
          //   buttonColor: AppColors.kSkyBlueColor,
          //   width: getWidth(343),
          //   height: getHeight(64),
          //
          // ),


        ],
      ),
    );
  }

  Widget reuseContainer(record) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AttendanceDetailsScreen(record: record));
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
                            text: "attendanceHistory16".tr,
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
                            text: "attendanceHistory18".tr,
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

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "attendanceHistory20".tr,
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
