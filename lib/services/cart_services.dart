import 'package:flutter/foundation.dart';
import '../models/cart_item_model.dart';

class CartService extends ChangeNotifier {
  // Singleton pattern - only one instance exists
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  // Get the singleton instance
  static CartService get instance => _instance;

  // List of items in cart
  final List<CartItemModel> _items = [];

  // Getter to access items (read-only)
  List<CartItemModel> get items => List.unmodifiable(_items);

  // Get total number of items
  int get itemCount => _items.length;

  // Get total quantity of all items
  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  // Calculate subtotal (sum of all item prices)
  double get subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);

  // Delivery fee (you can make this dynamic based on location)
  double get deliveryFee => 500.0;

  // Calculate total (subtotal + delivery)
  double get total => subtotal + deliveryFee;

  // Formatted prices
  String get formattedSubtotal => 'N${subtotal.toStringAsFixed(2)}';
  String get formattedDeliveryFee => 'N${deliveryFee.toStringAsFixed(2)}';
  String get formattedTotal => 'N${total.toStringAsFixed(2)}';

  // Check if cart is empty
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  // Add item to cart
  void addItem(CartItemModel item) {
    // Check if item already exists
    final existingIndex = _items.indexWhere((cartItem) {
      // Basic match: product ID and size must be the same.
      final bool isProductMatch = cartItem.productId == item.productId;
      final bool isSizeMatch = cartItem.size == item.size;

      final bool isAddonMatch = listEquals(cartItem.addons, item.addons);

      return isProductMatch && isSizeMatch && isAddonMatch;
    });

    if (existingIndex >= 0) {
      // Item exists, increase quantity
      _items[existingIndex].quantity += item.quantity;
    } else {
      // New item, add to cart
      _items.add(item);
    }

    notifyListeners(); // Notify UI to update
    _printCartStatus();
  }

  // Remove item from cart
  void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
    _printCartStatus();
  }

  // Update item quantity
  void updateQuantity(String itemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(itemId);
      return;
    }

    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  // Increment item quantity
  void incrementQuantity(String itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  // Decrement item quantity
  void decrementQuantity(String itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
        notifyListeners();
      } else {
        // Remove if quantity becomes 0
        removeItem(itemId);
      }
    }
  }

  // Clear entire cart
  void clearCart() {
    _items.clear();
    notifyListeners();
    print('🛒 Cart cleared');
  }

  // Get specific item
  CartItemModel? getItem(String itemId) {
    try {
      return _items.firstWhere((item) => item.id == itemId);
    } catch (e) {
      return null;
    }
  }

  // Debug: Print cart status
  void _printCartStatus() {
    print('🛒 Cart Status:');
    print('   Items: $itemCount');
    print('   Total Quantity: $totalQuantity');
    print('   Subtotal: $formattedSubtotal');
    print('   Total: $formattedTotal');
  }
}
