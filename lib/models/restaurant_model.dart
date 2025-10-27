/// Product model representing a single product/item
class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final String merchantId;
  final String merchantName;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final bool isFavorite;
  
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.merchantId,
    required this.merchantName,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isAvailable = true,
    this.isFavorite = false,
  });
  
  /// Create from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      category: json['category'] as String,
      merchantId: json['merchantId'] as String,
      merchantName: json['merchantName'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }
  
  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'merchantId': merchantId,
      'merchantName': merchantName,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'isFavorite': isFavorite,
    };
  }
  
  /// Create a copy with modified fields
  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? image,
    String? category,
    String? merchantId,
    String? merchantName,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
      merchantId: merchantId ?? this.merchantId,
      merchantName: merchantName ?? this.merchantName,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}