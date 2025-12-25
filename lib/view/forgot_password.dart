import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import 'base/input_text_field.dart';
import 'base/round_button.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          Container(
            width: getWidth(393),
            height: getHeight(218),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.kGradientColor3,
                    AppColors.kGradientColor4,

                  ]),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
            ),
            child: Image.asset(AppImages.appLogo, width: getWidth(97), height: getHeight(77),),
          ),
          Center(
            child: Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(15)),
              width: getWidth(332),
              height: getHeight(336),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kBlackColor.withOpacity(0.11),
                    offset: const Offset(0, 4),
                    blurRadius: 8.8,
                    spreadRadius: 0,
                  ),

                  BoxShadow(
                    color: AppColors.kBlackColor.withOpacity(0.11),
                    offset: const Offset(0, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: getHeight(34)),
                  Text(
                    'loginScreen1'.tr,
                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
                  ),
                  SizedBox(height: getHeight(10)),
                  Text(
                    'loginScreen1'.tr,
                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
                  ),
                  SizedBox(height: getHeight(40)),
                  InputTextField(
                    //height: getHeight(42),
                    //myController: controller.emailController,
                    width: getWidth(300),
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

                    obscureText: false,
                    hintText: 'loginScreen2'.tr,
                    labelText: 'loginScreen2'.tr,
                    borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                    textFormFieldColor: AppColors.kWhiteColor,
                  ),
                  SizedBox(height: getHeight(50)),
                  RoundButton(
                    onPress: (){},
                    radius: BorderRadius.circular(8),
                    title: 'loginScreen7'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14.11), color: AppColors.kWhiteColor),
                    buttonColor: AppColors.kSkyBlueColor,
                    width: getWidth(269),
                    height: getHeight(44),

                  ),


                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}
