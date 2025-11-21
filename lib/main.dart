import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grabby_app/data/restaurant_mock_data.dart';
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
import 'package:grabby_app/screens/restaurants/home_screen.dart';
import 'models/product_model_screen.dart';
import 'models/restaurant_profile_model.dart';
import 'screens/category/categrory_screen.dart';
import 'screens/home/favorite_screen.dart';
import 'screens/home/shoping_cart_screen.dart';
import 'screens/menu/menu_items_details_screen.dart';
import 'screens/products/product_details_screen.dart';
import 'screens/restaurant_profile_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'services/storage_service.dart';

/// A one-time function to upload mock data to Firestore.
/// Run the app once with this, then remove the call in main().
Future<void> uploadMockData() async {
  final firestore = FirebaseFirestore.instance;
  final restaurants = SampleData.getRestaurants();

  // Use a batch write for efficiency
  final batch = firestore.batch();

  for (var restaurant in restaurants) {
    // Create a document reference for each restaurant in the 'restaurants' collection
    final docRef = firestore.collection('restaurants').doc(restaurant.id);
    batch.set(docRef, restaurant.toJson());
  }

  try {
    await batch.commit();
    debugPrint('✅ Successfully uploaded mock data to Firestore!');
  } catch (e) {
    debugPrint('❌ Error uploading mock data: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage service
  await StorageService.instance.init();

  await Firebase.initializeApp();

  // TODO: Run this once to upload data, then REMOVE this line.
  // await uploadMockData();

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
        },
        AppRoutes.categorysecreen: (context) => const CategoriesScreen(),
        AppRoutes.profile_screen: (context) => const ProfileScreen(),
        AppRoutes.favorite_screen: (context) => const FavoriteScreen(),
        AppRoutes.shopingCart: (context) => const ShoppingCartScreen(),
        AppRoutes.home_screen: (context) => const HomeScreen(),
        AppRoutes.cart_screen: (context) => ShoppingCartScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.restaurant_profile) {
          final restaurant = settings.arguments as RestaurantProfileModel;
          return MaterialPageRoute(
            builder: (context) =>
                RestaurantProfileScreen(restaurant: restaurant),
          );
        }

        if (settings.name == AppRoutes.maincategory_screen) {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => CategoryScreen(
              categoryId: args['categoryId']!,
              categoryName: args['categoryName']!,
            ),
          );
        }
        if (settings.name == AppRoutes.productDetail) {
          final product = settings.arguments as ProductModelScreens;
          return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          );
        }
        if (settings.name == AppRoutes.menuItemDetails) {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => MenuItemDetailScreen(
              menuItem: args['menuItem'] as MenuItem,
              restaurantName: args['restaurantName'] as String,
              restaurantId: args['restaurantId'] as String?,
              deliveryTime: args['deliveryTime'] as int?,
              deliveryFee: args['deliveryFee'] as double?,
            ),
          );
        }
        return null;
      },
    );
  }
}
