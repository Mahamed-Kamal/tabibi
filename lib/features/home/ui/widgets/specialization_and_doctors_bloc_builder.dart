import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctor_speciality_list_view.dart';
import 'doctors_list_view.dart';
class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      buildWhen: (previous, current) =>
      current is SpecializationLoading || current is SpecializationSuccess || current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading:() => setUpLoading(),
          specializationSuccess: (specializationResponseModel) => setUpSuccess(specializationResponseModel),
          specializationError: (error) => SizedBox.shrink(),
          orElse: () => SizedBox.shrink(),

        );
      },
    );
  }

  Widget setUpLoading() {
    return Center(child: CircularProgressIndicator());
  }
  Widget setUpSuccess(specializationResponseModel) {
    var specializationsList = specializationResponseModel.data;
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(specializationsList:specializationsList),
          SizedBox(height: 12.h),
          DoctorsListView(doctorsList:specializationsList?[0].doctors),
        ],
      ),
    );
  }
}
