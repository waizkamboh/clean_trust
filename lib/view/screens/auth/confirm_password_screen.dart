import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view_model/controller/auth/confirm_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';
import 'component/auth_card.dart';
import 'component/auth_header.dart';
import 'component/social_auth_section.dart';

class ConfirmPasswordScreen extends StatelessWidget {
   ConfirmPasswordScreen({super.key});

  ConfirmPasswordController controller = Get.find<ConfirmPasswordController>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AuthHeader(),
          AuthCard(
             // size: getHeight(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 // SizedBox(height: getHeight(34)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'conformPassword1'.tr,
                      style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Obx(() {
                    return  InputTextField(
                      //height: getHeight(42),
                      myController: controller.passwordController.value,
                      width: getWidth(300),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      focusNode: controller.passwordFocusNode.value,
                      onFiledSubmittedValue: (value){
                        FocusScope.of(context)
                            .requestFocus(controller.confirmPasswordFocusNode.value);

                      },
                      onValidator: (email){
                        return null;
                      },
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: controller.isPasswordHidden.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.isPasswordHidden.toggle();
                        },
                        child: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                        ),
                      ),
                      hintText: 'conformPassword3'.tr,
                      labelText: 'conformPassword2'.tr,
                      borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                      textFormFieldColor: AppColors.kWhiteColor,
                    );

                  }
                  ),

                  SizedBox(height: getHeight(20)),
                  Obx(() {
                    return  InputTextField(
                      //height: getHeight(42),
                      myController: controller.confirmPasswordController.value,
                      width: getWidth(300),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      focusNode: controller.confirmPasswordFocusNode.value,
                      onFiledSubmittedValue: (value){

                      },
                      onValidator: (email){
                        return null;
                      },
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: controller.isPasswordHidden1.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.isPasswordHidden1.toggle();
                        },
                        child: Icon(
                          controller.isPasswordHidden1.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                        ),
                      ),
                      hintText: 'conformPassword3'.tr,
                      labelText: 'conformPassword4'.tr,
                      borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                      textFormFieldColor: AppColors.kWhiteColor,
                    );

                  }
                  ),
                  SizedBox(height: getHeight(40)),

                  RoundButton(
                    loading: controller.loading.value,
                    onPress: (){
                      controller.resetPasswordApi();
                    },
                    radius: BorderRadius.circular(8),
                    title: 'conformPassword5'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14.11), color: AppColors.kWhiteColor),
                    buttonColor: AppColors.kSkyBlueColor,
                    width: getWidth(269),
                    height: getHeight(44),

                  ),
                  SizedBox(height: getHeight(20)),




                ],
              )
          ),


        ],
      ),
    );
  }
}
