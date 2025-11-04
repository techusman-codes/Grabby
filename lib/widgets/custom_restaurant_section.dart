import 'package:flutter/material.dart';
import 'package:grabby_app/widgets/restaurant_card.dart';

class CustomRestaurantSection extends StatelessWidget {
  final List restaurants;
  const CustomRestaurantSection({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return RestaurantCard(restaurant: restaurant, onTap: () {});
        },
      ),
    );
  }
}
