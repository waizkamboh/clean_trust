import 'package:clean_trust/helper/routes/routes_name.dart';
import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/view_model/controller/auth/signup_controller.dart';
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

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
   SignupController signupController = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          AuthHeader(),
          SingleChildScrollView(
            child: Column(
              children: [
                _signUpCard(context),
                SizedBox(height: getHeight(50),),

              ],
            ),
          ),


        ],
      ),
    );
  }
  Widget _signUpCard(BuildContext context){
    return AuthCard(
        size: getHeight(180),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: getHeight(28)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'signupScreen1'.tr,
                style: kSize18W500kBlackColorOutfitMedium,
              ),
              Text(
                  'signupScreen2'.tr,
                  style: kSize15W300kCharcoalBlackColorOutfitLight
              ),
              SizedBox(height: getHeight(30)),
              InputTextField(
                myController: signupController.emailController.value,
                width: getWidth(298.21),
                contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                keyBoardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                obscureText: false,
                hintText: 'signupScreen4'.tr,
                labelText: 'signupScreen3'.tr,
                borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                borderSideWidth: 0.9,
                textFormFieldColor: AppColors.kWhiteColor,
              ),
              SizedBox(height: getHeight(25)),
              InputTextField(
                myController: signupController.phoneController.value,
                width: getWidth(300),
                contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                textInputAction: TextInputAction.next,

                keyBoardType: TextInputType.phone,

                obscureText: false,
                hintText: 'signupScreen6'.tr,
                labelText: 'signupScreen5'.tr,
                borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                borderSideWidth: 0.9,

                textFormFieldColor: AppColors.kWhiteColor,
              ),
              SizedBox(height: getHeight(25)),
              Obx(() {
                return  InputTextField(
                  myController: signupController.passwordController.value,
                  width: getWidth(300),
                  contentPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  textInputAction: TextInputAction.done,
                  keyBoardType: TextInputType.visiblePassword,
                  obscureText: signupController.isPasswordHidden.value,
                  suffixIcon: InkWell(
                    onTap: () {
                      signupController.isPasswordHidden.toggle();
                    },
                    child: Icon(
                      signupController.isPasswordHidden.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.kBlackColor.withOpacity(0.66),
                    ),
                  ),
                  hintText: 'signupScreen8'.tr,
                  labelText: 'signupScreen7'.tr,
                  borderSideColor: AppColors.kBlackColor.withOpacity(0.37),
                  borderSideWidth: 0.9,

                  textFormFieldColor: AppColors.kWhiteColor,
                );

              }
              ),
              SizedBox(height: getHeight(20)),
              Text(
                'signupScreen9'.tr,
                textAlign: TextAlign.center,
                style: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(10.75), color: AppColors.kBlackColor.withOpacity(0.64)),
              ),

              SizedBox(height: getHeight(40)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(17)),
                child: Obx((){
                  return  RoundButton(
                    loading: signupController.loading.value,

                    onPress: ()  {


                      signupController.signupApi();

                    },

                    radius: BorderRadius.circular(50),
                    title: 'signupScreen10'.tr,
                    textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(fontSize: getFont(14.11), color: AppColors.kWhiteColor),
                    buttonColor: AppColors.kSkyBlueColor,
                    width: getWidth(269),
                    height: getHeight(44),

                  );
                }),
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
                    'signupScreen11'.tr,
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
              SocialAuthSection(text1: 'signupScreen12', text2: 'signupScreen13',onTap: (){
                Get.toNamed(RouteName.loginScreen);
              },),



            ],
          ),
        )
    );

  }
}
