import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/theming/colors_manager.dart';
import 'package:tabibi/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 lowercase letter", hasLowerCase),
        SizedBox(height: 2),
        buildValidationRow("At least 1 UpperCase letter", hasUpperCase),
        SizedBox(height: 2),
        buildValidationRow("At least 1 SpecialCharacters letter", hasSpecialCharacters),
        SizedBox(height: 2),
        buildValidationRow("At least 1  number", hasNumber),
        SizedBox(height: 2),
        buildValidationRow("At least 8 characters long", hasMinLength),
      ],
    );
  }

  buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
       const CircleAvatar(
           radius: 2.5,
           backgroundColor: ColorsManager.myGray),
         SizedBox(width: 8.w),
         Text(
           text,
            style: TextStyles.font12DarkBlueRegular().copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorsManager.myGray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
