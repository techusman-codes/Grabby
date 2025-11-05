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
    // We take the first 4 categories to display in the row.
    // You can adjust this logic if you want to show a different set of categories.
    final displayedCategories = categories.take(4).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(displayedCategories.length, (index) {
        final category = displayedCategories[index];
        // Use a Flexible widget to allow the CategoryCard to shrink and fit.
        return Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width: 80, // Set a fixed width for the card
              child: CategoryCard(
                category: category,
                onTap: () => onCategoryTap(category),
              ),
            ),
          ),
        );
      }),
    );
  }
}
