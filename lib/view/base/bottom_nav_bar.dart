

import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../util/text_style.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _screens() {
    return const [
      HomeScreen(),
      LoginScreen(),
      SignupScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.homeIcon, color: AppColors.kGradientColor5,),
        inactiveIcon: Image.asset(AppImages.homeIcon, color: AppColors.kLightSkyBlueColor,),
        title: "Home",
        textStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kGradientColor5),
        activeColorPrimary: AppColors.kWhiteColor,
        inactiveColorPrimary: AppColors.kLightSkyBlueColor,
        activeColorSecondary: AppColors.kGradientColor5,


      ),

      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.networkIcon, color: AppColors.kGradientColor5,),
        inactiveIcon: Image.asset(AppImages.networkIcon, color: AppColors.kLightSkyBlueColor,),
        title: "Offline Mode",
        textStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kGradientColor5),
        activeColorPrimary: AppColors.kWhiteColor,
        inactiveColorPrimary: AppColors.kLightSkyBlueColor,
        activeColorSecondary: AppColors.kGradientColor5,

      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.bellIcon, color: AppColors.kGradientColor5,),
        inactiveIcon: Image.asset(AppImages.bellIcon, color: AppColors.kLightSkyBlueColor,),
        title: "Notification",
        textStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kGradientColor5),
        activeColorPrimary: AppColors.kWhiteColor,
        inactiveColorPrimary: AppColors.kLightSkyBlueColor,
        activeColorSecondary: AppColors.kGradientColor5,

      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.profileIcon, color: AppColors.kGradientColor5,),
        inactiveIcon: Image.asset(AppImages.profileIcon, color: AppColors.kLightSkyBlueColor,),
        title: "Profile",
        textStyle: kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(18), color: AppColors.kGradientColor5),
        activeColorPrimary: AppColors.kWhiteColor,
        inactiveColorPrimary: AppColors.kLightSkyBlueColor,
        activeColorSecondary: AppColors.kGradientColor5,

      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style7,
      backgroundColor: AppColors.kGradientColor5,
      navBarHeight: 74,
      padding: EdgeInsets.symmetric(horizontal: getWidth(14.31), vertical: getHeight(11.93)),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(100),
        colorBehindNavBar: AppColors.kWhiteColor, // ✅ FIX

      ),
    );
  }
}

