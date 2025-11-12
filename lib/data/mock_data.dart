import 'package:grabby_app/core/constant/app_images.dart';
import 'package:grabby_app/core/constant/app_string.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/restaurant_model.dart';

/// Mock data for development
///
/// This will be replaced with real API calls later
class MockData {
  MockData();

  /// Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: 'food',
      name: AppStrings.categoriesText1,
      icon: AppImages.cat1,
      productCount: 1,
      decs: AppStrings.categoriesDecs1,
    ),
    CategoryModel(
      id: 'fashion',
      name: AppStrings.categoriesText2,
      icon: AppImages.cat2,
      productCount: 2,
      decs: AppStrings.categoriesDecs2,
    ),
    CategoryModel(
      id: '3',
      name: AppStrings.categoriesText3,
      icon: AppImages.cat3,
      productCount: 3,
      decs: AppStrings.categoriesDecs3,
    ),
    CategoryModel(
      id: '4',
      name: AppStrings.categoriesText4,
      icon: AppImages.cat4,
      productCount: 4,
      decs: AppStrings.categoriesDecs4,
    ),
    CategoryModel(
      id: '5',
      name: AppStrings.categoriesText5,
      icon: AppImages.cat5,
      productCount: 5,
      decs: AppStrings.categoriesDecs4,
    ),
    CategoryModel(
      id: '6',
      name: AppStrings.categoriesDecs6,
      icon: AppImages.cat6,
      productCount: 6,
      decs: AppStrings.categoriesDecs5,
    ),
    CategoryModel(
      id: '7',
      name: AppStrings.categoriesText7,
      icon: AppImages.cat7,
      productCount: 7,
      decs: AppStrings.categoriesDecs7,
    ),
    CategoryModel(
      id: '8',
      name: AppStrings.categoriesText8,
      icon: AppImages.cat8,
      productCount: 8,
      decs: AppStrings.categoriesDecs8,
    ),
    CategoryModel(
      id: '9',
      name: AppStrings.categoriesText9,
      icon: AppImages.cat9,
      productCount: 9,
      decs: AppStrings.categoriesDecs9,
    ),
    CategoryModel(
      id: '10',
      name: AppStrings.categoriesText10,
      icon: AppImages.cat10,
      productCount: 10,
      decs: AppStrings.categoriesDecs11,
    ),
    CategoryModel(
      id: '11',
      name: AppStrings.categoriesText11,
      icon: AppImages.cat11,
      productCount: 7,
      decs: AppStrings.categoriesDecs7,
    ),
    CategoryModel(
      id: '12',
      name: AppStrings.categoriesText12,
      icon: AppImages.cat12,
      productCount: 8,
      decs: AppStrings.categoriesDecs8,
    ),
    CategoryModel(
      id: '13',
      name: AppStrings.categoriesText13,
      icon: AppImages.cat13,
      productCount: 8,
      decs: AppStrings.categoriesDecs8,
    ),
    CategoryModel(
      id: '14',
      name: AppStrings.categoriesText14,
      icon: AppImages.cat14,
      productCount: 8,
      decs: AppStrings.categoriesDecs8,
    ),
  ];

  /// Restaurants
  static final List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: '1',
      name: AppStrings.restDec1,
      description: AppStrings.restDecsText1,
      image: AppImages.restau1,
      location: 'Lagos, Nigeria',
      rating: 4.5,
      reviewCount: 120,
      isOpen: true,
      cuisineType: 'Nigerian',
      deliveryTime: 30,
      deliveryFee: 500,
      paymentMethod: null,
    ),
    RestaurantModel(
      id: '2',
      name: AppStrings.restDes2,
      description: AppStrings.restaurantDecs2,
      image: AppImages.restau2,
      location: 'Victoria Island, Lagos',
      rating: 4.3,
      reviewCount: 95,
      isOpen: true,
      cuisineType: 'Fast Food',
      deliveryTime: 25,
      deliveryFee: 400,
      paymentMethod: null,
    ),
    RestaurantModel(
      id: '3',
      name: AppStrings.restDes3,
      description: AppStrings.restDes3,
      image: AppImages.restau3,
      location: 'Lekki, Lagos',
      rating: 4.7,
      reviewCount: 150,
      isOpen: true,
      cuisineType: 'Continental',
      deliveryTime: 40,
      deliveryFee: 600,
      paymentMethod: null,
    ),

    RestaurantModel(
      id: '4',
      name: AppStrings.restDes4,
      description: AppStrings.restaurantDecs4,
      image: AppImages.restau4,
      location: 'Lekki Lagos',
      rating: 5.5,
      reviewCount: 200,
      isOpen: true,
      cuisineType: 'italiyan',
      deliveryTime: 40,
      deliveryFee: 500,
      paymentMethod: null,
    ),
  ];

  /// Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '1',
      name: AppStrings.proText1,
      description: AppStrings.proDes1,
      price: AppStrings.proPrice1,
      image: AppImages.pro1,
      categoryId: '8', // Gaming
      rating: 4.8,
      reviewCount: 45,
      isAvailable: true,
    ),
    ProductModel(
      id: '2',
      name: AppStrings.proText2,
      description: AppStrings.proDes2,
      price: AppStrings.proPrice2,
      image: AppImages.pro2,
      categoryId: '3',
      rating: 4.6,
      reviewCount: 32,
      isAvailable: true,
    ),
    ProductModel(
      id: '3',
      name: AppStrings.proText3,
      description: AppStrings.proDes3,
      price: AppStrings.proPrice3,
      image: AppImages.pro3,
      categoryId: '3', // Electronics
      rating: 4.9,
      reviewCount: 78,
      isAvailable: true,
      tags: ['new'],
    ),
    ProductModel(
      id: '4',
      name: AppStrings.proText4,
      description: AppStrings.protDes4,
      price: AppStrings.proPrice4,
      image: AppImages.pro4,
      categoryId: '3', // Electronics
      rating: 4.4,
      reviewCount: 56,
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
