
class CartItemModel {
  final String id; // Unique ID for this cart item
  final String productId;
  final String productName;
  final String productImage;
  final double basePrice;
  int quantity;
  final String? size;
  final List<String>? addons;
  final String? restaurantId;
  final String? restaurantName;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.basePrice,
    required this.quantity,
    this.size,
    this.addons,
    this.restaurantId,
    this.restaurantName,
  });

  // Calculate total price for this item
  double get totalPrice => basePrice * quantity;

  // Format price
  String get formattedTotalPrice => 'N${totalPrice.toStringAsFixed(2)}';
  String get formattedBasePrice => 'N${basePrice.toStringAsFixed(2)}';

  // Create from JSON
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      quantity: json['quantity'] as int,
      size: json['size'] as String?,
      addons: (json['addons'] as List<dynamic>?)?.cast<String>(),
      restaurantId: json['restaurantId'] as String?,
      restaurantName: json['restaurantName'] as String?,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'basePrice': basePrice,
      'quantity': quantity,
      'size': size,
      'addons': addons,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
    };
  }

  // Create a copy with updated values
  CartItemModel copyWith({
    String? id,
    String? productId,
    String? productName,
    String? productImage,
    double? basePrice,
    int? quantity,
    String? size,
    List<String>? addons,
    String? restaurantId,
    String? restaurantName,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      basePrice: basePrice ?? this.basePrice,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      addons: addons ?? this.addons,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
    );
  }
}
