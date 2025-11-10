class RestaurantProfileModel {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double rating;
  final int reviewCount;
  final bool isOPen;
  final List<String> cuisines;
  final List<MenuItem> menuItems;
  final RestaurantDetails details;
  final List<Review> reviews;
  final int deliveryFee;
  final String deliveryTime;

  RestaurantProfileModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
    required this.isOPen,
    required this.menuItems,
    required this.details,
    required this.reviews,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.cuisines,
  });
}

// ============================================================================
// FILE: lib/models/menu_item.dart
// PURPOSE: Define the structure of a Menu Item
//
class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category; // e.g., "Breakfast", "Dinner"
  bool isFavorite;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isFavorite = false,
  });
}

// ============================================================================
// FILE: lib/models/restaurant_details.dart
// PURPOSE: Define detailed information about a restaurant
// ============================================================================

class RestaurantDetails {
  final String fullDescription;
  final String address;
  final String phone;
  final String openingHours;
  final String deliveryTime;
  final String deliveryLocation;
  final List<String> paymentModes;
  final List<String> services;

  RestaurantDetails({
    required this.fullDescription,
    required this.address,
    required this.phone,
    required this.openingHours,
    required this.deliveryTime,
    required this.deliveryLocation,
    required this.paymentModes,
    required this.services,
  });
}

class Review {
  final String id;
  final String userName;
  final String userAvatar;
  final double rating;
  final String comment;
  final String timeAgo;
  final List<String> images;

  Review({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.rating,
    required this.comment,
    required this.timeAgo,
    this.images = const [],
  });
}
