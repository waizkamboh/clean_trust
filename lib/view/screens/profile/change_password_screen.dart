import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view/base/top_header.dart';
import 'package:clean_trust/view/screens/auth/component/auth_card.dart';
import 'package:clean_trust/view_model/controller/auth/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});
   ChangePasswordController changePasswordController = Get.put(ChangePasswordController());
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() {
                    return  InputTextField(
                      //height: getHeight(42),
                      myController: changePasswordController.oldPasswordController.value,
                      width: getWidth(333),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      focusNode: changePasswordController.oldPasswordFocus.value,
                      onFiledSubmittedValue: (value){
                        FocusScope.of(context)
                            .requestFocus(changePasswordController.newPasswordFocus.value);

                      },
                      onValidator: (email){
                        return null;
                      },
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: changePasswordController.oldPasswordHidden.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          changePasswordController.oldPasswordHidden.toggle();
                        },
                        child: Icon(
                          changePasswordController.oldPasswordHidden.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                        ),
                      ),
                      labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
                      hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
                      hintText: 'changePasswordScreen3'.tr,
                      labelText: 'changePasswordScreen2'.tr,
                      borderRadius: 5,
                      borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                      textFormFieldColor: AppColors.kWhiteColor,
                    );

                  }
                  ),
                  SizedBox(height: getHeight(20),),

                  Obx(() {
                    return  InputTextField(
                      //height: getHeight(42),
                      myController: changePasswordController.newPasswordController.value,
                      width: getWidth(333),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      focusNode: changePasswordController.newPasswordFocus.value,
                      onFiledSubmittedValue: (value){
                        FocusScope.of(context)
                            .requestFocus(changePasswordController.confirmPasswordFocus.value);

                      },
                      onValidator: (email){
                        return null;
                      },
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: changePasswordController.newPasswordHidden.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          changePasswordController.newPasswordHidden.toggle();
                        },
                        child: Icon(
                          changePasswordController.newPasswordHidden.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                        ),
                      ),
                      labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
                      hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
                      hintText: 'changePasswordScreen3'.tr,
                      labelText: 'changePasswordScreen4'.tr,
                      borderRadius: 5,
                      borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                      textFormFieldColor: AppColors.kWhiteColor,
                    );

                  }
                  ),
                  SizedBox(height: getHeight(20),),

                  Obx(() {
                    return  InputTextField(
                      //height: getHeight(42),
                      myController: changePasswordController.confirmPasswordController.value,
                      width: getWidth(333),
                      contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      focusNode: changePasswordController.confirmPasswordFocus.value,
                      onFiledSubmittedValue: (value){

                      },
                      onValidator: (email){
                        return null;
                      },
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: changePasswordController.confirmPasswordHidden.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          changePasswordController.confirmPasswordHidden.toggle();
                        },
                        child: Icon(
                          changePasswordController.confirmPasswordHidden.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                        ),
                      ),
                      labelTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kCharcoalBlackColor),
                      hintTextStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(14), color: AppColors.kBlackColor.withOpacity(0.66)),
                      hintText: 'changePasswordScreen3'.tr,
                      labelText: 'changePasswordScreen5'.tr,
                      borderRadius: 5,
                      borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                      textFormFieldColor: AppColors.kWhiteColor,
                    );

                  }
                  ),
                  SizedBox(height: getHeight(100),),
                  Obx((){
                    return RoundButton(
                      loading: changePasswordController.loading.value,
                      onPress: (){
                        changePasswordController.changePasswordApi();
                      },
                      radius: BorderRadius.circular(12),
                      title: 'changePasswordScreen6'.tr,
                      textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor,),
                      buttonColor: AppColors.kSkyBlueColor,
                      width: getWidth(343),
                      height: getHeight(56),

                    );

                  })

                ],
              ),
            ),




          ]



        ),
      ),
    );
  }

}


