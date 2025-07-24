import 'package:flutter/material.dart';
import 'package:tabibi/core/di/dependency%20injection.dart';
import 'package:tabibi/core/routing/routes.dart';
import 'package:tabibi/features/home/logic/home_cubit.dart';
import 'package:tabibi/features/sign_up/logic/sign_up_cubit.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/screens/login_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/sign_up/ui/screens/sign_up_screen.dart';

class AppRouter {
  Route generatedRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..emitSpecializationData(),
            child: const HomeScreen(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
