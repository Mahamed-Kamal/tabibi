import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibi/core/helpers/extension.dart';
import 'package:tabibi/core/routing/routes.dart';
import 'package:tabibi/features/sign_up/logic/sign_up_cubit.dart';
import 'package:tabibi/features/sign_up/logic/sign_up_state.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';



class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpState>(
        listenWhen: (previous, current) => current is SignUpLoading || current is SignUpSuccess ||current is SignUpError,
        listener: (context,state) {
          state.whenOrNull(
              signUpLoading: () =>showDialog(
                context: context,
                builder: (context) => const Center(
                    child:CircularProgressIndicator(color: ColorsManager.mainBlue)
                ),
              ),
              signUpError: (apiErrorModel) => setUpErrorState(context,apiErrorModel),
              signUpSuccess: (data) {
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
