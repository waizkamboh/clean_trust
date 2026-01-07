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
          SingleChildScrollView(
            child: Column(
              children: [
                _confirmPasswordCard(context),

              ],
            ),
          )


        ],
      ),
    );
  }
  Widget _confirmPasswordCard(BuildContext context) {
    return AuthCard(
        size: getHeight(180),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getWidth(17), vertical: getHeight(32)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'conformPassword1'.tr,
                style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
              ),
              SizedBox(height: getHeight(40)),
              Obx(() {
                return  InputTextField(
                  myController: controller.passwordController.value,
                  width: getWidth(298.21),
                  contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  textInputAction: TextInputAction.next,
                  keyBoardType: TextInputType.visiblePassword,
                  obscureText: controller.isPasswordHidden.value,
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.isPasswordHidden.toggle();
                    },
                    child: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.kBlackColor.withOpacity(0.66),

                    ),
                  ),
                  hintText: 'conformPassword3'.tr,
                  labelText: 'conformPassword2'.tr,
                  hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12.54), color: AppColors.kBlackColor.withOpacity(0.66)),
                  labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12.54), color: AppColors.kCharcoalBlackColor),
                  borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                  borderSideWidth: 0.9,

                  textFormFieldColor: AppColors.kWhiteColor,
                );

              }
              ),

              SizedBox(height: getHeight(25)),
              Obx(() {
                return  InputTextField(
                  myController: controller.confirmPasswordController.value,
                  width: getWidth(300),
                  contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  textInputAction: TextInputAction.next,
                  keyBoardType: TextInputType.visiblePassword,
                  obscureText: controller.isPasswordHidden1.value,
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.isPasswordHidden1.toggle();
                    },
                    child: Icon(
                      controller.isPasswordHidden1.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.kBlackColor.withOpacity(0.66),
                    ),
                  ),
                  hintText: 'conformPassword3'.tr,
                  labelText: 'conformPassword4'.tr,
                  borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                  borderSideWidth: 0.9,

                  textFormFieldColor: AppColors.kWhiteColor,
                );

              }
              ),
              SizedBox(height: getHeight(60)),

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
              SizedBox(height: getHeight(40)),




            ],
          ),
        )
    );

  }
}
