import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tabibi/features/home/data/api_services/home_api_constants.dart';
import 'package:tabibi/features/home/data/models/specialization_response_model.dart';
import '../../../../core/networking/api_constants.dart';

part 'home_api_services.g.dart';
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiServices {
  factory HomeApiServices(Dio dio) = _HomeApiServices;

  @GET(HomeApiConstants.specializationEp)
   Future<SpecializationResponseModel> getDoctorSpecialization();

}