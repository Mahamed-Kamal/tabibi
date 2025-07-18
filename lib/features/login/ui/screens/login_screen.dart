import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../logic/login_cubit.dart';
import '../widgets/do_not_have_account_text.dart';
import '../widgets/email_and_password.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold()),
                SizedBox(height: 8.h),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular(),
                ),
                SizedBox(height: 36.h),
                Column(
                  children: [
                    const EmailAndPassword(),
                    SizedBox(height: 26.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        " Forgot Password?",
                        style: TextStyles.font12BlueRegular(),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AppElevatedButton(
                      text: 'Login',
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    SizedBox(height: 16.h),
                    const TermsAndConditionsText(),
                    SizedBox(height: 24.h),
                    const DoNotHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
