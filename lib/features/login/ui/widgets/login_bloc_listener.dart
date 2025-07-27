import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibi/core/helpers/extension.dart';
import 'package:tabibi/core/networking/api_error_model.dart';
import 'package:tabibi/core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';


class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
      listenWhen: (previous, current) => current is LoginLoading || current is LoginSuccess ||current is LoginError,
        listener: (context,state) {
        state.whenOrNull(
            loginLoading: () =>showDialog(
            context: context,
            builder: (context) => const Center(
                child:CircularProgressIndicator(color: ColorsManager.mainBlue)
            ),
          ),
            loginError: (error) => setUpErrorState(context,error),
            loginSuccess: (data) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen);
          }
        );
        },
        child: const SizedBox.shrink()
    );
  }

  void setUpErrorState (BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context:context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          apiErrorModel.getAllErrorMessage(),
          style: TextStyles.font14DarkBlueMedium(),
        ),
        actions: [
          TextButton(onPressed: (){
            context.pop();
          }, child:Text(
            "Got it",
            style: TextStyles.font14BlueSemiBold(),
          )),
        ],
      ),
    );
  }
}
