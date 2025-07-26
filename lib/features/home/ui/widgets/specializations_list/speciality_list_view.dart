import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/features/home/logic/home_cubit.dart';
import 'package:tabibi/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';
import '../../../data/models/specialization_response_model.dart';

class SpecialityListView extends StatefulWidget {
  final List<Data>? specializationsList;
  const SpecialityListView({super.key, required this.specializationsList});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecialityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecialityIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(specializationId:widget.specializationsList?[index].id??1);

            },
            child: SpecialityListViewItem(
                doctorsSpecialityData:widget.specializationsList?[index],
                itemIndex:index,
                selectedIndex:selectedSpecialityIndex
            ),
          );
        },
        itemCount: widget.specializationsList?.length,
      ),
    );
  }
}
