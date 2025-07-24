import 'package:flutter/material.dart';
import 'core/di/dependency injection.dart';
import 'core/routing/app_router.dart';
import 'tabibi_app.dart';

void main() {
  setupGetIt();
  runApp( TabibiApp(appRouter: AppRouter()));
}
