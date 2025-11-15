import 'package:flutter/material.dart';
import '../../models/restaurant_profile_model.dart';
import '../../core/constant/app_colors.dart';
import '../../data/image_utils.dart';

class MenuItemDetailScreen extends StatefulWidget {
  final MenuItem menuItem;
  final String restaurantName;
  final String? restaurantId;
  final int? deliveryTime;
  final double? deliveryFee;

  const MenuItemDetailScreen({
    super.key,
    required this.menuItem,
    required this.restaurantName,
    this.restaurantId,
    this.deliveryTime,
    this.deliveryFee,
  });

  @override
  State<MenuItemDetailScreen> createState() => _MenuItemDetailScreenState();
}

class _MenuItemDetailScreenState extends State<MenuItemDetailScreen> {
  int quantity = 1;
  String selectedSize = 'Regular'; // Default size
  List<String> selectedAddons = [];

  // Available sizes
  final List<Map<String, dynamic>> sizes = [
    {'name': 'Regular', 'price': 0},
    {'name': 'Large', 'price': 500},
    {'name': 'Extra Large', 'price': 1000},
  ];

  // Available add-ons
  final List<Map<String, dynamic>> addons = [
    {'name': 'Extra Cheese', 'price': 200},
    {'name': 'Bacon', 'price': 300},
    {'name': 'Avocado', 'price': 250},
  ];

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  double _calculateTotalPrice() {
    double basePrice = widget.menuItem.price;

    // Add size price
    final sizePrice =
        sizes.firstWhere(
              (s) => s['name'] == selectedSize,
              orElse: () => {'price': 0},
            )['price']
            as int;

    // Add addons price
    double addonsPrice = 0;
    for (var addon in selectedAddons) {
      final addonPrice =
          addons.firstWhere(
                (a) => a['name'] == addon,
                orElse: () => {'price': 0},
              )['price']
              as int;
      addonsPrice += addonPrice;
    }

    return (basePrice + sizePrice + addonsPrice) * quantity;
  }

  void _addToCart() {
    // TODO: Implement cart service (next step)
    // For now, show success message

    final cartItem = {
      'menuItem': widget.menuItem,
      'restaurantName': widget.restaurantName,
      'restaurantId': widget.restaurantId,
      'quantity': quantity,
      'size': selectedSize,
      'addons': selectedAddons,
      'totalPrice': _calculateTotalPrice(),
    };

    print('Adding to cart: $cartItem');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.menuItem.name} (x$quantity) added to cart!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'VIEW CART',
          textColor: Colors.white,
          onPressed: () {
            // TODO: Navigate to cart screen
            // Navigator.pushNamed(context, AppRoutes.cart_screen);
          },
        ),
      ),
    );

    // Optional: Go back after adding
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Item Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.menuItem.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: widget.menuItem.isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                widget.menuItem.isFavorite = !widget.menuItem.isFavorite;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item Image
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: Image(
                      image: resolveImageProvider(widget.menuItem.imageUrl),
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.restaurant,
                            size: 100,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Item Name
                        Text(
                          widget.menuItem.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Restaurant Name
                        Row(
                          children: [
                            Icon(
                              Icons.store,
                              size: 18,
                              color: AppColors.softblue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.restaurantName,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.softblue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Price
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.softblue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'N${widget.menuItem.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.softblue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Description
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.menuItem.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Delivery Info
                        if (widget.deliveryTime != null ||
                            widget.deliveryFee != null)
                          Row(
                            children: [
                              if (widget.deliveryTime != null)
                                Expanded(
                                  child: _buildInfoCard(
                                    icon: Icons.access_time,
                                    label: 'Delivery Time',
                                    value: '${widget.deliveryTime} mins',
                                  ),
                                ),
                              if (widget.deliveryTime != null &&
                                  widget.deliveryFee != null)
                                const SizedBox(width: 12),
                              if (widget.deliveryFee != null)
                                Expanded(
                                  child: _buildInfoCard(
                                    icon: Icons.delivery_dining,
                                    label: 'Delivery Fee',
                                    value:
                                        'N${widget.deliveryFee!.toStringAsFixed(0)}',
                                  ),
                                ),
                            ],
                          ),
                        const SizedBox(height: 24),

                        // Size Selection
                        const Text(
                          'Select Size',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          children: sizes.map((size) {
                            final isSelected = selectedSize == size['name'];
                            return ChoiceChip(
                              label: Column(
                                children: [
                                  Text(size['name']),
                                  if (size['price'] > 0)
                                    Text(
                                      '+N${size['price']}',
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                ],
                              ),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  selectedSize = size['name'];
                                });
                              },
                              selectedColor: AppColors.softblue.withOpacity(
                                0.2,
                              ),
                              labelStyle: TextStyle(
                                color: isSelected
                                    ? AppColors.softblue
                                    : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),

                        // Add-ons
                        const Text(
                          'Add-ons (Optional)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...addons.map((addon) {
                          final isSelected = selectedAddons.contains(
                            addon['name'],
                          );
                          return CheckboxListTile(
                            title: Text(addon['name']),
                            subtitle: Text('+N${addon['price']}'),
                            value: isSelected,
                            activeColor: AppColors.softblue,
                            onChanged: (selected) {
                              setState(() {
                                if (selected == true) {
                                  selectedAddons.add(addon['name']);
                                } else {
                                  selectedAddons.remove(addon['name']);
                                }
                              });
                            },
                          );
                        }).toList(),

                        const SizedBox(height: 100), // Space for bottom bar
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Bar - Add to Cart
          Container(
            padding: const EdgeInsets.all(16),
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
              child: Row(
                children: [
                  // Quantity Selector
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: _decrementQuantity,
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _incrementQuantity,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Add to Cart Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _addToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.softblue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Add to Cart - ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'N${_calculateTotalPrice().toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.softblue),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
