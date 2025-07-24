import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/specialization_response_model.dart';
import 'doctors_speciality_list_view_item.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<Data>? specializationsList;
  const DoctorSpecialityListView({super.key, required this.specializationsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(doctorsSpecialityData:specializationsList?[index],itemIndex:index);
        },
        itemCount: specializationsList?.length,
      ),
    );
  }
}
