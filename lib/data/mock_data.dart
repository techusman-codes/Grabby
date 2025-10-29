import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/restaurant_model.dart';

/// Mock data for development
///
/// This will be replaced with real API calls later
class MockData {
  // Private constructor to prevent instantiation
  MockData._();

  /// Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Fashion', icon: '👗', productCount: 150),
    CategoryModel(id: '2', name: 'Groceries', icon: '🛒', productCount: 200),
    CategoryModel(id: '3', name: 'Electronics', icon: '📱', productCount: 85),
    CategoryModel(id: '4', name: 'Gadgets', icon: '⌚', productCount: 120),
    CategoryModel(id: '5', name: 'Health', icon: '💊', productCount: 75),
    CategoryModel(id: '6', name: 'Food', icon: '🍔', productCount: 300),
    CategoryModel(id: '7', name: 'Drinks', icon: '🥤', productCount: 50),
    CategoryModel(id: '8', name: 'Gaming', icon: '🎮', productCount: 95),
    CategoryModel(id: '9', name: 'Furniture', icon: '🛋️', productCount: 60),
    CategoryModel(id: '10', name: 'Sports', icon: '⚽', productCount: 110),
    CategoryModel(id: '11', name: 'Shoes', icon: '👟', productCount: 140),
    CategoryModel(id: '12', name: 'Toys', icon: '🧸', productCount: 80),
  ];

  /// Restaurants
  static final List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: '1',
      name: 'Tasty Restaurant - Gateway by Jollof',
      description: 'Delicious Nigerian cuisine',
      image: 'https://via.placeholder.com/300x200',
      location: 'Lagos, Nigeria',
      rating: 4.5,
      reviewCount: 120,
      isOpen: true,
      cuisineType: 'Nigerian',
      deliveryTime: 30,
      deliveryFee: 500,
    ),
    RestaurantModel(
      id: '2',
      name: 'Chicken Republic',
      description: 'Fast food and fried chicken',
      image: 'https://via.placeholder.com/300x200',
      location: 'Victoria Island, Lagos',
      rating: 4.3,
      reviewCount: 95,
      isOpen: true,
      cuisineType: 'Fast Food',
      deliveryTime: 25,
      deliveryFee: 400,
    ),
    RestaurantModel(
      id: '3',
      name: 'Kilimanjaro Restaurant',
      description: 'Continental dishes',
      image: 'https://via.placeholder.com/300x200',
      location: 'Lekki, Lagos',
      rating: 4.7,
      reviewCount: 150,
      isOpen: true,
      cuisineType: 'Continental',
      deliveryTime: 40,
      deliveryFee: 600,
    ),
  ];

  /// Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '1',
      name: 'Leniq Store',
      description: 'Sony PS5 1TB Slim',
      price: 98500,
      image: 'https://via.placeholder.com/200',
      categoryId: '8', // Gaming
      rating: 4.8,
      reviewCount: 45,
      isAvailable: true,
      tags: ['popular', 'trending'],
    ),
    ProductModel(
      id: '2',
      name: 'Chelsea Gadgets',
      description: 'DELL ALIENWARE R15',
      price: 120000,
      image: 'https://via.placeholder.com/200',
      categoryId: '3', // Electronics
      rating: 4.6,
      reviewCount: 32,
      isAvailable: true,
    ),
    ProductModel(
      id: '3',
      name: 'GL Accessories',
      description: 'Iphone 15(128GB+6Gb)',
      price: 2300,
      image: 'https://via.placeholder.com/200',
      categoryId: '3', // Electronics
      rating: 4.9,
      reviewCount: 78,
      isAvailable: true,
      tags: ['new'],
    ),
    ProductModel(
      id: '4',
      name: 'GL Accessories',
      description: 'Samsung Galaxy A25',
      price: 2400,
      image: 'https://via.placeholder.com/200',
      categoryId: '3', // Electronics
      rating: 4.4,
      reviewCount: 56,
      isAvailable: true,
    ),
    ProductModel(
      id: '5',
      name: 'LG 5.1 Ch. Home Theatre',
      description: 'Theatre System LHD675',
      price: 85000,
      image: 'https://via.placeholder.com/200',
      categoryId: '3', // Electronics
      rating: 4.7,
      reviewCount: 23,
      isAvailable: true,
    ),
  ];

  /// Get products by category
  static List<ProductModel> getProductsByCategory(String categoryId) {
    return products.where((p) => p.categoryId == categoryId).toList();
  }

  /// Get category by ID
  static CategoryModel? getCategoryById(String id) {
    try {
      return categories.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get product by ID
  static ProductModel? getProductById(String id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
