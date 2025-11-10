import 'package:flutter/material.dart';

import '../models/restaurant_profile_model.dart';

import 'custom_category_button.dart';
import 'custom_menu_item_card.dart';


class OfferingsTab extends StatefulWidget {
  final RestaurantProfileModel restaurant;

  const OfferingsTab({super.key, required this.restaurant});

  @override
  State<OfferingsTab> createState() => _OfferingsTabState();
}

class _OfferingsTabState extends State<OfferingsTab> {
  String selectedCategory = 'Breakfast';

  // Group menu items by category
  Map<String, List<MenuItem>> _groupMenuItems() {
    final Map<String, List<MenuItem>> grouped = {};

    for (var item in widget.restaurant.menuItems) {
      if (!grouped.containsKey(item.category)) {
        grouped[item.category] = [];
      }
      grouped[item.category]!.add(item);
    }

    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final groupedItems = _groupMenuItems();
    final categories = groupedItems.keys.toList();

    // Set initial category if needed
    if (!categories.contains(selectedCategory) && categories.isNotEmpty) {
      selectedCategory = categories.first;
    }

    return Column(
      children: [
        // Category Headers
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
            ),
          ),
          child: Row(
            children: categories.map((category) {
              final itemCount = groupedItems[category]?.length ?? 0;
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CategoryButton(
                  label: category,
                  count: itemCount,
                  isSelected: selectedCategory == category,
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),

        // Menu Items List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: groupedItems[selectedCategory]?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final item = groupedItems[selectedCategory]![index];
              return MenuItemCard(
                item: item,
                onTap: () {
                  // TODO: Show item details or add to cart
                  print('Tapped: ${item.name}');
                },
                onFavoriteToggle: () {
                  setState(() {
                    item.isFavorite = !item.isFavorite;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
