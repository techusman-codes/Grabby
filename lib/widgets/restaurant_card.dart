import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_routes.dart'; // ADD THIS

import '../models/restaurant_profile_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantProfileModel restaurant;
  final VoidCallback? onTap; // Make this optional now

  const RestaurantCard({
    super.key,
    required this.restaurant,
    this.onTap, // Optional - if not provided, will navigate automatically
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // If custom onTap is provided, use it
        // Otherwise, navigate to restaurant profile
        if (onTap != null) {
          onTap!();
        } else {
          // Navigate to restaurant profile with restaurant data
          Navigator.pushNamed(
            context,
            AppRoutes.restaurant_profile,
            arguments: restaurant, // Pass the restaurant object
          );
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant image
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 10.0,
                bottom: 7.0,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: restaurant.imagePath.startsWith('http')
                    ? Image.network(
                        restaurant.imagePath,
                        height: 125,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 125),
                      )
                    : Image.asset(
                        restaurant.imagePath,
                        height: 125,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 125),
                      ),
              ),
            ),

            // Restaurant info
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    restaurant.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),

                  // Rating, time, location row
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: AppColors.starActive),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.rating.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${restaurant.reviewCount})',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const Spacer(), // Use Spacer to push items apart
                      if (restaurant.deliveryTime.isNotEmpty)
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              restaurant.deliveryTime,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
