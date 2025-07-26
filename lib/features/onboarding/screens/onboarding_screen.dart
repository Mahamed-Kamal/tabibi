import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/theming/styles.dart';
import '../widgets/doc_logo_and_name.dart';
import '../widgets/doctor_image_and_text.dart';
import '../widgets/get_started_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 24.h),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Manage and schedule all of your medical appointments easily with Tabibi to get a new experience.",
                        style: TextStyles.font14GrayRegular(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.h),
                      const GetStartedButton(),
                      //AppElevatedButton(text:'Get Started',onPressed:() => context.pushNamed(Routes.loginScreen)),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
