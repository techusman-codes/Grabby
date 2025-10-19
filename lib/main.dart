import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/core/themes/app_theme.dart';
import 'package:grabby_app/screens/onborading_screens.dart';

import 'screens/splash/splash_screen.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage service
  await StorageService.instance.init();

  // TODO: Initialize Firebase here
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        // We'll add more routes as we build screens
      },
    );
  }
}
