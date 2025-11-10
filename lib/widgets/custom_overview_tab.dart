import 'package:flutter/material.dart';
import 'package:grabby_app/models/restaurant_profile_model.dart';

import 'custom_restaurant_card.dart';

class OverviewTab extends StatelessWidget {
  final RestaurantProfileModel restaurant;

  const OverviewTab({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with images
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(restaurant.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(restaurant.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Reviews (${restaurant.reviewCount})',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Reviews List
        Expanded(
          child: restaurant.reviews.isEmpty
              ? const Center(child: Text('No reviews yet'))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: restaurant.reviews.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 32),
                  itemBuilder: (context, index) {
                    return ReviewCard(review: restaurant.reviews[index]);
                  },
                ),
        ),

        // See All Reviews Button
        if (restaurant.reviews.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton(
              onPressed: () {
                // TODO: Navigate to all reviews screen
                print('See all reviews');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF6B4CE6)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'See All Reviews',
                style: TextStyle(
                  color: Color(0xFF6B4CE6),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
