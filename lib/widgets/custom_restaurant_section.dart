import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_routes.dart'; // ADD THIS IMPORT
import 'package:grabby_app/models/restaurant_profile_model.dart';
import 'package:grabby_app/widgets/restaurant_card.dart';

class CustomRestaurantSection extends StatelessWidget {
  final List<RestaurantProfileModel> restaurants;
  const CustomRestaurantSection({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return RestaurantCard(
            restaurant: restaurant,
            onTap: () {
              // Navigate to restaurant profile with restaurant data
              Navigator.pushNamed(
                context,
                AppRoutes.restaurant_profile,
                arguments: restaurant, // Pass the specific restaurant
              );
            },
          );
        },
      ),
    );
  }
}
