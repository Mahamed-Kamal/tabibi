import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tabibi/core/helpers/extension.dart';
import 'package:tabibi/core/routing/routes.dart';

import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account?   ",
            style: TextStyles.font12DarkBlueRegular(),
          ),
          TextSpan(
            text: "Login",
            style: TextStyles.font12BlueRegular(),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
