import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_images.dart';

/// Reusable Custom Bottom Navigation Bar
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                imagePath: AppImages.home,
                label: 'Home',
                isActive: currentIndex == 0,
                onTap: () => onItemSelected(0),
              ),
              NavItem(
                imagePath: AppImages.favorite,
                label: 'Favorite',
                isActive: currentIndex == 1,
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.favorite_screen),
              ),
              NavItem(
                imagePath: AppImages.category,
                label: 'Category',
                isActive: currentIndex == 2,
                onTap: () => Navigator.pushNamed(context, AppRoutes.categories),
              ),
              NavItem(
                imagePath: AppImages.cart,
                label: 'Cart',
                isActive: currentIndex == 3,
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.cart_screen),
              ),
              NavItem(
                imagePath: AppImages.profile,
                label: 'Profile',
                isActive: currentIndex == 4,
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.profile_screen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 Reusable single navigation item widget
class NavItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.imagePath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              color: isActive ? AppColors.softblue : AppColors.textSecondary,
              width: 40,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? AppColors.softblue : AppColors.textSecondary,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
