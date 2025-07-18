import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/theming/styles.dart';

import '../theming/colors_manager.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    required this.hintText,
    super.key,
    this.suffixIcon,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.isObscureText,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.errorBorder,
    this.focusedErrorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lighterBlue,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        errorBorder: errorBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedErrorBorder: focusedErrorBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayMedium(),
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorsManager.moreLightGray,
        filled: true,
      ),
      validator: (value) => validator(value),
      cursorColor: ColorsManager.mainBlue,
      style: TextStyles.font14DarkBlueMedium(),
      obscureText: isObscureText ?? false,
    );
  }
}
