// ============================================================================
// FILE: lib/screens/home_screen.dart
// PURPOSE: Display list of restaurants
// ============================================================================

import 'package:flutter/material.dart';
import 'package:grabby_app/models/restaurant_profile_model.dart';
import '../../data/restaurant_mock_data.dart';

import '../../widgets/restaurant_card.dart';
import '../restaurant_profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Get the list of restaurants from sample data
  late List<RestaurantProfileModel> restaurants;

  @override
  void initState() {
    super.initState();
    // Load restaurants when screen opens
    restaurants = SampleData.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Restaurants',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Search button
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // TODO: Add search functionality
              print('Search tapped');
            },
          ),
          // Filter button
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // TODO: Add filter functionality
              print('Filter tapped');
            },
          ),
        ],
      ),

      // Body - List of restaurants
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          // Use the RestaurantCard widget we created
          return RestaurantCard(
            restaurant: restaurant,

            // What happens when user taps the card?
            onTap: () {
              // Navigate to restaurant profile screen
              _navigateToRestaurantProfile(restaurant);
            },
          );
        },
      ),
    );
  }

  // Method to navigate to restaurant profile
  void _navigateToRestaurantProfile(RestaurantProfileModel restaurant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestaurantProfileScreen(
          restaurant: restaurant, // Pass the selected restaurant
        ),
      ),
    );
  }
}

