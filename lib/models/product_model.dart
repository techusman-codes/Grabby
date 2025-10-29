/// Product model representing an item for sale
class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String categoryId;
  final String? merchantId;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final List<String>? tags;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    this.merchantId,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isAvailable = true,
    this.tags,
  });

  /// Format price as currency
  String get formattedPrice {
    return '₦${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  /// Check if product has discount
  bool get hasDiscount => false; // Implement discount logic later

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      categoryId: json['categoryId'] as String,
      merchantId: json['merchantId'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'categoryId': categoryId,
      'merchantId': merchantId,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'tags': tags,
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? image,
    String? categoryId,
    String? merchantId,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    List<String>? tags,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      merchantId: merchantId ?? this.merchantId,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      tags: tags ?? this.tags,
    );
  }
}
