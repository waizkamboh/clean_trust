import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';
import 'component/auth_card.dart';
import 'component/auth_header.dart';
import 'component/social_auth_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          AuthHeader(),
          AuthCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: getHeight(34)),
                  Text(
                    'loginScreen1'.tr,
                    style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
                  ),
                  SizedBox(height: getHeight(20)),
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
                  SizedBox(height: getHeight(20)),
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
                    hintText: 'loginScreen3'.tr,
                    labelText: 'loginScreen4'.tr,
                    borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                    textFormFieldColor: AppColors.kWhiteColor,
                  ),
                  SizedBox(height: getHeight(20)),
                  Row(
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage(AppImages.checkCircle),
                          ),

                          Text(
                            'loginScreen5'.tr,
                            style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kBlackColor.withOpacity(0.66)),
                          ),


                        ],
                      ),
                      Spacer(),
                      Text(
                        'loginScreen6'.tr,
                        style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kSkyBlueColor),
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(40)),
                  RoundButton(
                    onPress: (){},
                    radius: BorderRadius.circular(8),
                    title: 'loginScreen7'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14.11), color: AppColors.kWhiteColor),
                    buttonColor: AppColors.kSkyBlueColor,
                    width: getWidth(269),
                    height: getHeight(44),

                  ),
                  SizedBox(height: getHeight(20)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.kWhiteColor,
                                AppColors.kBlueGreenColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: getWidth(10)),

                      Text(
                        'loginScreen8'.tr,
                        style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kBlackColor),
                      ),
                      SizedBox(width: getWidth(10)),
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.kBlueGreenColor,
                                AppColors.kWhiteColor,
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: getHeight(40)),
                  SocialAuthSection(),
                  SizedBox(height: getHeight(34),),



                ],
              )
          ),


        ],
      ),
    );
  }
}
