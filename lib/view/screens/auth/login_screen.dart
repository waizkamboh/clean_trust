import 'dart:math';

import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view_model/controller/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/custom_snackbar.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import '../../base/input_text_field.dart';
import '../../base/round_button.dart';
import 'component/auth_card.dart';
import 'component/auth_header.dart';
import 'component/social_auth_section.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          AuthHeader(),
          _loginCard(context),


        ],
      ),
    );
  }

  Widget _loginCard(BuildContext context){
    return AuthCard(
        size: getHeight(40),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: getHeight(34)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'loginScreen1'.tr,
                style: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(18)),
              ),
              SizedBox(height: getHeight(20)),
              InputTextField(
                myController: loginController.emailController.value,
                width: getWidth(300),
                contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                textInputAction: TextInputAction.next,
                keyBoardType: TextInputType.emailAddress,
                obscureText: false,
                hintText: 'loginScreen2'.tr,
                labelText: 'loginScreen2'.tr,
                borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                textFormFieldColor: AppColors.kWhiteColor,
              ),
              SizedBox(height: getHeight(25)),
              Obx(() {
                return  InputTextField(
                  myController: loginController.passwordController.value,
                  width: getWidth(300),
                  contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  textInputAction: TextInputAction.done,
                  keyBoardType: TextInputType.visiblePassword,
                  obscureText: loginController.isPasswordHidden.value,
                  suffixIcon: InkWell(
                    onTap: () {
                      loginController.isPasswordHidden.toggle();
                    },
                    child: Icon(
                      loginController.isPasswordHidden.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.kBlackColor.withOpacity(0.66),
                    ),
                  ),
                  hintText: 'loginScreen3'.tr,
                  labelText: 'loginScreen4'.tr,
                  borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                  textFormFieldColor: AppColors.kWhiteColor,
                );

              }
              ),
              SizedBox(height: getHeight(20)),
              Row(
                children: [
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        loginController.rememberMe.toggle();
                      },
                      child: Row(
                        children: [
                          Container(
                            width: getWidth(16),
                            height: getHeight(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: loginController.rememberMe.value
                                    ? AppColors.kSkyBlueColor
                                    : AppColors.kBlackColor.withOpacity(0.66),
                                width: 1.4,
                              ),

                            ),
                            child: loginController.rememberMe.value
                                ?  Icon(
                              Icons.check,
                              size: 12,
                              color: AppColors.kSkyBlueColor,
                            )
                                : null,
                          ),
                          SizedBox(width: getWidth(5)),
                          Text(
                            'loginScreen5'.tr,
                            style: kSize10W400KBlackColorlatoRegular.copyWith(
                              fontSize: getFont(10),
                              color: loginController.rememberMe.value
                                  ?AppColors.kSkyBlueColor
                                  :AppColors.kBlackColor.withOpacity(0.66),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteName.forGetPasswordScreen);
                    },
                    child: Text(
                      'loginScreen6'.tr,
                      style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(10), color: AppColors.kSkyBlueColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(40)),
              Obx((){
                return RoundButton(
                  loading: loginController.loading.value,
                  onPress: ()  {


                    loginController.loginApi();

                  },
                  radius: BorderRadius.circular(8),
                  title: 'loginScreen7'.tr,
                  textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14.11), color: AppColors.kWhiteColor),
                  buttonColor: AppColors.kSkyBlueColor,
                  width: getWidth(269),
                  height: getHeight(44),

                );


              }),
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
                    style: kSize17W400KCharcoalBlackColorInterRegular,
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
              SocialAuthSection(text1: 'loginScreen9',text2: 'loginScreen10',onTap: (){
                Get.toNamed(RouteName.signUpScreen);
              },),



            ],
          ),
        )
    );

  }
}
