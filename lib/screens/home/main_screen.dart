import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/core/constant/app_string.dart';

import '../../core/constant/app_routes.dart';
import '../../data/mock_data.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../models/restaurant_model.dart';
import '../../services/storage_service.dart';

import '../../widgets/category_card.dart';
import '../../widgets/products_card.dart';
import '../../widgets/restaurant_card.dart';
import '../../widgets/search_bar_widget.dart';

/// Main home screen of the app
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  // Mock data
  final List<CategoryModel> _categories = MockData.categories.take(20).toList();
  final List<RestaurantModel> _restaurants = MockData.restaurants;
  final List<ProductModel> _products = MockData.products;

  // Favorites (for demo)
  final Set<String> _favoriteProducts = {};

  // User name (from storage)
  // String _userName = 'Usman';

  // @override
  // void initState() {
  //   super.initState();
  //   _loadUserInfo();
  // }

  /// Load user info from storage
  // void _loadUserInfo() {
  //   final name = StorageService.instance.getUserName();
  //   if (name != null && name.isNotEmpty) {
  //     setState(() {
  //       _userName = name.split(' ')[0]; // First name only
  //     });
  //   }
  // }

  /// Handle logout
  Future<void> _handleLogout() async {
    // show and comfirm Dialogue box
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text('Logout'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await StorageService.instance.clearAll();

      if (mounted) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
      }
    }
  }

  /// Toggle favorite
  void _toggleFavorite(String productId) {
    setState(() {
      if (_favoriteProducts.contains(productId)) {
        _favoriteProducts.remove(productId);
      } else {
        _favoriteProducts.add(productId);
      }
    });
  }

  /// Navigate to categories screen
  void _navigateToCategories() {
    Navigator.of(context).pushNamed(AppRoutes.categories);
  }

  /// Handle category tap
  void _onCategoryTap(CategoryModel category) {
    // TODO: Navigate to category products
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Category: ${category.name}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Handle restaurant tap
  void _onRestaurantTap(RestaurantModel restaurant) {
    // TODO: Navigate to restaurant details
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Restaurant: ${restaurant.name}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Handle product tap
  void _onProductTap(ProductModel product) {
    // TODO: Navigate to product details
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product: ${product.name}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Handle search tap
  // void _onSearchTap() {
  //   // TODO: Navigate to search screen
  //   // ScaffoldMessenger.of(context).showSnackBar(
  //   //   SnackBar(
  //   //     content: Text('Search - Coming soon!'),
  //   //     behavior: SnackBarBehavior.floating,
  //   //   ),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildAppBar()),

              // Search Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SearchBarWidget(),
                ),
              ),

              // Popular Restaurants Section
              SliverToBoxAdapter(child: _buildRestaurantsSection()),
              // Categories Section
              SliverToBoxAdapter(child: _buildCategoriesSection()),

              // Recommended Products Section
              SliverToBoxAdapter(child: _buildProductsSection()),

              // Bottom spacing
              SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  /// Build app bar
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 First Row: Profile, Welcome Text, Notification
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  // 👤 Profile Picture
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    backgroundImage: const AssetImage(
                      'assets/images/ucee.jpeg',
                    ),
                  ),
                  const SizedBox(width: 18),

                  Text(
                    AppStrings.profileText,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: AppColors.textPrimary,
                onPressed: () {
                  // TODO: Handle notifications
                },
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Icon(Icons.location_on, size: 25, color: Colors.black),
              SizedBox(width: 4),
              Text(
                'Zaria, Nigeria',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build categories section
  Widget _buildCategoriesSection() {
    return Column(
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: _navigateToCategories,
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Categories grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                category: _categories[index],
                onTap: () => _onCategoryTap(_categories[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Build restaurants section
  Widget _buildRestaurantsSection() {
    return Column(
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular restaurants new you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),

        // Horizontal scrolling list
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(
                restaurant: _restaurants[index],
                onTap: () => _onRestaurantTap(_restaurants[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Build products section
  Widget _buildProductsSection() {
    return Column(
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Products grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: _products.length,
            itemBuilder: (context, index) {
              final product = _products[index];
              return ProductCard(
                product: product,
                onTap: () => _onProductTap(product),
                onFavoriteToggle: () => _toggleFavorite(product.id),
                isFavorite: _favoriteProducts.contains(product.id),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Build bottom navigation bar
  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'Home',
                isActive: true,
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons.favorite_border,
                label: 'Favorite',
                isActive: false,
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons.apps,
                label: 'Category',
                isActive: false,
                onTap: _navigateToCategories,
              ),
              _buildNavItem(
                icon: Icons.shopping_cart_outlined,
                label: 'Cart',
                isActive: false,
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                isActive: false,
                onTap: _handleLogout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build navigation item
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.primary : AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
