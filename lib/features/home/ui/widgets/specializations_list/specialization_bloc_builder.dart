import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:tabibi/features/home/ui/widgets/specializations_list/speciality_list_view.dart';
import 'package:tabibi/features/home/ui/widgets/specializations_list/specialization_shimmer_loading.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

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
    return Expanded(
      child: Column(
        children: [
          SpecializationShimmerLoading(),
          SizedBox(height: 12.h),
          DoctorsShimmerLoading(),



        ],
      ),
    );
  }
  Widget setUpSuccess(specializationResponseModel) {
    return SpecialityListView(specializationsList:specializationResponseModel);
  }
}
