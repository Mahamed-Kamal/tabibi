import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabibi/core/networking/ap_error_handler.dart';
import 'package:tabibi/features/home/data/models/specialization_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(List<Data>?  specializationResponseDataList) = SpecializationSuccess;
  const factory HomeState.specializationError({required ErrorHandler error}) = SpecializationError;

  const factory HomeState.doctorsSuccess(List<Doctors>? doctors) = DoctorsSuccess;
  const factory HomeState.doctorsError({required ErrorHandler error}) = DoctorsError;

}
