import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DoctorSpecialityAndSeeAll extends StatelessWidget {
  const DoctorSpecialityAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Doctor Speciality",
          style: TextStyles.font18DarBlueSemiBold(),
        ),
        Text("See All",style: TextStyles.font12BlueRegular(),)
      ],
    );
  }
}
