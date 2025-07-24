import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabibi/core/images_manager.dart';
import 'package:tabibi/core/theming/colors_manager.dart';
import 'package:tabibi/core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Mohamed!", style: TextStyles.font18DarBlueBold()),
            Text(
              "How Are you Today?",
              style: TextStyles.font12DarkGrayRegular(),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.grayWithWhite,
          radius: 26.r,
          child: SvgPicture.asset(ImagesManager.notificationSvg),
        ),
      ],
    );

  }
}
