// ============================================================================
// FILE: lib/screens/home_screen.dart
// PURPOSE: Display list of restaurants
// ============================================================================

import 'package:flutter/material.dart';
import 'package:grabby_app/models/restaurant_profile_model.dart';
import '../../data/restaurant_mock_data.dart';
import '../../widgets/restaurant_card.dart';

import 'restaurant_profile_screen.dart';

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

// ============================================================================
// EXPLANATION:
// ============================================================================
//
// WHAT THIS SCREEN DOES:
// 1. Shows a list of restaurants
// 2. When user taps a restaurant, navigates to its profile
//
// KEY CONCEPTS:
//
// 1. StatefulWidget:
//    - Use this when screen needs to remember data or change
//    - initState() runs once when screen loads
//
// 2. ListView.builder:
//    - Efficiently creates a scrollable list
//    - Only builds visible items (good for performance)
//    - itemCount: How many items?
//    - itemBuilder: How to build each item?
//
// 3. Navigation:
//    Navigator.push() = "Go to new screen"
//    - Takes context (where you are)
//    - Takes route (where you're going)
//    - Passes data (restaurant object)
//
// 4. Reusable Widget:
//    - We use RestaurantCard widget
//    - Just pass restaurant data
//    - Card handles all the UI
//
// FLOW:
// User opens app → HomeScreen loads → Shows restaurant list
// User taps restaurant → _navigateToRestaurantProfile() called
// → Navigator.push() → RestaurantProfileScreen opens with data
//
// ============================================================================