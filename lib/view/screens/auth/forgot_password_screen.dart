import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view_model/controller/auth/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../util/size_config.dart';
import '../../../../../util/text_style.dart';
import '../../../helper/routes/routes_name.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';
import 'component/auth_card.dart';
import 'component/auth_header.dart';


class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});
 ForgetPasswordController controller = Get.find();
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
                _forgetPasswordCard(context),

              ],
            ),
          )


        ],
      ),
    );
  }

  Widget _forgetPasswordCard(BuildContext context) {
    return AuthCard(
        size: getHeight(180),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getWidth(17), vertical: getHeight(35)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'forgotPassword1'.tr,
                style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
              ),
              Text(
                'forgotPassword2'.tr,
                style: kSize16W400KWhiteColorOutfitRegular.copyWith(color: AppColors.kCharcoalBlackColor, fontSize: getFont(15)),
              ),
              SizedBox(height: getHeight(40)),
              InputTextField(
                myController: controller.emailController.value,
                width: getWidth(298.21),
                contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                textInputAction: TextInputAction.done,
                keyBoardType: TextInputType.emailAddress,

                obscureText: false,
                hintText: 'forgotPassword4'.tr,
                labelText: 'forgotPassword3'.tr,
                borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                borderSideWidth: 0.9,

                textFormFieldColor: AppColors.kWhiteColor,

              ),

              SizedBox(height: getHeight(50)),

              Obx((){
                return RoundButton(
                  loading: controller.loading.value,
                  onPress: (){
                    controller.forgetPasswordApi();

                  },
                  radius: BorderRadius.circular(8),
                  title: 'forgotPassword5'.tr,
                  textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14.11), color: AppColors.kWhiteColor),
                  buttonColor: AppColors.kSkyBlueColor,
                  width: getWidth(269),
                  height: getHeight(44),

                );

              }),



            ],
          ),
        )
    );

  }
}
