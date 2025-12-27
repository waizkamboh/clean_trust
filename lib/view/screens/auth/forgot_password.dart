import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../util/size_config.dart';
import '../../../../../util/text_style.dart';
import '../../../helper/routes/routes_name.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';
import 'component/auth_card.dart';
import 'component/auth_header.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          AuthHeader(),
          SingleChildScrollView(
            child: Column(
              children: [
                AuthCard(
                    size: getHeight(180),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: getWidth(17)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getHeight(34)),
                          Text(
                            'forgotPassword1'.tr,
                            style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
                          ),
                          Text(
                            'forgotPassword2'.tr,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(color: AppColors.kBlackColor),
                          ),
                          SizedBox(height: getHeight(30)),
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
                            hintText: 'forgotPassword4'.tr,
                            labelText: 'forgotPassword3'.tr,
                            borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                            textFormFieldColor: AppColors.kWhiteColor,
                          ),
                      
                          SizedBox(height: getHeight(80)),
                          RoundButton(
                            onPress: (){
                             // Get.toNamed(RouteName.confirmPasswordScreen);

                            },
                            radius: BorderRadius.circular(8),
                            title: 'forgotPassword5'.tr,
                            textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14.11), color: AppColors.kWhiteColor),
                            buttonColor: AppColors.kSkyBlueColor,
                            width: getWidth(269),
                            height: getHeight(44),
                      
                          ),
                          SizedBox(height: getHeight(100),),
                      
                      
                      
                        ],
                      ),
                    )
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
