class DishModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final bool isFavourite;
  final List<String> categories;

  DishModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.isFavourite,
    required this.categories,
  });
}
