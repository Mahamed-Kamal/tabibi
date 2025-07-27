import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle (dynamic error) {
    if (error is DioException) {
      switch(error.type){
        case DioException.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioException.requestCancelled:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioException.connectionTimeout:
          return ApiErrorModel(message: "Connection Timeout with server ");
        case DioException.badResponse:
          return _handleError(error.response?.data);
          default:
            return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}


ApiErrorModel _handleError(dynamic data) {
 return ApiErrorModel(
   message: data["message"],
   code: data["code"],
   data: data["data"],
 );
}
