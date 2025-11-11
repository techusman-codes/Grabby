import 'package:flutter/material.dart';
import '../models/restaurant_profile_model.dart';
import 'custom_menu_item_card.dart';

class OfferingsTab extends StatefulWidget {
  final RestaurantProfileModel restaurant;

  const OfferingsTab({super.key, required this.restaurant});

  @override
  State<OfferingsTab> createState() => _OfferingsTabState();
}

class _OfferingsTabState extends State<OfferingsTab> {
  // To track expanded categories
  Map<String, bool> expandedCategories = {};

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

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final items = groupedItems[category]!;
        final isExpanded = expandedCategories[category] ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Header Row
            InkWell(
              onTap: () {
                setState(() {
                  expandedCategories[category] = !isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Category Name
                    Row(
                      children: [
                        Text(
                          category,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 20,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                    Text(
                      '${items.length} dishes',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Expanded Items (if expanded)
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: List.generate(items.length, (i) {
                    final item = items[i];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: MenuItemCard(
                        item: item,
                        onTap: () {
                          print('Tapped: ${item.name}');
                        },
                        onFavoriteToggle: () {
                          setState(() {
                            item.isFavorite = !item.isFavorite;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),

            // Divider line after each category
            const Divider(
              height: 1,
              color: Color(0xFFE0E0E0),
            ),
          ],
        );
      },
    );
  }
}
