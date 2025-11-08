// ============================================================================
// FILE: lib/screens/restaurant_profile_screen.dart
// PURPOSE: Show restaurant details with 3 tabs
// ============================================================================

import 'package:flutter/material.dart';
import 'package:grabby_app/models/restaurant_profile_model.dart'
    show MenuItem, RestaurantProfileModel;
import '../../widgets/custom_restaurant_card.dart';

// ============================================================================
// MAIN PROFILE SCREEN
// ============================================================================

class RestaurantProfileScreen extends StatefulWidget {
  final RestaurantProfileModel restaurant; // Receives restaurant data

  const RestaurantProfileScreen({
    super.key,
    required this.restaurant, // MUST provide restaurant
  });

  @override
  State<RestaurantProfileScreen> createState() =>
      _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState extends State<RestaurantProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Create tab controller for 3 tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Clean up when screen closes
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Restaurant profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),

      body: Column(
        children: [
          // Restaurant Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  widget.restaurant.name, // Use restaurant name from data
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Tab Bar
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF6B4CE6),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF6B4CE6),
              indicatorWeight: 3,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'Offerings and pricing'),
                Tab(text: 'Details'),
                Tab(text: 'Overview'),
              ],
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                OfferingsTab(restaurant: widget.restaurant),
                DetailsTab(restaurant: widget.restaurant),
                OverviewTab(restaurant: widget.restaurant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// TAB 1: OFFERINGS (Menu Items)
// ============================================================================

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
                child: _CategoryButton(
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

// Category Button Widget
class _CategoryButton extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryButton({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            isSelected ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 20,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            '$count dishes',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// TAB 2: DETAILS
// ============================================================================

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

// ============================================================================
// TAB 3: OVERVIEW (Reviews)
// ============================================================================

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

// ============================================================================
// EXPLANATION:
// ============================================================================
//
// THIS IS THE COMPLETE RESTAURANT PROFILE SCREEN
//
// STRUCTURE:
// 1. Main Screen (RestaurantProfileScreen)
//    - Has TabController for 3 tabs
//    - Receives Restaurant object
//    - Passes restaurant to each tab
//
// 2. Tab 1 (OfferingsTab):
//    - Groups menu items by category
//    - Shows category buttons
//    - Lists menu items using MenuItemCard widget
//
// 3. Tab 2 (DetailsTab):
//    - Shows all restaurant details
//    - Uses data from restaurant.details
//    - Displays cuisines, services, contact, etc.
//
// 4. Tab 3 (OverviewTab):
//    - Shows reviews
//    - Uses ReviewCard widget for each review
//    - Shows "See All Reviews" button
//
// KEY CONCEPTS:
// - widget.restaurant: Access restaurant data passed from parent
// - setState(): Update UI when data changes
// - TabController: Manage multiple tabs
// - Map/List manipulation: Group and filter data
//
// ============================================================================
