import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view_model/controller/home/attendance/manual_attendance_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/routes/routes_name.dart';
import '../../../util/text_style.dart';
import '../../base/custom_drop_down.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';

class ManualEntryScreen extends StatelessWidget {
   ManualEntryScreen({super.key});
  ManualAttendanceEntryController controller = Get.put(ManualAttendanceEntryController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(title: 'manualEntry1'.tr),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(31)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getHeight(20),),
                  Text(
                    'manualEntry2'.tr,
                    style: kSize20W700KWhiteColorOutfitBold.copyWith(
                      fontSize: getFont(24),
                      color: AppColors.kMidnightBlueColor,
        
                    ),
                  ),
                  Text(
                    'manualEntry3'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      fontSize: getFont(14),
                      color: AppColors.kSlateGray,
        
                    ),
                  ),
        
                  SizedBox(height: getHeight(20),),
                  Row(
                    children: [
                      Text(
                        'manualEntry4'.tr,
                        style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                          fontSize: getFont(14),
                          color: AppColors.kDarkSlateGray,
        
                        ),
                      ),
                      Image.asset(AppImages.starIcon),
        
                    ],
                  ),
                  SizedBox(height: getHeight(5),),
                  InputTextField(
                    height: getHeight(60),
                    myController: controller.dateController.value,
                    width: getWidth(343),
                    contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                    onValidator: (email){
                      return null;
                    },
                    readOnly: true,
                    onTap: ()=> _datePicker(),
                    suffixIcon: Icon(Icons.calendar_today_outlined, color: AppColors.kBlackColor,),
                    keyBoardType: TextInputType.datetime,
                    borderRadius: 12,
                    obscureText: false,
                    hintText: 'manualEntry5'.tr,
                    hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),
                    borderSideColor: AppColors.kLightCoolGray,
                    textFormFieldColor: AppColors.kColor1,
                  ),
                  // SizedBox(height: getHeight(10),),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'manualEntry5'.tr,
                  //       style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                  //         fontSize: getFont(14),
                  //         color: AppColors.kDarkSlateGray,
                  //
                  //       ),
                  //     ),
                  //     Image.asset(AppImages.starIcon),
                  //
                  //   ],
                  // ),
                  // SizedBox(height: getHeight(5),),
                  // CustomDropdownField(
                  //   width: getWidth(343),
                  //   height: getHeight(56),
                  //   contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  //   hintText: 'manualEntry7'.tr,
                  //   hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),
                  //   borderSideColor: AppColors.kLightCoolGray,
                  //   borderRadius: 12,
                  //   items:   ['manualEntry7'.tr, 'manualEntry7'.tr],
                  //   dropdownFieldColor: AppColors.kWhiteColor,
                  //   suffixIcon: Image.asset(AppImages.dropDownIcon),
                  // ),
                  // Text(
                  //   'manualEntry8'.tr,
                  //   style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                  //     fontSize: getFont(10),
                  //     color: AppColors.kBlackColor,
                  //
                  //   ),
                  // ),
                  SizedBox(height: getHeight(10),),
                  Row(
                    children: [
                      Text(
                        'manualEntry9'.tr,
                        style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                          fontSize: getFont(14),
                          color: AppColors.kDarkSlateGray,
        
                        ),
                      ),
                      Image.asset(AppImages.starIcon),
        
                    ],
                  ),
                  SizedBox(height: getHeight(5),),
                  InputTextField(
                    height: getHeight(60),
                    myController: controller.checkInController.value,
                    width: getWidth(343),
                    contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                    onValidator: (email){
                      return null;
                    },
                    suffixIcon: Image.asset(AppImages.qrScreenIcon3, color: AppColors.kBlackColor,),
                    keyBoardType: TextInputType.datetime,
                    borderRadius: 12,
                    obscureText: false,
                    hintText: 'manualEntry10'.tr,
                    hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),
                    borderSideColor: AppColors.kLightCoolGray,
                    textFormFieldColor: AppColors.kColor1,
                  ),
                  SizedBox(height: getHeight(10),),
                  Row(
                    children: [
                      Text(
                        'manualEntry11'.tr,
                        style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                          fontSize: getFont(14),
                          color: AppColors.kDarkSlateGray,
        
                        ),
                      ),
                      Image.asset(AppImages.starIcon),
        
                    ],
                  ),
                  SizedBox(height: getHeight(5),),
                  InputTextField(
                    height: getHeight(60),
                    //myController: controller.emailController,
                    width: getWidth(343),
                    contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                    //myController: signUpC.nameSignupController.value,
                    //focusNode: signUpC.nameSignupFocusNode.value,
                    // onFiledSubmittedValue: (value){
                    //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
                    // },
                    onValidator: (email){
                      return null;
                    },
                    suffixIcon: Image.asset(AppImages.qrScreenIcon3, color: AppColors.kBlackColor,),
                    keyBoardType: TextInputType.datetime,
                    borderRadius: 12,
                    obscureText: false,
                    hintText: 'manualEntry12'.tr,
                    hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),
                    borderSideColor: AppColors.kLightCoolGray,
                    textFormFieldColor: AppColors.kColor1,
                  ),
                  SizedBox(height: getHeight(10),),
                  Row(
                    children: [
                      Text(
                        'manualEntry13'.tr,
                        style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
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
                    //myController: controller.emailController,
                    width: getWidth(343),
                    contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                    //myController: signUpC.nameSignupController.value,
                    //focusNode: signUpC.nameSignupFocusNode.value,
                    // onFiledSubmittedValue: (value){
                    //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
                    // },
                    onValidator: (email){
                      return null;
                    },
                    keyBoardType: TextInputType.datetime,
                    maxLines: 4,
                    borderRadius: 12,
                    obscureText: false,
                    hintText: 'manualEntry14'.tr,
                    hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),
                    borderSideColor: AppColors.kLightCoolGray,
                    textFormFieldColor: AppColors.kColor1,
                  ),
                  Text(
                    'manualEntry15'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      fontSize: getFont(12),
                      color: AppColors.kBlackColor,

                    ),
                  ),
                  SizedBox(height: getHeight(30),),
                  RoundButton(
                    onPress: (){
                      Get.toNamed(RouteName.leaveRequestScreen);

                    },
                    radius: BorderRadius.circular(12),
                    title: 'manualEntry16'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
                    buttonColor: AppColors.kSkyBlueColor,
                    width: getWidth(343),
                    height: getHeight(56),

                  ),
                  SizedBox(height: getHeight(10),),
                  RoundButton(
                    onPress: (){},
                    radius: BorderRadius.circular(12),
                    title: 'manualEntry17'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kBlackColor,),
                    borderColor: AppColors.kLightCoolGreyColor,
                    buttonColor: AppColors.kLightGrayBackground,
                    width: getWidth(343),
                    height: getHeight(56),

                  ),

                ],
              ),
            ),




            SizedBox(height: getHeight(50),),



          ],
        ),
      ),
    );
  }
  Future<void> _datePicker() async {
    DateTime? _picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            // Change the color of the selected date circle
            colorScheme: const ColorScheme.light(primary: AppColors.kBlackColor), // Change the color as per your preference
            // Change the text color of the selected date

          ),
          child: child!,
        );
      },
    );
    if (_picked != null) {
      controller.dateController.value.text = _picked.toString().split(" ")[0];
    }
  }

}
