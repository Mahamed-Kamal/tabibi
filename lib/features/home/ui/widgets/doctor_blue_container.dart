import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/images_manager.dart';
import 'package:tabibi/core/theming/styles.dart';

class DoctorBlueContainer extends StatelessWidget {
  const DoctorBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
            image: DecorationImage(
              image: AssetImage(ImagesManager.backgroundBluePattern),
              fit: BoxFit.cover
            ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Book and\nschedule with\nnearest doctor",style: TextStyles.font18WhiteMedium()),
                SizedBox(height: 16.h,),
                Expanded(child: ElevatedButton(
                    onPressed: (){},
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                    ) ,
                    child: Text("Find Nearby",style: TextStyles.font12BlueRegular())),
                ),
              ],
            ),

          ),
          Positioned(
              right: 30,
              child: Image.asset("assets/images/doctor_home.png",height: 195.h,))
        ],

      ),
    );
  }
}
