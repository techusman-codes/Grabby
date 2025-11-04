/// Restaurant/Merchant model
class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final String location;
  final double rating;
  final int reviewCount;
  final bool isOpen;
  final String? cuisineType;
  final int? deliveryTime; // in minutes
  final double? deliveryFee;
  final double? paymentMethod;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.location,
    required this.paymentMethod,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isOpen = true,
    this.cuisineType,
    this.deliveryTime,
    this.deliveryFee,
  });

  /// Format delivery time
  String get formattedDeliveryTime {
    if (deliveryTime == null) return 'N/A';
    return '$deliveryTime mins';
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      paymentMethod: json['PaymentMethod'],
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      location: json['location'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      isOpen: json['isOpen'] as bool? ?? true,
      cuisineType: json['cuisineType'] as String?,
      deliveryTime: json['deliveryTime'] as int?,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'location': location,
      'rating': rating,
      'reviewCount': reviewCount,
      'isOpen': isOpen,
      'cuisineType': cuisineType,
      'deliveryTime': deliveryTime,
      'deliveryFee': deliveryFee,
      'PaymentMethod': paymentMethod,
    };
  }
}
