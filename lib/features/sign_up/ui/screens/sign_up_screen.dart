import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/features/sign_up/logic/sign_up_cubit.dart';
import 'package:tabibi/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../login/ui/widgets/terms_and_conditions_text.dart';
import '../widgets/already_have_account.dart';
import '../widgets/sign_up_from.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start  ,
                children: [
              Text("Create Account", style: TextStyles.font24BlueBold()),
              SizedBox(height: 8.h),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community",
                style: TextStyles.font14GrayRegular(),
              ),
              SizedBox(height: 36.h),
                  Column(
                    children: [
                      const SignUpFrom(),
                      SizedBox(height: 40.h),
                      AppElevatedButton(
                        text: 'Create Account',
                        onPressed: (){
                          validateThenDoSignUp(context);
                        },
                      ),
                      SizedBox(height: 16.h),
                      const TermsAndConditionsText(),
                      SizedBox(height: 24.h),
                      const AlreadyHaveAccountText(),
                      const SignUpBlocListener()
                    ],
                  ),
            ]),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if(context.read<SignUpCubit>().formKey.currentState!.validate()){
      context.read<SignUpCubit>().emitSignUpState();
    }
  }
}
