import 'package:flutter/material.dart';
import '../models/category_model.dart';
import 'category_card.dart';

class CustomCategorySection extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(CategoryModel) onCategoryTap;

  const CustomCategorySection({
    super.key,
    required this.categories,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // horizontal scroll
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final category = categories[index];

          return Container(
            width: 84,
            margin: const EdgeInsets.only(right: 12),
            child: CategoryCard(
              category: category,
              onTap: () => onCategoryTap(category),
            ),
          );
        },
      ),
    );
  }
}
