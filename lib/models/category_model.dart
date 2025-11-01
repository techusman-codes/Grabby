/// this is going to be used throoughout the app
class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String icon;
  final int productCount; // Number of Product in the category

  CategoryModel({
    required this.name,
    required this.image,
    required this.icon,
    this.productCount = 0,
    required this.id,
  });

  // Create From Json (for API integration later)
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] as String,
      image: json['image'] as String,
      icon: json['icon'] as String,
      id: json['id'] as String,
      productCount: json['productCount'] as int? ?? 0,
    );
  }

  /// convert Json to API integration later
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'icon': icon,
      'prosuctCount': productCount,
    };
  }

  // create a copy with modified files
  CategoryModel copyWith({
    String? id,
    String? name,
    String? image,
    String? icon,
    int? productCount,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      icon: icon ?? this.icon,
      productCount: productCount ?? this.productCount,
    );
  }
}
