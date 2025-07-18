import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/helpers/app_validation.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  @override


  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
           AppTextFormField(
              hintText: "Email",
             validator: (value) {
               if(value == null || value.trim().isEmpty || !AppValidation.isEmailValid(value)){
                 return "Please enter a valid email";
               }
             },
             controller: context.read<LoginCubit>().emailController,
           ),
          SizedBox(height: 16.h),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: "Password",
            validator: (value) {
              if(value == null || value.trim().isEmpty){
                return "Please enter a valid password";
              }
            },
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.myGray,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
