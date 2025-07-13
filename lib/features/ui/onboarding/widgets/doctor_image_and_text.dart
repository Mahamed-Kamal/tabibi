import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/images_manager.dart';
import '../../../../core/theming/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(ImagesManager.docDocLogoLowOpcitySvg),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.14, 0.4],
            ),
          ),
          child:  Image.asset(ImagesManager.onBoardingDoctor),
        ),
        Positioned(
          bottom:30.h,
          left: 0,
          right: 0,
          child: Text(
            "Best Doctor\nAppointment App",
            style: TextStyles.font32BlueBold().copyWith(
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
