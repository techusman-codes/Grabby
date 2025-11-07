import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/core/themes/app_theme.dart';
import 'package:grabby_app/features/enable_location_screen.dart';
import 'package:grabby_app/screens/auth/forgot_password.dart';
import 'package:grabby_app/screens/auth/login_screen.dart';
import 'package:grabby_app/screens/auth/registra_screen.dart';
import 'package:grabby_app/screens/auth/veriition_screen.dart';
import 'package:grabby_app/screens/home/category_screen.dart';
import 'package:grabby_app/screens/home/main_screen.dart';
import 'package:grabby_app/screens/home/profile_screen.dart';
import 'package:grabby_app/screens/location/location_permission.dart';
import 'package:grabby_app/screens/onboaring/widgets/account_activate_screen.dart';
import 'package:grabby_app/screens/onborading_screens.dart';
import 'screens/home/cart_screen.dart';
import 'screens/home/favorite_screen.dart';
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
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
        AppRoutes.activateAccount: (context) => const AccountActivatedScreen(),
        AppRoutes.enableLocation: (context) => const EnableLocationScreen(),
        AppRoutes.main_screen: (context) => const MainScreen(),
        AppRoutes.categories: (context) => const CategoriesScreen(),
        AppRoutes.locationscreen: (context) => const LocationPermissionScreen(),
        AppRoutes.verification: (context) {
          // Get email from arguments
          final email = ModalRoute.of(context)?.settings.arguments as String?;
          return VerificationScreen(email: email);

          // We'll add more routes as we build screens
        },
        AppRoutes.categorysecreen: (context) => const CategoriesScreen(),
        AppRoutes.profile_screen: (context) => const ProfileScreen(),
        AppRoutes.favorite_screen: (context) => const FavoriteScreen(),
        AppRoutes.cart_screen: (context) => const CartScreen(),
      },
    );
  }
}
