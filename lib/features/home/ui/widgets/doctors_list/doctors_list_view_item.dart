import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/images_manager.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/specialization_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorModel;
  const DoctorsListViewItem({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12.r),
            child: SvgPicture.asset(ImagesManager.doctorHomeScreenListViewSvg,
              height: 110.h,
              width: 110.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel?.name??"",
                  style:
                  TextStyles.font16DarBlueBold(),
                  overflow:TextOverflow.ellipsis ,
                ),
                Text("${doctorModel?.degree ?? ""} | ${doctorModel?.phone??""}" ,style: TextStyles.font12GrayRegular()),
                Text(doctorModel?.email??"",style: TextStyles.font12GrayRegular()),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
