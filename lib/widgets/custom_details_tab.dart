import 'package:flutter/material.dart';

import '../models/restaurant_profile_model.dart';
import 'custom_restaurant_card.dart';

class DetailsTab extends StatelessWidget {
  final RestaurantProfileModel restaurant;

  const DetailsTab({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description
          const SectionTitle(title: 'Description'),
          const SizedBox(height: 8),
          Text(
            restaurant.details.fullDescription,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Cuisines
          const SectionTitle(title: 'Cuisines'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: restaurant.cuisines
                .map((cuisine) => CuisineChip(label: cuisine))
                .toList(),
          ),
          const SizedBox(height: 24),

          // Services
          const SectionTitle(title: 'Services'),
          const SizedBox(height: 8),
          ...restaurant.details.services
              .map(
                (service) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(service, style: const TextStyle(fontSize: 14)),
                ),
              )
              .toList(),
          const SizedBox(height: 24),

          // Opening Hours
          const SectionTitle(title: 'Opening hours'),
          const SizedBox(height: 8),
          Text(
            restaurant.details.openingHours,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),

          // Delivery Time
          const SectionTitle(title: 'Delivery time'),
          const SizedBox(height: 8),
          Text(
            restaurant.details.deliveryTime,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),

          // Delivery Location
          const SectionTitle(title: 'Delivery location'),
          const SizedBox(height: 8),
          Text(
            restaurant.details.deliveryLocation,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),

          // Payment Modes
          const SectionTitle(title: 'Payment mode'),
          const SizedBox(height: 8),
          ...restaurant.details.paymentModes
              .map(
                (mode) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(mode, style: const TextStyle(fontSize: 14)),
                ),
              )
              .toList(),
          const SizedBox(height: 24),

          // Contact
          const SectionTitle(title: 'Contact'),
          const SizedBox(height: 12),
          _ContactRow(
            icon: Icons.location_on_outlined,
            text: restaurant.details.address,
            color: const Color(0xFF6B4CE6),
          ),
          const SizedBox(height: 12),
          _ContactRow(
            icon: Icons.phone_outlined,
            text: restaurant.details.phone,
            color: const Color(0xFF6B4CE6),
          ),
          const SizedBox(height: 12),
          _ContactRow(
            icon: Icons.access_time,
            text: 'Open now: ${restaurant.details.openingHours}',
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}

// Contact Row Widget
class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _ContactRow({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 14, color: color)),
        ),
      ],
    );
  }
}