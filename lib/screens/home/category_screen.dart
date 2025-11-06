import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import '../../core/constant/app_colors.dart';

import '../../data/mock_data.dart';
import '../../models/category_model.dart';
import '../../widgets/category_card.dart';

/// Categories screen showing all available categories
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<CategoryModel> categories = MockData.categories;

  /// Handle category tap
  void _onCategoryTap(CategoryModel category) {
    // TODO: Navigate to category products
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${category.name} - ${category.productCount} items'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () =>
              Navigator.of(context).popAndPushNamed(AppRoutes.main_screen),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
              onTap: () => _onCategoryTap(categories[index]),
              showProductCount: true,
            );
          },
        ),
      ),
    );
  }
}
