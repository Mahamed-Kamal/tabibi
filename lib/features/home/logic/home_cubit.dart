import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibi/core/networking/ap_error_handler.dart';
import 'package:tabibi/core/networking/api_result.dart';
import '../data/models/specialization_response_model.dart';
import '../data/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(const HomeState.initial());
  List<Data>? specializationDataList = [];

  void emitSpecializationData() async {
    emit(HomeState.specializationLoading());
    var response = await _homeRepository.getDoctorSpecialization();
    response.when(
      success: (specializationResponseModel) {
        specializationDataList = specializationResponseModel.data ?? [];
        getDoctorsList(specializationId:specializationDataList?.first.id?? 1);
        emit(HomeState.specializationSuccess(specializationDataList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(error: errorHandler));
      },
    );
  }
  void getDoctorsList({required int specializationId}){
    List<Doctors>? doctors = filterSpecializationDoctorsById(specializationId);
    if (doctors != null && doctors.isNotEmpty){
      emit(HomeState.doctorsSuccess(doctors));
    }else{
      emit(HomeState.doctorsError(error: ErrorHandler.handle("Not Doctors Found ")));
    }

  }
  filterSpecializationDoctorsById(specializationId){
    return specializationDataList?.firstWhere((specialization) =>specialization.id == specializationId).doctors;
  }
}


