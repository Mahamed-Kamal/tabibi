import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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
  static void addDioHeaders() {
    dio?.options.headers = {
      'Accept':'application/json',
      'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzUzMzE2NTE0LCJleHAiOjE3NTM0MDI5MTQsIm5iZiI6MTc1MzMxNjUxNCwianRpIjoiOWpINlg5Q3R6SHpTTnBsZCIsInN1YiI6IjQ0ODEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.1S_SI2Dqy9y8Rgzush0GemK0l08vTfs2GXEk4X0T9x8',
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
