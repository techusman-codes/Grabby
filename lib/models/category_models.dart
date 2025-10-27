/// Category model representing a product category
/// 
/// Used throughout the app for categorizing products
class CategoryModel {
  final String id;
  final String name;
  final String icon; // Emoji or asset path
  final String? image; // Optional category image
  final int productCount; // Number of products in category
  
  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.image,
    this.productCount = 0,
  });
  
  /// Create from JSON (for API integration later)
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      image: json['image'] as String?,
      productCount: json['productCount'] as int? ?? 0,
    );
  }
  
  /// Convert to JSON (for API integration later)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'image': image,
      'productCount': productCount,
    };
  }
  
  /// Create a copy with modified fields
  CategoryModel copyWith({
    String? id,
    String? name,
    String? icon,
    String? image,
    int? productCount,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      productCount: productCount ?? this.productCount,
    );
  }
}