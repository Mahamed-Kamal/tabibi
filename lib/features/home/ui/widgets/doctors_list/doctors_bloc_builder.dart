import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibi/features/home/logic/home_cubit.dart';
import 'package:tabibi/features/home/logic/home_state.dart';
import 'doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      buildWhen: (previous, current) => current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctors) =>DoctorsListView(doctorsList:doctors),
            doctorsError: () => SizedBox.shrink(),
            orElse: SizedBox.shrink
        );
      },
    );
  }
}
