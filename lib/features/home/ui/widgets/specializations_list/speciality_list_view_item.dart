import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/specialization_response_model.dart';


class SpecialityListViewItem extends StatelessWidget {
  final Data? doctorsSpecialityData;
  final int itemIndex;
  final int selectedIndex;
  const SpecialityListViewItem({super.key,required this.doctorsSpecialityData, required this.itemIndex, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          selectedIndex == itemIndex ?
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsManager.darkBlue,
              ),
              shape: BoxShape.circle
            ),
            child: CircleAvatar(
              radius: 36.r,
              backgroundColor: ColorsManager.moreLighterBlue,
              child: SvgPicture.asset(
                "assets/svgs/doctor_speciality_general.svg",
                height: 52.h,
                width: 52.w,
              ),
            ),
          ):CircleAvatar(
            radius: 34.r,
            backgroundColor: ColorsManager.moreLighterBlue,
            child: SvgPicture.asset(
              "assets/svgs/doctor_speciality_general.svg",
              height: 50.h,
              width: 50.w,
            ),
          ),
          Text(doctorsSpecialityData?.name??"",style:
          selectedIndex ==  itemIndex ? TextStyles.font14DarkBlueMedium()
          :TextStyles.font12DarkBlueRegular())

        ],
      ),
    );
  }
}
