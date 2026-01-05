import 'package:clean_trust/util/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';

class AuthCard extends StatelessWidget {
  final Widget child;
  final double size;

  const AuthCard({super.key, required this.child, this.size = 0});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        margin: EdgeInsetsGeometry.only(top: size),
        padding: EdgeInsetsGeometry.symmetric(horizontal: getWidth(15)),
        width: getWidth(332),
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
        child: child,
      ),
    );
  }
}
