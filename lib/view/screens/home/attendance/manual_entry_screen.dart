import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/app_util.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view_model/controller/home/attendance/manual_attendance_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/routes/routes_name.dart';
import '../../../../util/text_style.dart';
import '../../../../view_model/controller/workplaces/get_workplaces_controller.dart';
import '../../../base/custom_drop_down.dart';
import '../../../base/input_text_field.dart';
import '../../../base/round_button.dart';

class ManualEntryScreen extends StatelessWidget {
  ManualEntryScreen({super.key});
  ManualAttendanceEntryController controller = Get.find();
  final GetWorkplacesController workplaceController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        children: [
          TopHeader(title: 'manualEntry1'.tr),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(31)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(20),),
                    Text(
                      'manualEntry2'.tr,
                      style: kSize24W700kMidnightBlueColorInterBold.copyWith(
                        fontSize: getFont(24),
                        color: AppColors.kMidnightBlueColor,

                      ),
                    ),
                    SizedBox(height: getHeight(5),),

                    Text(
                      'manualEntry3'.tr,
                      style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                        fontSize: getFont(14),
                        color: AppColors.kSlateGray,

                      ),
                    ),

                    SizedBox(height: getHeight(20),),
                    Row(
                      children: [
                        Text(
                          'manualEntry4'.tr,
                          style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                            fontSize: getFont(14),
                            color: AppColors.kDarkSlateGray,

                          ),
                        ),
                        Image.asset(AppImages.starIcon),

                      ],
                    ),
                    SizedBox(height: getHeight(5),),
                    InputTextField(
                      height: getHeight(56),
                      myController: controller.dateController.value,
                      width: getWidth(343),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      readOnly: true,
                      onTap: ()=> datePicker(controller: controller.dateController.value),
                      suffixIcon: Icon(Icons.calendar_today_outlined, color: AppColors.kBlackColor.withOpacity(0.66)),
                      borderRadius: 12,
                      obscureText: false,
                      hintText: 'manualEntry5'.tr,
                      hintTextStyle: kSize17W400KCharcoalBlackColorInterRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),
                      borderSideColor: AppColors.kLightCoolGray,
                      textFormFieldColor: AppColors.kColor1,
                    ),
                    SizedBox(height: getHeight(10),),
                    Row(
                      children: [
                        Text(
                          'manualEntry6'.tr,
                          style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                            fontSize: getFont(14),
                            color: AppColors.kDarkSlateGray,

                          ),
                        ),
                        Image.asset(AppImages.starIcon),

                      ],
                    ),
                    SizedBox(height: getHeight(5),),

              Obx(() {
                return CustomDropdownField(
                  width: getWidth(343),
                  height: getHeight(56),
                  enableSearch: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  hintText: 'manualEntry6'.tr,
                  searchHintText: 'manualEntry18'.tr,
                  hintTextStyle: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                    fontSize: getFont(18),
                    color: AppColors.kBlackColor,
                  ),
                  borderSideColor: AppColors.kLightCoolGray,
                  borderRadius: 12,
                  items: workplaceController.workplaceNames,
                  dropdownFieldColor: AppColors.kColor1,
                  suffixIcon: Image.asset(
                    AppImages.dropDownIcon,
                    color: AppColors.kBlackColor.withOpacity(0.66),
                  ),
                  value: workplaceController.selectedWorkplaceName.value.isEmpty
                      ? null
                      : workplaceController.selectedWorkplaceName.value,

                  onChanged: (value) {
                    workplaceController.onWorkplaceSelected(value);
                  },
                );
              }),


              Text(
                      'manualEntry8'.tr,
                      style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(fontSize: getFont(10), color: AppColors.kBlackColor),
                    ),
                    SizedBox(height: getHeight(30),),
                    Row(
                      children: [
                        Text(
                          'manualEntry9'.tr,
                          style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                            fontSize: getFont(14),
                            color: AppColors.kDarkSlateGray,

                          ),
                        ),
                        Image.asset(AppImages.starIcon),

                      ],
                    ),
                    SizedBox(height: getHeight(5),),
                    InputTextField(
                      height: getHeight(56),
                      myController: controller.checkInController.value,
                      width: getWidth(343),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      onTap: () {
                        controller.selectTime(
                          context: context,
                          controller: controller.checkInController.value,
                        );
                      },
                      readOnly: true,
                      suffixIcon: Image.asset(AppImages.qrScreenIcon3, color: AppColors.kBlackColor.withOpacity(0.66)),
                      keyBoardType: TextInputType.datetime,
                      borderRadius: 12,
                      obscureText: false,
                      hintText: 'manualEntry10'.tr,
                      hintTextStyle: kSize17W400KCharcoalBlackColorInterRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),

                      borderSideColor: AppColors.kLightCoolGray,
                      textFormFieldColor: AppColors.kColor1,
                    ),
                    SizedBox(height: getHeight(10),),
                    Row(
                      children: [
                        Text(
                          'manualEntry11'.tr,
                          style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                            fontSize: getFont(14),
                            color: AppColors.kDarkSlateGray,

                          ),
                        ),
                        Image.asset(AppImages.starIcon),

                      ],
                    ),
                    SizedBox(height: getHeight(5),),
                    InputTextField(
                      height: getHeight(56),
                      myController: controller.checkOutController.value,
                      width: getWidth(343),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      onTap: () {
                        controller.selectTime(
                          context: context,
                          controller: controller.checkOutController.value,
                        );
                      },
                      suffixIcon: Image.asset(AppImages.qrScreenIcon3, color: AppColors.kBlackColor.withOpacity(0.66)),
                      readOnly: true,
                      keyBoardType: TextInputType.datetime,
                      borderRadius: 12,
                      obscureText: false,
                      hintText: 'manualEntry12'.tr,
                      hintTextStyle: kSize17W400KCharcoalBlackColorInterRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),

                      borderSideColor: AppColors.kLightCoolGray,
                      textFormFieldColor: AppColors.kColor1,
                    ),
                    SizedBox(height: getHeight(10),),
                    Row(
                      children: [
                        Text(
                          'manualEntry13'.tr,
                          style: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(
                            fontSize: getFont(14),
                            color: AppColors.kDarkSlateGray,

                          ),
                        ),
                        Image.asset(AppImages.starIcon),

                      ],
                    ),
                    SizedBox(height: getHeight(5),),
                    InputTextField(
                      height: getHeight(126),
                      myController: controller.reasonController.value,
                      width: getWidth(343),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20), vertical: getHeight(12)),
                      keyBoardType: TextInputType.text,
                      maxLines: 4,
                      borderRadius: 12,
                      obscureText: false,
                      hintText: 'manualEntry14'.tr,
                      hintTextStyle: kSize17W400KCharcoalBlackColorInterRegular.copyWith(fontSize: getFont(16), color: AppColors.kLavenderGrey),

                      borderSideColor: AppColors.kLightCoolGray,
                      textFormFieldColor: AppColors.kColor1,
                    ),
                    SizedBox(height: getHeight(10),),
                    Text(
                      'manualEntry15'.tr,
                      style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(fontSize: getFont(12), color: AppColors.kCoolGreyColor),
                    ),
                    SizedBox(height: getHeight(50),),
                    Obx((){
                      return RoundButton(
                        loading: controller.loading.value,

                        onPress: (){
                          controller.submitManualAttendance();

                        },
                        radius: BorderRadius.circular(12),
                        title: controller.isSubmitted.value
                            ? 'manualEntry17'.tr
                            : 'manualEntry16'.tr,
                        textStyle: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(color: AppColors.kWhiteColor,),
                        buttonColor: AppColors.kSkyBlueColor,
                        width: getWidth(343),
                        height: getHeight(56),

                      );


                    }),

                  ],
                ),
              ),
            ),
          ),


          SizedBox(height: getHeight(50),),



        ],
      ),
    );
  }

}
