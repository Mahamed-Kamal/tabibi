import 'package:flutter/material.dart';
import 'package:tabibi/core/routing/routes.dart';
import '../../features/ui/login/login_screen.dart';
import '../../features/ui/onboarding/screens/onboarding_screen.dart';

class AppRouter {

  Route generatedRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return unDefinedRoute();
    }
  }

  Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }

}
