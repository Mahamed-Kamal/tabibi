import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/theming/colors_manager.dart';
import 'package:tabibi/core/theming/styles.dart';

class AppElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonHeight;
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;

  const AppElevatedButton({
    super.key,
    this.backgroundColor,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.buttonHeight,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(buttonWidth?.w ?? double.maxFinite,buttonHeight?.h ?? 52.h),
        backgroundColor: backgroundColor ?? ColorsManager.mainBlue,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding?.h ?? 14.h,
          horizontal: verticalPadding?.w ?? 12.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(
            Radius.circular(borderRadius?.r ?? 16.r),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TextStyles.font16WhiteSemiBold(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
