import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/theming/colors_manager.dart';

class TextStyles {
  static TextStyle font24Back700Weight() {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle font32BlueBold() {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: ColorsManager.mainBlue,
    );
  }

  static TextStyle font14GrayRegular() {
    return TextStyle(
      color: ColorsManager.myGray,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font16WhiteSemiBold() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      color: Colors.white,
    );
  }
}
