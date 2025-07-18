import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tabibi/features/sign_up/logic/sign_up_cubit.dart';
import '../../features/login/data/repository/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/sign_up/data/rebository/sign_up_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
