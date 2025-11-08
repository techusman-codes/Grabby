class ReviewModel {
  final String id;
  final int userId;
  final String userName;
  final String userPhoto;
  final String reviewText;
  final double rating;
  final DateTime createdAt;
  final List<String> photos;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userPhoto,
    required this.reviewText,
    required this.rating,
    required this.createdAt,
    required this.photos,
  });
}
