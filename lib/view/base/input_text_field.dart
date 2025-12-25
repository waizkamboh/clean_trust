import 'package:flutter/material.dart';

import '../../util/app_colors.dart';
import '../../util/size_config.dart';
import '../../util/text_style.dart';


class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    this.myController,
    this.focusNode,
    this.onFiledSubmittedValue,
    this.onValidator,
    this.keyBoardType,
    this.obscureText = false,
    this.enable = true,
    this.autoFocus = false,
    required this.textFormFieldColor,
    required this.borderSideColor,
    this.width,
    this.height,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconPadding,
    this.hintTextStyle,
    this.maxLines,
    this.maxLength,
    this.counterText,
    this.contentPadding,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.autoValidateMode,
    this.borderRadius,
    this.enableBorder = true,
    this.cursorColor,
    this.labelText,
    this.labelTextStyle,
  });

  final double? height;
  final double? width;
  final TextEditingController? myController;
  final FocusNode? focusNode;
  final FormFieldSetter? onFiledSubmittedValue;
  final FormFieldValidator? onValidator;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final bool enable, autoFocus;
  final Color textFormFieldColor, borderSideColor;
  final String? hintText, labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? suffixIconPadding;
  final TextStyle? hintTextStyle, labelTextStyle;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final String? counterText;
  final Function()? onTap;
  final bool? readOnly;
  final Function(String)? onChanged;
  final AutovalidateMode? autoValidateMode;
  final double? borderRadius;
  final bool enableBorder;
  final Color? cursorColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autovalidateMode:
        autoValidateMode ?? AutovalidateMode.onUserInteraction,
        onTap: onTap,
        readOnly: readOnly ?? false,
        onChanged: onChanged,
        cursorColor: cursorColor ?? AppColors.kBlackColor.withOpacity(0.50),
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        obscuringCharacter: '*',
        maxLines: maxLines ?? 1,
        enabled: enable,
        maxLength: maxLength,
        cursorHeight: 25,
        onFieldSubmitted: onFiledSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          counterText: counterText,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          fillColor: textFormFieldColor,
          filled: true,
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelTextStyle ??
              kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kCharcoalBlackColor),
          hintStyle: hintTextStyle ??
              kSize16W400KWhiteColorOutfitRegular.copyWith(fontSize: getFont(12), color: AppColors.kBlackColor.withOpacity(0.66)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon != null
              ? Padding(
            padding: suffixIconPadding ?? EdgeInsets.zero,
            child: suffixIcon,
          )
              : null,

          // Enabled Border
          enabledBorder: enableBorder
              ? OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(borderRadius ?? 4.5),
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          ),

          // Focused Border
          focusedBorder: enableBorder
              ? OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(borderRadius ?? 4.5),
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          ),

          // Error Border
          errorBorder: enableBorder
              ? OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(borderRadius ?? 4.5),
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          ),

          // Focused Error Border
          focusedErrorBorder: enableBorder
              ? OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(borderRadius ?? 4.5),
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          ),

          disabledBorder: enableBorder
              ? OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(borderRadius ?? 4.5),
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
              color: borderSideColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}