import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibi/core/networking/api_result.dart';
import '../data/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(const HomeState.initial());

  void emitSpecializationData() async {
    emit(HomeState.specializationLoading());
    var response = await _homeRepository.getDoctorSpecialization();
    response.when(
      success: (specializationResponseModel) {
        emit(HomeState.specializationSuccess(specializationResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(error: errorHandler));
      },
    );
  }
}
