import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/theming/colors_manager.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font24BackBold() {
    return TextStyle(
      fontSize: 24.sp,
      color: Colors.black,
      fontWeight: FontWeightHelper.bold,
    );
  }
  static TextStyle font32BlueBold() {
    return TextStyle(
      fontSize: 32.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font14GrayRegular() {
    return TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.myGray,
      fontWeight: FontWeightHelper.regular,
    );
  }
  static TextStyle font12GrayRegular() {
    return TextStyle(
      fontSize: 12.sp,
      color: ColorsManager.myGray,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16WhiteSemiBold() {
    return TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font24BlueBold() {
    return TextStyle(
      fontSize: 24.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font14LightGrayMedium() {
    return TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.lightGray,
      fontWeight: FontWeightHelper.medium,
    );
  }
  static TextStyle font14DarkBlueMedium() {
    return TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.darkBlue,
      fontWeight: FontWeightHelper.medium,
    );
  }
  static TextStyle font12DarkBlueRegular() {
    return TextStyle(
      fontSize: 12.sp,
      color: ColorsManager.darkBlue,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font12BlueRegular() {
    return TextStyle(
      fontSize: 12.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeightHelper.regular
    );
  }

}
