import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view/screens/auth/component/auth_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                TopHeader(title: 'EditProfileScreen1'.tr),
                Positioned(
                  top: 110,
                  left: 130,

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: getWidth(140),
                        height: getHeight(140),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            color: AppColors.kLightCoolGreyColor,
                            width: 4,
                          ),

                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 10,
                        child: Container(
                          width: getWidth(32),
                          height: getHeight(32),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kSkyBlueColor,
                          ),
                          child:  Icon(
                            Icons.camera_alt,
                            size: 14,
                            color: AppColors.kWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: getHeight(130),),
            InputTextField(
              //height: getHeight(42),
              //myController: controller.emailController,
              width: getWidth(333),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              //myController: signUpC.nameSignupController.value,
              //focusNode: signUpC.nameSignupFocusNode.value,
              // onFiledSubmittedValue: (value){
              //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
              // },
              onValidator: (email){
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
              readOnly: true,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              obscureText: false,
              hintText: 'EditProfileScreen2'.tr,
              labelText: 'EditProfileScreen3'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(20),),
            InputTextField(
              //height: getHeight(42),
              //myController: controller.emailController,
              width: getWidth(333),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              //myController: signUpC.nameSignupController.value,
              //focusNode: signUpC.nameSignupFocusNode.value,
              // onFiledSubmittedValue: (value){
              //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
              // },
              onValidator: (email){
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              obscureText: false,
              hintText: 'EditProfileScreen4'.tr,
              labelText: 'EditProfileScreen5'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(20),),
            InputTextField(
              //height: getHeight(42),
              //myController: controller.emailController,
              width: getWidth(333),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              //myController: signUpC.nameSignupController.value,
              //focusNode: signUpC.nameSignupFocusNode.value,
              // onFiledSubmittedValue: (value){
              //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
              // },
              onValidator: (email){
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
              readOnly: true,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              obscureText: false,
              hintText: 'EditProfileScreen6'.tr,
              labelText: 'EditProfileScreen6'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(20),),
            InputTextField(
              //height: getHeight(42),
              //myController: controller.emailController,
              width: getWidth(333),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              //myController: signUpC.nameSignupController.value,
              //focusNode: signUpC.nameSignupFocusNode.value,
              // onFiledSubmittedValue: (value){
              //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
              // },
              onValidator: (email){
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
              readOnly: true,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              obscureText: false,
              hintText: 'EditProfileScreen7'.tr,
              labelText: 'EditProfileScreen7'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(20),),
            InputTextField(
              //height: getHeight(42),
              //myController: controller.emailController,
              width: getWidth(333),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              //myController: signUpC.nameSignupController.value,
              //focusNode: signUpC.nameSignupFocusNode.value,
              // onFiledSubmittedValue: (value){
              //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
              // },
              onValidator: (email){
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
              readOnly: true,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              obscureText: false,
              hintText: 'EditProfileScreen8'.tr,
              labelText: 'EditProfileScreen8'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(20),),
            InputTextField(
              //height: getHeight(42),
              //myController: controller.emailController,
              width: getWidth(333),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              //myController: signUpC.nameSignupController.value,
              //focusNode: signUpC.nameSignupFocusNode.value,
              // onFiledSubmittedValue: (value){
              //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
              // },
              onValidator: (email){
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              obscureText: false,
              hintText: 'EditProfileScreen10'.tr,
              labelText: 'EditProfileScreen9'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(20),),
            InputTextField(
              //height: getHeight(42),
              //myController: controller.emailController,
              width: getWidth(333),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              //myController: signUpC.nameSignupController.value,
              //focusNode: signUpC.nameSignupFocusNode.value,
              // onFiledSubmittedValue: (value){
              //   Utils.fieldFocusChange(context, signUpC.nameSignupFocusNode.value, signUpC.emailSignupFocusNode.value);
              // },
              onValidator: (email){
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              obscureText: false,
              hintText: 'EditProfileScreen12'.tr,
              labelText: 'EditProfileScreen11'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(50),),
            RoundButton(
              onPress: (){},
              radius: BorderRadius.circular(12),
              title: 'EditProfileScreen13'.tr,
              textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
              buttonColor: AppColors.kSkyBlueColor,
              width: getWidth(343),
              height: getHeight(56),

            ),
            SizedBox(height: getHeight(50),),






          ]


        ),
      ),
    );
  }

}


