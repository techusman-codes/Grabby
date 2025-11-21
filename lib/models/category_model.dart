/// this is going to be used throoughout the app
class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final String decs;
  final int productCount; // Number of Product in the category

  // this are my Constructors.
  CategoryModel({
    required this.name,
    required this.decs,
    required this.icon,
    this.productCount = 0,
    required this.id,
  });

  // Create From Json (for API integration later)
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] as String,
      icon: json['icon'] as String,
      id: json['id'] as String,
      decs: json['decs'] as String? ?? '',
      productCount: json['productCount'] as int? ?? 0,
    );
  }

  /// convert Json to API integration later
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'productCount': productCount,
      'decs': decs,
    };
  }

  // create a copy with modified files
  CategoryModel copyWith({
    String? id,
    String? name,
    String? text,
    String? image,
    String? icon,
    int? productCount,
    String? decs,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      decs: decs ?? this.decs,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      productCount: productCount ?? this.productCount,
    );
  }
}
