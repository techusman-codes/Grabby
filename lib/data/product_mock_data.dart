import '../core/constant/app_images.dart';
import '../models/product_model_screen.dart' show ProductModelScreens;

class SampleProductsData {
  // Get products for a specific category
  static List<ProductModelScreens> getProductsByCategory(String categoryId) {
    switch (categoryId.toLowerCase()) {
      case 'fashion':
        return getFassionProducts();

      case 'kitchenware':
        return getKitchenwaresProducts();
      case 'drink':
        return getDrinksProducts();
      case 'electronics':
        return getElectronicsProducts();
      case 'food':
        return getFoodProducts();

      case 'babyproduct':
        return getBabyProducts();
      case 'sportapearls':
        return getSportApearsProducts();
      case 'grocery':
        return getGroceryProducts();
      case 'coffee':
        return getCoffeeProducts();

      default:
        return [];
    }
  }

  // Search products by name
  static List<ProductModelScreens> searchProducts(
    String query,
    String categoryId,
  ) {
    final products = getProductsByCategory(categoryId);
    if (query.isEmpty) return products;

    return products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  // Fashion Products
  static List<ProductModelScreens> getFassionProducts() {
    return [
      ProductModelScreens(
        id: '1',
        name: 'Winter-cardigan',
        description:
            'Premium cotton t-shirt with modern design. Comfortable and stylish for everyday wear.',
        price: 5000,
        image: AppImages.fashion1,
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller1',
        sellerName: 'Just Right Stores Lagos',
        rating: 4.5,
        reviewCount: 120,
        deliveryTime: 30,
        deliveryFee: 500,
      ),
      ProductModelScreens(
        id: '1',
        name: 'Danani plane long sleve',
        description:
            'Classic plane long sleve with comfortable fit. Perfect for casual outings.',
        price: 8000,
        image: AppImages.fashion2,
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller1',
        sellerName: 'Just Right Stores',
        rating: 4.7,
        reviewCount: 89,
        deliveryTime: 30,
        deliveryFee: 500,
      ),
      ProductModelScreens(
        id: '1',
        name: 'Adidas Sneakers',
        description:
            'Comfortable running sneakers with excellent cushioning. Ideal for sports and daily wear.',
        price: 12000,
        image: AppImages.fashion9,
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller2',
        sellerName: 'Beam Couture',
        rating: 4.8,
        reviewCount: 234,
        deliveryTime: 45,
        deliveryFee: 700,
      ),
      ProductModelScreens(
        id: '1',
        name: 'Geneva led wrist watch',
        description: 'GL Accessories',
        price: 9500,
        image: AppImages.fashion3,
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller1',
        sellerName: 'Fashion Store Lagos',
        rating: 4.6,
        reviewCount: 156,
        deliveryTime: 30,
        deliveryFee: 500,
      ),
      ProductModelScreens(
        id: '1',
        name: 'Leather Jacket',
        description:
            'Premium leather jacket with stylish design. Durable and fashionable.',
        price: 25000,
        image: 'assets/images/fashion/jacket1.png',
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller3',
        sellerName: 'Luxury Fashion',
        rating: 4.9,
        reviewCount: 78,
        deliveryTime: 60,
        deliveryFee: 1000,
      ),
      ProductModelScreens(
        id: 'f6',
        name: 'Handbag',
        description:
            'Elegant leather handbag with spacious compartments. Perfect for work and outings.',
        price: 15000,
        image: 'assets/images/fashion/handbag1.png',
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller3',
        sellerName: 'Luxury Fashion',
        rating: 4.7,
        reviewCount: 201,
        deliveryTime: 60,
        deliveryFee: 1000,
      ),
      ProductModelScreens(
        id: 'f7',
        name: 'Leather Jacket',
        description:
            'Premium leather jacket with stylish design. Durable and fashionable.',
        price: 25000,
        image: 'assets/images/fashion/jacket1.png',
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller3',
        sellerName: 'Luxury Fashion',
        rating: 4.9,
        reviewCount: 78,
        deliveryTime: 60,
        deliveryFee: 1000,
      ),
      ProductModelScreens(
        id: 'f8',
        name: 'Handbag',
        description:
            'Elegant leather handbag with spacious compartments. Perfect for work and outings.',
        price: 15000,
        image: 'assets/images/fashion/handbag1.png',
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller3',
        sellerName: 'Luxury Fashion',
        rating: 4.7,
        reviewCount: 201,
        deliveryTime: 60,
        deliveryFee: 1000,
      ),
      ProductModelScreens(
        id: 'f9',
        name: 'Leather Jacket',
        description:
            'Premium leather jacket with stylish design. Durable and fashionable.',
        price: 25000,
        image: 'assets/images/fashion/jacket1.png',
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller3',
        sellerName: 'Luxury Fashion',
        rating: 4.9,
        reviewCount: 78,
        deliveryTime: 60,
        deliveryFee: 1000,
      ),
      ProductModelScreens(
        id: 'f10',
        name: 'Handbag',
        description:
            'Elegant leather handbag with spacious compartments. Perfect for work and outings.',
        price: 15000,
        image: 'assets/images/fashion/handbag1.png',
        categoryId: 'fashion',
        categoryName: 'Fashion',
        sellerId: 'seller3',
        sellerName: 'Luxury Fashion',
        rating: 4.7,
        reviewCount: 201,
        deliveryTime: 60,
        deliveryFee: 1000,
      ),
    ];
  }

  // Electronics Products
  static List<ProductModelScreens> getElectronicsProducts() {
    return [
      ProductModelScreens(
        id: 'e2',
        name: 'Wireless Headphones',
        description:
            'Noise-cancelling bluetooth headphones with premium sound quality.',
        price: 25000,
        image: 'assets/images/electronics/headphones1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.8,
        reviewCount: 234,
        deliveryTime: 45,
        deliveryFee: 800,
      ),
      ProductModelScreens(
        id: 'e2',
        name: 'Smartphone',
        description:
            'Latest smartphone with advanced features and powerful processor.',
        price: 150000,
        image: 'assets/images/electronics/phone1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.6,
        reviewCount: 567,
        deliveryTime: 45,
        deliveryFee: 1000,
      ),
      ProductModelScreens(
        id: 'e3',
        name: 'Laptop',
        description:
            'High-performance laptop for work and gaming. Fast and reliable.',
        price: 350000,
        image: 'assets/images/electronics/laptop1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller5',
        sellerName: 'Computer World',
        rating: 4.9,
        reviewCount: 123,
        deliveryTime: 60,
        deliveryFee: 1500,
      ),
      ProductModelScreens(
        id: 'e4',
        name: 'Smart Watch',
        description:
            'Fitness tracking smart watch with heart rate monitor and GPS.',
        price: 45000,
        image: 'assets/images/electronics/watch1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.7,
        reviewCount: 189,
        deliveryTime: 45,
        deliveryFee: 800,
      ),
      ProductModelScreens(
        id: 'e5',
        name: 'Wireless Headphones',
        description:
            'Noise-cancelling bluetooth headphones with premium sound quality.',
        price: 25000,
        image: 'assets/images/electronics/headphones1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.8,
        reviewCount: 234,
        deliveryTime: 45,
        deliveryFee: 800,
      ),
      ProductModelScreens(
        id: 'e6',
        name: 'Smartphone',
        description:
            'Latest smartphone with advanced features and powerful processor.',
        price: 150000,
        image: 'assets/images/electronics/phone1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.6,
        reviewCount: 567,
        deliveryTime: 45,
        deliveryFee: 1000,
      ),
      ProductModelScreens(
        id: 'e7',
        name: 'Laptop',
        description:
            'High-performance laptop for work and gaming. Fast and reliable.',
        price: 350000,
        image: 'assets/images/electronics/laptop1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller5',
        sellerName: 'Computer World',
        rating: 4.9,
        reviewCount: 123,
        deliveryTime: 60,
        deliveryFee: 1500,
      ),
      ProductModelScreens(
        id: 'e8',
        name: 'Smart Watch',
        description:
            'Fitness tracking smart watch with heart rate monitor and GPS.',
        price: 45000,
        image: 'assets/images/electronics/watch1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.7,
        reviewCount: 189,
        deliveryTime: 45,
        deliveryFee: 800,
      ),
      ProductModelScreens(
        id: 'e9',
        name: 'Wireless Headphones',
        description:
            'Noise-cancelling bluetooth headphones with premium sound quality.',
        price: 25000,
        image: 'assets/images/electronics/headphones1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.8,
        reviewCount: 234,
        deliveryTime: 45,
        deliveryFee: 800,
      ),
      ProductModelScreens(
        id: 'e10',
        name: 'Smartphone',
        description:
            'Latest smartphone with advanced features and powerful processor.',
        price: 150000,
        image: 'assets/images/electronics/phone1.png',
        categoryId: 'electronics',
        categoryName: 'Electronics',
        sellerId: 'seller4',
        sellerName: 'Tech Hub Lagos',
        rating: 4.6,
        reviewCount: 567,
        deliveryTime: 45,
        deliveryFee: 1000,
      ),
    ];
  }

  // Food Products
  static List<ProductModelScreens> getFoodProducts() {
    return [
      ProductModelScreens(
        id: 'fo1',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: '5G Restaurant',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo2',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: '5G Restaurant',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo3',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: '5G Restaurants',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo4',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: '5G Restaurants',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo5',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Cactus Restaurant',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo6',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Cactus Restaurant',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo7',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Cactus Restaurant',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo8',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Cactus Restaurant',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo9',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Cactus Restaurant',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo10',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Cactus Restaurant',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo11',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Ocean Basket Restaurants',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo12',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Ocean Basket Restaurants',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo13',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Ocean Basket Restaurants',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo14',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Chicken Republic Restaurants',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo11',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Chicken Republic Restaurants',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo12',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Chicken Republic Restaurants',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo13',
        name: 'Jollof Rice Special',
        description:
            'Delicious Nigerian jollof rice with chicken and plantain.',
        price: 2500,
        image: 'assets/images/food/jollof1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Chicken Republic Restaurants',
        rating: 4.6,
        reviewCount: 345,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
      ProductModelScreens(
        id: 'fo14',
        name: 'Fried Rice',
        description: 'Tasty fried rice with vegetables and choice of protein.',
        price: 2000,
        image: 'assets/images/food/friedrice1.png',
        categoryId: 'food',
        categoryName: 'Food',
        sellerId: 'rest1',
        sellerName: 'Chicken Republic Restaurants',
        rating: 4.5,
        reviewCount: 278,
        deliveryTime: 30,
        deliveryFee: 300,
      ),
    ];
  }

  // Beauty Products
  static List<ProductModelScreens> getBeautyProducts() {
    return [
      ProductModelScreens(
        id: 'b1',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b2',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b3',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b4',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b5',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b6',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
    ];
  }

  // kitchen wire products

  // Beauty Products
  static List<ProductModelScreens> getKitchenwaresProducts() {
    return [
      ProductModelScreens(
        id: 'b1',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b2',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b3',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b4',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b5',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b6',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
    ];
  }

  // Driks Products
  static List<ProductModelScreens> getDrinksProducts() {
    return [
      ProductModelScreens(
        id: 'b1',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b2',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b3',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b4',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b5',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b6',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
    ];
  }

  // Baby Products Screen

  static List<ProductModelScreens> getBabyProducts() {
    return [
      ProductModelScreens(
        id: 'b1',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b2',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b3',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b4',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b5',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b6',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
    ];
  }

  // Sports Appearls

  static List<ProductModelScreens> getSportApearsProducts() {
    return [
      ProductModelScreens(
        id: 'b1',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b2',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b3',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b4',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b5',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b6',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
    ];
  }

  // Groceries Products
  static List<ProductModelScreens> getGroceryProducts() {
    return [
      ProductModelScreens(
        id: 'b1',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b2',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b3',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b4',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b5',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b6',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
    ];

    //  coffee Products
  }

  // Coffee Products
  static List<ProductModelScreens> getCoffeeProducts() {
    return [
      ProductModelScreens(
        id: 'b1',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b2',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b3',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b4',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b5',
        name: 'Face Cream',
        description:
            'Moisturizing face cream for all skin types. Natural ingredients.',
        price: 3500,
        image: 'assets/images/beauty/cream1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.7,
        reviewCount: 156,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
      ProductModelScreens(
        id: 'b6',
        name: 'Lipstick Set',
        description:
            'Premium lipstick set with 5 different shades. Long-lasting formula.',
        price: 5000,
        image: 'assets/images/beauty/lipstick1.png',
        categoryId: 'beauty',
        categoryName: 'Beauty',
        sellerId: 'seller6',
        sellerName: 'Beauty Express',
        rating: 4.8,
        reviewCount: 289,
        deliveryTime: 40,
        deliveryFee: 600,
      ),
    ];
  }
}

// ============================================================================
// EXPLANATION:
// ============================================================================
//
// This file contains sample data for different categories
// 
// IN PRODUCTION:
// - Replace this with API calls
// - Example: await api.getProducts(categoryId)
//
// FOR TESTING:
// - We use this sample data
// - Easy to test without backend
//
// USAGE:
// List<ProductModel> fashionItems = SampleProductsData.getProductsByCategory('fashion');
// List<ProductModel> searchResults = SampleProductsData.searchProducts('shirt', 'fashion');
//
// ============================================================================