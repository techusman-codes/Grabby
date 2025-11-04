import 'package:flutter/material.dart';

import 'package:grabby_app/core/constant/app_images.dart';
import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/data/mock_data.dart';
import 'package:grabby_app/models/category_model.dart';
import 'package:grabby_app/models/product_model.dart';
import 'package:grabby_app/models/restaurant_model.dart';
//import 'package:grabby_app/core/constant/app_text_style.dart';
import 'package:grabby_app/widgets/custom_app_bar.dart';
import 'package:grabby_app/widgets/custom_restaurant_section.dart';
import 'package:grabby_app/widgets/search_bar_widget.dart';

import '../../core/constant/app_text_style.dart';
//import 'package:grabby_app/widgets/search_bar_widget.dart';

/// Main home screen of the app
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  // Mock Data
  final List<CategoryModel> categories = MockData.categories.take(12).toList();
  final List<RestaurantModel> restaurants = MockData.restaurants;
  final List<ProductModel> products = MockData.products;
  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(horizontalPadding),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20),
                  CustomAppBar(
                    profileName: AppStrings.profileText,
                    profileImage: AppImages.userProfile,
                    location: "Lagos Nigeria",
                  ),
                  SizedBox(height: 16),
                  SearchWithFilter(
                    controller: TextEditingController(),
                    hintText: AppStrings.searchBarhintText,
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppStrings.restaurantText,
                    style: AppTextStyles.displaySmall,
                  ),
                  SizedBox(height: 20),
                  CustomRestaurantSection(restaurants: restaurants),
                ]),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
    );
  }
}
