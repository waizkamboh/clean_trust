import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/text_style.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';

class LeaveRequestScreen extends StatelessWidget {
  const LeaveRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(title: 'leaveRequest1'.tr),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(29)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getHeight(20)),
                  Container(
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
                          child: Icon(Icons.calendar_month_outlined, color: AppColors.kWhiteColor,),
        
                        ),
                        SizedBox(width: getWidth(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'leaveRequest4'.tr,
                              style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
                                  color: AppColors.kBlackColor,
                              ),
                            ),
        
                            Text(
                              'leaveRequest5'.tr,
                              style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                                  color: AppColors.kSlateGray,
                                  fontSize: getFont(14)
                              ),
                            ),
                          ],
                        ),
        
        
        
        
        
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Text(
                    'leaveRequest6'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kDarkSlateGray,
                    ),
                  ),
                  SizedBox(height: getHeight(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      reusableContainer(image: AppImages.leaveRequestIcon1, text: 'leaveRequest7'),
                      reusableContainer(image: AppImages.leaveRequestIcon2, text: 'leaveRequest8'),
                      reusableContainer(image: AppImages.leaveRequestIcon3, text: 'leaveRequest9'),
        
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'leaveRequest10'.tr,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                              color: AppColors.kDarkSlateGray,
                            ),
                          ),
                          SizedBox(height: getHeight(5)),
        
                          InputTextField(
                            height: getHeight(48),
                            //myController: controller.emailController,
                            width: getWidth(164),
                            contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                            //myController: signUpC.nameSignupController.value,
                            //focusNode: signUpC.nameSignupFocusNode.value,
                            // onFiledSubmittedValue: (value){
                            //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
                            // },
                            onValidator: (email){
                              return null;
                            },
                            suffixIcon: Image.asset(AppImages.leaveRequestIcon4),
                            keyBoardType: TextInputType.datetime,
                            borderRadius: 8,
                            obscureText: false,
                            hintText: 'leaveRequest11'.tr,
                            hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(13), color: AppColors.kBlackColor),
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
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                              color: AppColors.kDarkSlateGray,
                            ),
                          ),
                          SizedBox(height: getHeight(5)),
        
                          InputTextField(
                            height: getHeight(48),
                            //myController: controller.emailController,
                            width: getWidth(164),
                            contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                            //myController: signUpC.nameSignupController.value,
                            //focusNode: signUpC.nameSignupFocusNode.value,
                            // onFiledSubmittedValue: (value){
                            //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
                            // },
                            onValidator: (email){
                              return null;
                            },
                            suffixIcon: Image.asset(AppImages.leaveRequestIcon4),
                            keyBoardType: TextInputType.datetime,
                            borderRadius: 8,
                            obscureText: false,
                            hintText: 'leaveRequest13'.tr,
                            hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(13), color: AppColors.kBlackColor),
                            borderSideColor: AppColors.kLightCoolGray,
                            textFormFieldColor: AppColors.kWhiteColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
        
                  Text(
                    'leaveRequest14'.tr,
                    style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                      color: AppColors.kDarkSlateGray,
                    ),
                  ),
                  SizedBox(height: getHeight(5)),
        
                  InputTextField(
                    height: getHeight(96),
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
                    keyBoardType: TextInputType.text,
                    borderRadius: 8,
                    maxLines: 4,
                    obscureText: false,
                    hintText: 'leaveRequest14'.tr,
                    hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(13), color: AppColors.kBlackColor),
                    borderSideColor: AppColors.kLightCoolGray,
                    textFormFieldColor: AppColors.kWhiteColor,
                  ),
                  SizedBox(height: getHeight(20)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "leaveRequest15".tr,
                          style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            color: AppColors.kDarkSlateGray,
                          ),
                        ),
                        TextSpan(
                          text: "leaveRequest16".tr,
                          style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            color: AppColors.kCoolGreyColor,

                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: getHeight(5)),
                  Container(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(16), vertical: getHeight(34)),
                    width: getWidth(343),
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
        
                      border: Border.all(color: AppColors.kLightCoolGray, width: 2),
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.leaveRequestIcon5),
                        Text(
                          'leaveRequest17'.tr,
                          style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            fontSize: getFont(14),
                            color: AppColors.kSlateGray,
                          ),
                        ),
                        Text(
                          'leaveRequest18'.tr,
                          style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                            fontSize: getFont(12),
                            color: AppColors.kCoolGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(30)),
                  RoundButton(
                    onPress: (){},
                    radius: BorderRadius.circular(12),
                    title: 'leaveRequest19'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
                    buttonColor: AppColors.kSkyBlueColor,
                    width: getWidth(343),
                    height: getHeight(56),

                  ),











                ],
              ),
            ),
            SizedBox(height: getHeight(50)),


          ],
        ),
      ),
    );
  }
  Widget reusableContainer({
    required String image,
    required String text
}) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric( vertical: getHeight(14)),
      width: getWidth(109),
      height: getHeight(90),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.kLightCoolGreyColor, width: 2),
      ),
      child: Column(
        children: [
          Image.asset(image),
          Text(
            text.tr,
            style: kSize16W400KWhiteColorOutfitRegular.copyWith(
                color: AppColors.kDarkSlateGray,
                fontSize: getFont(14)
            ),
          ),

        ],
      ),
    );

  }
}
