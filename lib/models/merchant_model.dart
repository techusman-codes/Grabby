class MerchantModel {
  final int id;
  final String name;
  final String description;
  final double rating;
  final int reviewCount;
  final List<String> categories;
  final int phoneNumber;
  final String address;
  final String location;
  final List<String> cuisines;
  final List<String> services;
  final String priceRange;
  final double? deliveryTime;
  final String? deliveryAreas;
  final String? paymentMode;
  final double? openingHours;

  MerchantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.categories,
    required this.phoneNumber,
    required this.address,
    required this.location,
    required this.cuisines,
    required this.services,
    required this.priceRange,
    this.deliveryTime,
    this.deliveryAreas,
    this.paymentMode,
    this.openingHours,
  });
}
