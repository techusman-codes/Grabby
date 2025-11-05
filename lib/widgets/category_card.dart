import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import '../models/category_model.dart';


class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  final bool showProductCount;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    this.showProductCount = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon/Emoji
            Text(category.icon, style: TextStyle(fontSize: 32)),

            const SizedBox(height: 8),

            // Category name
            Text(
              category.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // Product count (optional)
            if (showProductCount) ...[
              const SizedBox(height: 4),
              Text(
                '${category.productCount} items',
                style: TextStyle(fontSize: 10, color: AppColors.textHint),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

