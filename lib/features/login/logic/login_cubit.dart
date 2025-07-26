import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibi/core/helpers/shared_pref_keys.dart';
import 'package:tabibi/core/helpers/shared_preferences_helper.dart';
import 'package:tabibi/core/networking/api_result.dart';
import 'package:tabibi/core/networking/dio_factory.dart';
import '../data/models/login_request_body.dart';
import '../data/repository/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginState() async {
    emit(LoginState.loading());
    var response = await _loginRepo.login(LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
    ));
    response.when(
      success: (loginResponseBody) async {
        await setUserToken(loginResponseBody.data?.token??"");
        emit(LoginState.success(loginResponseBody));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> setUserToken(String token) async {
    await SharedPreferencesHelper.setSecuredString(SharedPrefKeys.userToken,token);
    DioFactory.setTokenAfterLogin(token);
  }
}
