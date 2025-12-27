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

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(title: 'changePasswordScreen1'.tr),
            SizedBox(height: getHeight(40),),
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
              obscureText: true,
              suffixIcon: InkWell(
                splashColor: Colors.transparent,
                // onTap: (){
                //   controller.isPassShow = !controller.isPassShow;
                //   controller.update();
                // },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.kBlackColor.withOpacity(0.66),
                    )
                    // controller.isPassShow
                    //     ? const Icon(
                    //   Icons.remove_red_eye_outlined,
                    //   color: AppColors.kPrimary,
                    // )
                    //     : const Icon(
                    //   Icons.remove_red_eye,
                    //   color: AppColors.kPrimary,
                    // )
                  ],
                ),
              ),
              keyBoardType: TextInputType.emailAddress,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              hintText: 'changePasswordScreen2'.tr,
              labelText: 'changePasswordScreen3'.tr,
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
              obscureText: true,
              suffixIcon: InkWell(
                splashColor: Colors.transparent,
                // onTap: (){
                //   controller.isPassShow = !controller.isPassShow;
                //   controller.update();
                // },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.kBlackColor.withOpacity(0.66),
                    )
                    // controller.isPassShow
                    //     ? const Icon(
                    //   Icons.remove_red_eye_outlined,
                    //   color: AppColors.kPrimary,
                    // )
                    //     : const Icon(
                    //   Icons.remove_red_eye,
                    //   color: AppColors.kPrimary,
                    // )
                  ],
                ),
              ),
              keyBoardType: TextInputType.emailAddress,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              hintText: 'changePasswordScreen3'.tr,
              labelText: 'changePasswordScreen4'.tr,
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
              obscureText: true,
              suffixIcon: InkWell(
                splashColor: Colors.transparent,
                // onTap: (){
                //   controller.isPassShow = !controller.isPassShow;
                //   controller.update();
                // },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.kBlackColor.withOpacity(0.66),
                    )
                    // controller.isPassShow
                    //     ? const Icon(
                    //   Icons.remove_red_eye_outlined,
                    //   color: AppColors.kPrimary,
                    // )
                    //     : const Icon(
                    //   Icons.remove_red_eye,
                    //   color: AppColors.kPrimary,
                    // )
                  ],
                ),
              ),
              keyBoardType: TextInputType.emailAddress,
              labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
              hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
              hintText: 'changePasswordScreen3'.tr,
              labelText: 'changePasswordScreen5'.tr,
              borderRadius: 5,
              borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
              textFormFieldColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: getHeight(100),),
            RoundButton(
              onPress: (){},
              radius: BorderRadius.circular(12),
              title: 'changePasswordScreen6'.tr,
              textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
              buttonColor: AppColors.kSkyBlueColor,
              width: getWidth(343),
              height: getHeight(56),

            ),



          ]



        ),
      ),
    );
  }

}


