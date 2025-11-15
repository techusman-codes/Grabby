

import 'package:flutter/material.dart';
import 'package:grabby_app/models/product_model_screen.dart';
import 'package:grabby_app/screens/products/product_details_screen.dart';
import 'package:grabby_app/models/restaurant_profile_model.dart';
// show MenuItem, RestaurantProfileModel;
import '../core/constant/app_colors.dart';
import '../widgets/custom_restaurant_card.dart';



class RestaurantProfileScreen extends StatefulWidget {
  final RestaurantProfileModel restaurant; // Receives restaurant data

  const RestaurantProfileScreen({
    super.key,
    required this.restaurant, // MUST provide restaurant
  });

  @override
  State<RestaurantProfileScreen> createState() =>
      RestaurantProfileScreenState();
}

class RestaurantProfileScreenState extends State<RestaurantProfileScreen>
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
          icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Restaurant profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Restaurant Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
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
              unselectedLabelColor: Colors.black,
              indicatorColor: AppColors.softblue,
              indicatorWeight: 6,
              dividerColor: AppColors.softblue,
              labelStyle: const TextStyle(
                fontSize: 12,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
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
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 20,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                    Text(
                      '${items.length} dishes',
                      style: TextStyle(fontSize: 14, color: AppColors.black),
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
                          // 1. Convert MenuItem to ProductModelScreens
                          final product = ProductModelScreens(
                            name: item.name,
                            description: item.description,
                            image: item.imageUrl,
                            price: item.price,
                            rating: widget.restaurant.rating,
                            reviewCount: widget.restaurant.reviewCount,

                            // Use the helper to parse the string into a Duration
                            isFavorite: item.isFavorite,
                            // These are placeholders as they are not in MenuItem
                            deliveryFee: 2.50,
                            id: '',
                            categoryId: '',
                            categoryName: '',
                            sellerId: '',
                            sellerName: '',
                          );

                          // 2. Navigate to ProductDetailScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
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
          ],
        );
      },
    );
  }
}

// Category Button Widget
class CategoryButton extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
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
          Text(
            restaurant.details.fullDescription,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
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
          const SizedBox(height: 20),

          // Services
          const SectionTitle(title: 'Services'),
          const SizedBox(height: 8),
          ...restaurant.details.services
              .map(
                (service) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    service,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.black,
                      letterSpacing: 1,
                    ),
                  ),
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
        // Slidable Image Gallery
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: restaurant.menuItems.length,
            itemBuilder: (context, index) {
              final item = restaurant.menuItems[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildImageWidget(item.imageUrl, width: 300),
                ),
              );
            },
          ),
        ),

        // Section Title for Reviews
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionTitle(title: ''),
                Text(
                  '${restaurant.reviewCount} Reviews',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Reviews List
        Expanded(
          child: restaurant.reviews.isEmpty
              ? const Center(child: Text('No reviews yet'))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: restaurant.reviews.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 32),
                  itemBuilder: (context, index) {
                    return ReviewCard(review: restaurant.reviews[index]);
                  },
                ),
        ),

        // See All Reviews Button
        if (restaurant.reviews.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {
                // TODO: Navigate to all reviews screen
                print('See all reviews');
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'See All Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// Helper to build an image from either a network URL or a local asset
Widget _buildImageWidget(String imagePath, {double? width, double? height}) {
  // A placeholder for when the image path is empty
  if (imagePath.isEmpty) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      child: const Icon(Icons.image_not_supported),
    );
  }

  final isNetworkImage =
      imagePath.startsWith('http://') || imagePath.startsWith('https://');

  return Image(
    image:
        (isNetworkImage ? NetworkImage(imagePath) : AssetImage(imagePath))
            as ImageProvider,
    width: width,
    height: height,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.broken_image, size: 40),
  );
}
