import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibi/core/routing/app_router.dart';
import 'core/helpers/shared_pref_keys.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors_manager.dart';

class TabibiApp extends StatelessWidget {
  final AppRouter appRouter;
  const TabibiApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generatedRoute,
        initialRoute: isLoggedInUser? Routes.homeScreen :Routes.onBoarding,
        theme:ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: ColorsManager.mainBlue,
            selectionColor: ColorsManager.mainBlue,
          )


        ),
      ),
    );
  }
}



