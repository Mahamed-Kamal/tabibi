import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tabibi/core/helpers/shared_pref_keys.dart';
import 'package:tabibi/core/helpers/shared_preferences_helper.dart';
class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();
  static Dio? dio;
  static Dio getDio()  {
    Duration timeOut = Duration(seconds: 60);

    if(dio == null ){
      dio = Dio();
      dio!
    ..options.connectTimeout = timeOut
    ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    }else{
      return dio!;
    }
  }
  static void addDioHeaders() async  {
    dio?.options.headers = {
      'Accept':'application/json',
      'Authorization':'Bearer ${await SharedPreferencesHelper.getSecuredString(SharedPrefKeys.userToken)}',
    };
  }
  static void setTokenAfterLogin(String token) async{
    dio?.options.headers = {
      'Accept':'application/json',
      'Authorization':'Bearer $token ',
  };
  }

  static void addDioInterceptor(){
    dio?.interceptors.add(
        PrettyDioLogger(

          requestBody: true,
          requestHeader: true,
          responseHeader: true,

        )

    );
  }

}
