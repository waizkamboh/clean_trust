import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../util/app_colors.dart';
import '../../util/size_config.dart';

class CustomDropdownField extends StatelessWidget {
  final double? height;
  final double? width;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final bool enable;
  final Color dropdownFieldColor, borderSideColor;
  final Color? menuPropsColor;
  final String? hintText;
  final String? searchHintText;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final Function(String?)? onChanged;
  final AutovalidateMode? autoValidateMode;
  final List<String> items;
  final TextStyle hintTextStyle;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final Widget? helperWidget;
  final Widget? suffixIcon;

  /// Optional selected value
  final String? value;

  /// ✅ NEW: Enable / Disable Search
  final bool enableSearch;

  const CustomDropdownField({
    super.key,
    this.focusNode,
    this.validator,
    this.enable = true,
    required this.dropdownFieldColor,
    required this.borderSideColor,
    this.width,
    this.height,
    required this.hintText,
    this.contentPadding,
    this.onChanged,
    this.autoValidateMode,
    this.borderRadius,
    required this.items,
    required this.hintTextStyle,
    this.menuPropsColor,
    this.labelText,
    this.labelTextStyle,
    this.helperWidget,
    this.suffixIcon,
    this.value,
    this.enableSearch = false, this.searchHintText,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: DropdownSearch<String>(
            items: items,
            selectedItem: value,
            onChanged: onChanged,
            validator: validator,
            enabled: enable,

            dropdownButtonProps: const DropdownButtonProps(
              isVisible: false,
            ),
            clearButtonProps: const ClearButtonProps(
              isVisible: false,
            ),

            dropdownBuilder: (context, selectedItem) {
              return Padding(
                padding: EdgeInsets.only(
                  right: suffixIcon != null ? 40 : 0,
                ),
                child: Text(
                  selectedItem ?? hintText!,
                  style: hintTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },

            popupProps: enableSearch
                ? PopupProps.menu(
              showSearchBox: true,

              searchDelay: Duration.zero,

              fit: FlexFit.loose,
              menuProps: MenuProps(
                backgroundColor: menuPropsColor ?? AppColors.kWhiteColor,
              ),

              searchFieldProps: TextFieldProps(
                cursorColor: AppColors.kBlackColor.withOpacity(0.50),
                decoration: InputDecoration(
                  hintText: searchHintText,
                  hintStyle: hintTextStyle,
                  filled: true,
                  fillColor: dropdownFieldColor,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: getWidth(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 8),
                    borderSide: BorderSide(
                      color: borderSideColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 8),
                    borderSide: BorderSide(
                      color: borderSideColor,
                      width: 1,
                    ),
                  ),
                ),
              ),

              listViewProps: const ListViewProps(
                physics: BouncingScrollPhysics(),
              ),
            )
                : PopupProps.menu(
              showSearchBox: false,
              fit: FlexFit.loose,
              menuProps: MenuProps(
                backgroundColor: menuPropsColor ?? AppColors.kWhiteColor,
              ),
              listViewProps: const ListViewProps(
                physics: BouncingScrollPhysics(),
              ),
            ),


            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: labelText,
                labelStyle: labelTextStyle,
                hintText: hintText,
                hintStyle: hintTextStyle,
                fillColor: dropdownFieldColor,
                filled: true,
                contentPadding: contentPadding,
                helper: helperWidget,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  borderSide: BorderSide(
                    color: borderSideColor,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  borderSide: BorderSide(
                    color: borderSideColor,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  borderSide: BorderSide(
                    color: borderSideColor,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),

        if (suffixIcon != null)
          Positioned(
            right: getWidth(15),
            top: getHeight(25),
            child: Center(
              child: suffixIcon!,
            ),
          ),
      ],
    );
  }
}
