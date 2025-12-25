import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../util/app_colors.dart';
import '../../util/size_config.dart';

class RoundButton extends StatefulWidget {
  const RoundButton({
    this.buttonColor = AppColors.kWhiteColor,
    this.textColor = AppColors.kBlackColor,
    required this.onPress,
    required this.title,
    this.width ,
    this.height ,
    this.loading = false,
    super.key,
    this.textStyle,
    this.borderColor = AppColors.kWhiteColor,
    this.image,
    this.radius,
  });
  final bool loading;
  final String title;
  final double? height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor, borderColor;
  final TextStyle? textStyle;
  final Widget? image;
  final BorderRadius? radius;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: widget.radius,
            border: Border.all(
              color: widget.borderColor,
              width: 1,
            )
        ),
        child: widget.loading?
        const Center(
            child: SpinKitThreeInOut(
              color: AppColors.kWhiteColor,


            )
        ):
        // Center(child: Text(title, style: textStyle)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.image != null) ...[
              // Display the image if provided
              Padding(
                padding: EdgeInsets.only(right: getWidth(8)),
                child: widget.image,
              ),
            ],
            Text(widget.title, style: widget.textStyle),
          ],
        ),

      ),
    );
  }
}