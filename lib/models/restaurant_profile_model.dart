class RestaurantProfileModel {
  final String id;
  final String name;
  final double rating;
  final int reviewCount;
  final List<String> images;

  final String longDescription;

  RestaurantProfileModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.images,

    required this.longDescription,
    required description,
  });
}
