import 'package:flutter/material.dart';
import 'package:tabibi/core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: [
            TextSpan(
                text: "By logging, you agree to our  ",
              style: TextStyles.font12GrayRegular()
            ),
            TextSpan(
              text: "Terms & Conditions",
              style: TextStyles.font12DarkBlueRegular()
            ),
            TextSpan(
                text: " and  ",
                style: TextStyles.font12GrayRegular().copyWith(height: 1.6)
            ),
            TextSpan(
              text: "PrivacyPolicy.",
              style: TextStyles.font12DarkBlueRegular()
            ),
          ]),
    );
  }
}
