import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/helpers/extension.dart';
import 'package:tabibi/core/theming/colors_manager.dart';
import 'package:tabibi/core/theming/styles.dart';
import '../../../../core/routing/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16.r)),
        ),
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        "Get Started",
        style: TextStyles.font16WhiteSemiBold(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
