import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/specialization_response_model.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final Data? doctorsSpecialityData;
  final int itemIndex;
  const DoctorsSpecialityListViewItem({super.key,required this.doctorsSpecialityData, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 34.r,
            backgroundColor: ColorsManager.moreLighterBlue,
            child: SvgPicture.asset(
              "assets/svgs/doctor_speciality_general.svg",
              height: 50.h,
              width: 50.w,
            ),
          ),
          Text(doctorsSpecialityData?.name??"",style: TextStyles.font12DarkBlueRegular())
        ],
      ),
    );
  }
}
