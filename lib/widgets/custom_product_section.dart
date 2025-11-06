import 'package:flutter/material.dart';
import 'package:grabby_app/models/product_model.dart';

import 'products_card.dart';

class ProductSection extends StatelessWidget {
  final List<ProductModel> products;

  final String? title;
  final void Function(ProductModel product) onProductTap;
  final void Function(String productId) onFavoriteToggle;
  final Set<String> favoriteProducts;

  const ProductSection({
    super.key,
    this.title,
    required this.products,
    required this.onProductTap,
    required this.onFavoriteToggle,
    required this.favoriteProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Product Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onTap: () => onProductTap(product),
                onFavoriteToggle: () => onFavoriteToggle(product.id),
                isFavorite: favoriteProducts.contains(product.id),
              );
            },
          ),
        ),
      ],
    );
  }
}
