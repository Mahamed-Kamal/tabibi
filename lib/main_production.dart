import 'package:flutter/material.dart';
import 'package:tabibi/core/helpers/shared_pref_keys.dart';
import 'package:tabibi/core/helpers/shared_preferences_helper.dart';
import 'core/di/dependency injection.dart';
import 'core/routing/app_router.dart';
import 'tabibi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkIfLoggedInUser();
  runApp( TabibiApp(appRouter: AppRouter()));
}

checkIfLoggedInUser()async{
  String? userToken = await SharedPreferencesHelper.getSecuredString(SharedPrefKeys.userToken);
  if(userToken != null && userToken.isNotEmpty){
    isLoggedInUser = true;
  }else{
    isLoggedInUser = false;
  }
}
