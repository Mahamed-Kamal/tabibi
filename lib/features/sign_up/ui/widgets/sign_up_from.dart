import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/helpers/app_validation.dart';
import 'package:tabibi/core/widgets/app_text_form_field.dart';
import 'package:tabibi/features/sign_up/logic/sign_up_cubit.dart';

import '../../../login/ui/widgets/password_validations.dart';

class SignUpFrom extends StatefulWidget {
  const SignUpFrom({super.key});

  @override
  State<SignUpFrom> createState() => _SignUpFromState();
}

class _SignUpFromState extends State<SignUpFrom> {
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasMinLength = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }
  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppValidation.hasLowerCase(passwordController.text);
        hasUpperCase = AppValidation.hasUpperCase(passwordController.text);
        hasMinLength = AppValidation.hasMinLength(passwordController.text);
        hasNumber = AppValidation.hasNumber(passwordController.text);
        hasSpecialCharacters = AppValidation.hasSpecialCharacter(passwordController.text);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: "Name",
              validator: (value) {
                if(value == null || value.trim().isEmpty){
                  return "Please enter a valid name";
                }
              },
              controller: context.read<SignUpCubit>().nameController,
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              controller: context.read<SignUpCubit>().emailController,
              hintText: "Email",
              validator: (value) {
                if(value == null || value.trim().isEmpty|| !AppValidation.isEmailValid(value) ){
                  return "Please enter a valid email";
                }
              },
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              controller: context.read<SignUpCubit>().phoneController,
              hintText: "Phone",
              validator: (value) {
                if(value == null || value.trim().isEmpty|| !AppValidation.isPhoneNumberValid(value) ){
                  return "Please enter a valid Phone";
                }
              },
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              isObscureText: true,
              hintText: "Password",
              validator: (value) {
                if(value == null || value.trim().isEmpty ){
                  return "Please enter a valid password";
                }
              },
              controller: context.read<SignUpCubit>().passwordController,
            ),
            SizedBox(height: 16.h),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasMinLength: hasMinLength,
              hasNumber: hasNumber,
              hasSpecialCharacters: hasSpecialCharacters,
              hasUpperCase: hasUpperCase,
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              isObscureText: true,
              controller: context.read<SignUpCubit>().passwordConfirmationController,
              hintText: "Password Confirmation",
              validator: (value) {
                if(value == null || value.trim().isEmpty){
                  return "Please enter a valid password";
                }
                else if (
                context.read<SignUpCubit>().passwordConfirmationController.text !=
                    context.read<SignUpCubit>().passwordController.text){
                  return "not matching";
                }
              },
            ),
            SizedBox(height: 16.h),
          ],
        )
    )
    ;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
