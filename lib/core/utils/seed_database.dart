import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseSeeder {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ============================================================================
  // SEED PRODUCTS (Run this once to populate database)
  // ============================================================================
  static Future<void> seedProducts() async {
    try {
      print('🌱 Starting database seeding...');

      // Check if products already exist
      final existingProducts = await _firestore
          .collection('products')
          .limit(1)
          .get();

      if (existingProducts.docs.isNotEmpty) {
        print('⚠️ Products already exist. Skipping seeding.');
        print(
          '💡 If you want to re-seed, delete products collection in Firebase Console first.',
        );
        return;
      }

      // Fashion Products
      final fashionProducts = [
        {
          'name': 'Designer T-Shirt',
          'description':
              'Premium cotton t-shirt with modern design. Comfortable and stylish for everyday wear.',
          'price': 5000.0,
          'image': 'assets/images/fashion/tshirt1.png',
          'categoryId': 'fashion',
          'categoryName': 'Fashion',
          'sellerId': 'seller1',
          'sellerName': 'Fashion Store Lagos',
          'rating': 4.5,
          'reviewCount': 120,
          'deliveryTime': 30,
          'deliveryFee': 500.0,
          'isFavorite': false,
        },
        {
          'name': 'Denim Jeans',
          'description':
              'Classic blue denim jeans with comfortable fit. Perfect for casual outings.',
          'price': 8000.0,
          'image': 'assets/images/fashion/jeans1.png',
          'categoryId': 'fashion',
          'categoryName': 'Fashion',
          'sellerId': 'seller1',
          'sellerName': 'Fashion Store Lagos',
          'rating': 4.7,
          'reviewCount': 89,
          'deliveryTime': 30,
          'deliveryFee': 500.0,
          'isFavorite': false,
        },
        {
          'name': 'Sneakers',
          'description':
              'Comfortable running sneakers with excellent cushioning.',
          'price': 12000.0,
          'image': 'assets/images/fashion/sneakers1.png',
          'categoryId': 'fashion',
          'categoryName': 'Fashion',
          'sellerId': 'seller2',
          'sellerName': 'Shoe Palace',
          'rating': 4.8,
          'reviewCount': 234,
          'deliveryTime': 45,
          'deliveryFee': 700.0,
          'isFavorite': false,
        },
      ];

      // Electronics Products
      final electronicsProducts = [
        {
          'name': 'Wireless Headphones',
          'description':
              'Noise-cancelling bluetooth headphones with premium sound quality.',
          'price': 25000.0,
          'image': 'assets/images/electronics/headphones1.png',
          'categoryId': 'electronics',
          'categoryName': 'Electronics',
          'sellerId': 'seller3',
          'sellerName': 'Tech Hub Lagos',
          'rating': 4.8,
          'reviewCount': 234,
          'deliveryTime': 45,
          'deliveryFee': 800.0,
          'isFavorite': false,
        },
        {
          'name': 'Smartphone',
          'description':
              'Latest smartphone with advanced features and powerful processor.',
          'price': 150000.0,
          'image': 'assets/images/electronics/phone1.png',
          'categoryId': 'electronics',
          'categoryName': 'Electronics',
          'sellerId': 'seller3',
          'sellerName': 'Tech Hub Lagos',
          'rating': 4.6,
          'reviewCount': 567,
          'deliveryTime': 45,
          'deliveryFee': 1000.0,
          'isFavorite': false,
        },
      ];

      // Food Products
      final foodProducts = [
        {
          'name': 'Jollof Rice Special',
          'description':
              'Delicious Nigerian jollof rice with chicken and plantain.',
          'price': 2500.0,
          'image': 'assets/images/food/jollof1.png',
          'categoryId': 'food',
          'categoryName': 'Food',
          'sellerId': 'rest1',
          'sellerName': 'Mama Put Restaurant',
          'rating': 4.6,
          'reviewCount': 345,
          'deliveryTime': 30,
          'deliveryFee': 300.0,
          'isFavorite': false,
        },
      ];

      // Combine all products
      final allProducts = [
        ...fashionProducts,
        ...electronicsProducts,
        ...foodProducts,
      ];

      // Add each product to Firestore
      int count = 0;
      for (var productData in allProducts) {
        productData['createdAt'] = FieldValue.serverTimestamp();
        await _firestore.collection('products').add(productData);
        count++;
        print(
          '✅ Added product $count/${allProducts.length}: ${productData['name']}',
        );
      }

      print('🎉 Successfully seeded $count products!');
      print('📱 Go to Firebase Console → Firestore to see them');
    } catch (e) {
      print('❌ Error seeding database: $e');
    }
  }
}
