import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibi/core/networking/api_result.dart';
import 'package:tabibi/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:tabibi/features/sign_up/data/rebository/sign_up_repo.dart';
import 'package:tabibi/features/sign_up/logic/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepository;

  SignUpCubit(this._signUpRepository) : super(const SignUpState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignUpState () async {
    emit(SignUpState.loading());
    var response =await _signUpRepository.signUp(
      SignUpRequestBody(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          gender: 0,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text,
      )
    );
    response.when(
        success:(data) {
          emit(SignUpState.success(data));
        } ,
        failure: (error){
          emit(SignUpState.error(message:error.apiErrorModel.message ?? '' ));
        },
    );
  }
}
