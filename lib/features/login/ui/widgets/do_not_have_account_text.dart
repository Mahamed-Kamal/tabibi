import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tabibi/core/helpers/extension.dart';
import 'package:tabibi/core/routing/routes.dart';

import '../../../../core/theming/styles.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account yet?  ",
            style: TextStyles.font12DarkBlueRegular(),
          ),
          TextSpan(
            text: "Sign Up",
            style: TextStyles.font12BlueRegular(),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}
