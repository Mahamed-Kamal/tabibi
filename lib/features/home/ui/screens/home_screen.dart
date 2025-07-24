import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/doctor_blue_container.dart';
import '../widgets/doctor_speciality_and_see_all.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/specialization_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Column(
                children: [
                  const HomeTopBar(),
                  const DoctorBlueContainer(),
                  SizedBox(height: 14.h),
                  const DoctorSpecialityAndSeeAll(),
                  SizedBox(height: 12.h),
                  const SpecializationAndDoctorsBlocBuilder(),
                ]
            ),
          )
      ),
    );
  }
}
