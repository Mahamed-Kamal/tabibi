import 'package:tabibi/core/networking/api_error_handler.dart';
import 'package:tabibi/core/networking/api_result.dart';
import 'package:tabibi/features/home/data/api_services/home_api_services.dart';
import 'package:tabibi/features/home/data/models/specialization_response_model.dart';

class HomeRepository {
  final HomeApiServices _homeApiServices;

  const HomeRepository(this._homeApiServices);

  Future<ApiResult<SpecializationResponseModel>>
  getDoctorSpecialization() async {
    try {
      var response = await _homeApiServices.getDoctorSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
