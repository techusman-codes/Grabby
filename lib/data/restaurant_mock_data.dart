import 'package:grabby_app/core/constant/app_images.dart';

import '../models/restaurant_profile_model.dart';

class SampleData {
  static List<RestaurantProfileModel> getRestaurants() {
    return [
      getCactusRestaurant(),
      getOceanBasketRestaurant(),
      getChickenRepublicRestaurant(),
      get5GRestaurant(),
    ];
  }

  // Private method to create Cactus Restaurant
  static RestaurantProfileModel getCactusRestaurant() {
    return RestaurantProfileModel(
      id: '1',
      name: 'Cactus Restaurant',
      description:
          'Cactus Restaurant has asserted itself as the go-to restaurant for mouth-watering delicacies in Victoria Island, Lagos. A meal at Cactus will leave you asking for more. \n The restaurant offers a great view of the Lagos Lagoon from its terrace, making it a great place for a romantic date, family outing or a group hang-out. \n The Cactus menu offers a wide variety of meals including pizza, seafood and chicken dishes. The dessert menu is made up of delicious home made ice cream, cup cakes and other pastries. Whats more, Cactus meals are rather affordable.',

      imagePath: AppImages.restau1,
      rating: 4.5,
      reviewCount: 281,
      deliveryTime: '30-45 min',
      deliveryFee: 200,
      cuisines: [
        'Barbecue',
        'Chinese & Thai',
        'European Ice Cream',
        'Pastries',
      ],

      // Menu Items for Cactus
      menuItems: [
        MenuItem(
          id: '1',
          name: 'Apple wood smoked chicken',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu1,
          category: 'Breakfast',
          isFavorite: true,
        ),
        MenuItem(
          id: '2',
          name: 'Sonerai pasta',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu2,
          category: 'Breakfast',
        ),
        MenuItem(
          id: '3',
          name: 'Pork wabo finitas',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu3,
          category: 'Breakfast',
        ),
        MenuItem(
          id: '4',
          name: 'Iona pasta special',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu4,
          category: 'Breakfast',
        ),
        MenuItem(
          id: '5',
          name: 'Iona every where',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu5,
          category: 'BreakFast',
        ),
        MenuItem(
          id: '6',
          name: 'Apple wood smoked chicken',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu6,
          category: 'Breakfast',
          isFavorite: true,
        ),
        MenuItem(
          id: '7',
          name: 'Sonerai pasta',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu7,
          category: 'Breakfast',
        ),
        MenuItem(
          id: '8',
          name: 'Pork wabo finitas',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu8,
          category: 'Breakfast',
        ),

        MenuItem(
          id: '1',
          name: 'Iona every where',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu1,
          category: 'Dinner',
        ),
        MenuItem(
          id: '2',
          name: 'Apple wood smoked chicken',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu2,
          category: 'Dinner',
          isFavorite: true,
        ),
        MenuItem(
          id: '3',
          name: 'Sonerai pasta',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu3,
          category: 'Dinner',
        ),
        MenuItem(
          id: '4',
          name: 'Pork wabo finitas',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu4,
          category: 'Dinner',
        ),
        MenuItem(
          id: '5',
          name: 'Iona pasta special',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu5,
          category: 'Dinner',
        ),
        MenuItem(
          id: '6',
          name: 'Iona every where',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu6,
          category: 'Dinner',
        ),
        MenuItem(
          id: '7',
          name: 'Apple wood smoked chicken',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu7,
          category: 'Dinner',
          isFavorite: true,
        ),
        MenuItem(
          id: '8',
          name: 'Sonerai pasta',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu8,
          category: 'Dinner',
        ),
        MenuItem(
          id: '1',
          name: 'Pork wabo finitas',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu1,
          category: 'Breakfast',
        ),
        MenuItem(
          id: '2',
          name: 'Iona pasta special',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu2,
          category: 'Dinner',
        ),
        MenuItem(
          id: '3',
          name: 'Iona every where',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu3,
          category: 'Dinner',
        ),
        MenuItem(
          id: '4',
          name: 'Apple wood smoked chicken',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu4,
          category: 'Breakfast',
          isFavorite: true,
        ),
        MenuItem(
          id: '5',
          name: 'Sonerai pasta',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu5,
          category: 'Breakfast',
        ),
        MenuItem(
          id: '6',
          name: 'Pork wabo finitas',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu6,
          category: 'Breakfast',
        ),
        MenuItem(
          id: '7',
          name: 'Iona pasta special',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu7,
          category: 'Dinner',
        ),
        MenuItem(
          id: '8',
          name: 'Iona every where',
          description:
              'It is a unique chicken with mushroom, onion, green pepper in red BBC sauce',
          price: 200,
          imageUrl: AppImages.menu8,
          category: 'Dinner',
        ),
      ],

      // Restaurant Details
      details: RestaurantDetails(
        fullDescription:
            '''Cactus Restaurant was awarded itself as the go to restaurant for healthy, easy-to-eat takeout. Get started with Lagos & Central Lagos at Noon 247, Open.

The restaurant offers a great view of the Lagos Lagoon from its terrace, making it a great place for a romantic date, family outing or a group hang out.

The Cactus menu offers a wide variety of meals including pizza, meatball and chicken dishes. The dessert menu is made up of delicious home-made ice cream, cup cakes and other sorts of goodies. What more? Cactus restaurant has a friendly, trained staff ensuring great customer service.''',
        address:
            '23/7A, Ogunika Miadeke Street, Victoria Island, Lagos, Lagos State, Nigeria',
        phone: '+234 1 461 7880',
        openingHours: '07:00 AM - 9:00 PM',
        deliveryTime: '30-60mins',
        deliveryLocation: 'N2,500 - Lagos Mainland and Island',
        paymentModes: ['Cash and pos', 'Card only (pos or online)'],
        services: ['Breakfast', 'Lunch and Dinner'],
      ),

      // Reviews for Cactus
      reviews: [
        Review(
          id: '1',
          userName: 'Monsour Dascot',
          userAvatar: 'https://via.placeholder.com/40/FF6B6B/FFFFFF?text=MD',
          rating: 4.0,
          comment:
              'The restaurant is nice, the food is good and the servers are really polite. However, the meals are pretty expensive. I wish this could be considered. If it will cost the same or less than what others are selling soft and hot, that would be great for everyone.',
          timeAgo: '4 Days ago',
        ),
        Review(
          id: '2',
          userName: 'Ogunkan Olayide',
          userAvatar: 'https://via.placeholder.com/40/4ECDC4/FFFFFF?text=OO',
          rating: 5.0,
          comment:
              'I have known cactus all the years that I have tried, worked and come to eat. There is nothing short of amazing. And on top of that all very affordable. The owners are always on hand to help with my children. I have eaten there many times during the years. They never disappoint.',
          timeAgo: '1 Weeks ago',
          images: [
            'https://via.placeholder.com/80/FF6B6B/FFFFFF?text=1',
            'https://via.placeholder.com/80/4ECDC4/FFFFFF?text=2',
            'https://via.placeholder.com/80/95E1D3/FFFFFF?text=3',
            'https://via.placeholder.com/80/F38181/FFFFFF?text=4',
          ],
        ),
        Review(
          id: '3',
          userName: 'Fike Ogunlana',
          userAvatar: 'https://via.placeholder.com/40/95E1D3/FFFFFF?text=FO',
          rating: 5.0,
          comment:
              'My family and I have always had a good time eating out here and we enjoyed how perfect their food tastes every time we visit. Food is fresh and flavourful. Portion is very generous and prices are great.',
          timeAgo: '3 Days ago',
        ),
      ],
      isOPen: true,
    );
  }

  // Create Ocean Basket Restaurant
  static RestaurantProfileModel getOceanBasketRestaurant() {
    return RestaurantProfileModel(
      id: '2',
      name: 'Ocean Basket',
      description: 'Fresh seafood restaurant',

      imagePath:
          'https://via.placeholder.com/400x200/4ECDC4/FFFFFF?text=Ocean+Basket',
      rating: 4.2,
      reviewCount: 156,
      deliveryTime: '25-40 min',
      deliveryFee: 150,
      cuisines: ['Seafood', 'Mediterranean', 'Grills'],
      menuItems: [
        MenuItem(
          id: '6',
          name: 'Grilled Prawns',
          description: 'Fresh prawns grilled to perfection with garlic butter',
          price: 350,
          imageUrl: 'https://via.placeholder.com/80/4ECDC4/FFFFFF?text=Prawns',
          category: 'Seafood',
        ),
      ],
      details: RestaurantDetails(
        fullDescription:
            'Ocean Basket brings you the freshest seafood in Lagos.',
        address: '15 Admiralty Way, Lekki Phase 1, Lagos',
        phone: '+234 1 234 5678',
        openingHours: '10:00 AM - 10:00 PM',
        deliveryTime: '25-40mins',
        deliveryLocation: 'N1,500 - Lagos Island',
        paymentModes: ['Cash', 'Card', 'Transfer'],
        services: ['Lunch', 'Dinner'],
      ),
      reviews: [],
      isOPen: true,
    );
  }

  // Create Chicken Republic Restaurant
  static RestaurantProfileModel getChickenRepublicRestaurant() {
    return RestaurantProfileModel(
      id: '3',
      name: 'Chicken Republic',
      description: 'Fast food chain with African flavors',

      imagePath:
          'https://via.placeholder.com/400x200/F38181/FFFFFF?text=Chicken+Republic',
      rating: 4.7,
      reviewCount: 432,
      deliveryTime: '20-30 min',
      deliveryFee: 100,
      cuisines: ['Fast Food', 'African', 'Chicken'],
      menuItems: [
        MenuItem(
          id: '7',
          name: 'Refuel Max',
          description: 'Quarter chicken, jollof rice, coleslaw and a drink',
          price: 180,
          imageUrl: 'https://via.placeholder.com/80/F38181/FFFFFF?text=Refuel',
          category: 'Meals',
        ),
      ],
      details: RestaurantDetails(
        fullDescription:
            'Chicken Republic offers delicious African-inspired fast food.',
        address: '45 Allen Avenue, Ikeja, Lagos',
        phone: '+234 1 345 6789',
        openingHours: '08:00 AM - 11:00 PM',
        deliveryTime: '20-30mins',
        deliveryLocation: 'N800 - Lagos Mainland',
        paymentModes: ['Cash', 'Card', 'USSD'],
        services: ['Breakfast', 'Lunch', 'Dinner'],
      ),
      reviews: [],
      isOPen: true,
    );
  }

  static RestaurantProfileModel get5GRestaurant() {
    return RestaurantProfileModel(
      id: '3',
      name: 'Chicken Republic',
      description: 'Fast food chain with African flavors',

      imagePath:
          'https://via.placeholder.com/400x200/F38181/FFFFFF?text=Chicken+Republic',
      rating: 4.7,
      reviewCount: 432,
      deliveryTime: '20-30 min',
      deliveryFee: 100,
      cuisines: ['Fast Food', 'African', 'Chicken'],
      menuItems: [
        MenuItem(
          id: '7',
          name: 'Refuel Max',
          description: 'Quarter chicken, jollof rice, coleslaw and a drink',
          price: 180,
          imageUrl: 'https://via.placeholder.com/80/F38181/FFFFFF?text=Refuel',
          category: 'Meals',
        ),
      ],
      details: RestaurantDetails(
        fullDescription:
            'Chicken Republic offers delicious African-inspired fast food.',
        address: '45 Allen Avenue, Ikeja, Lagos',
        phone: '+234 1 345 6789',
        openingHours: '08:00 AM - 11:00 PM',
        deliveryTime: '20-30mins',
        deliveryLocation: 'N800 - Lagos Mainland',
        paymentModes: ['Cash', 'Card', 'USSD'],
        services: ['Breakfast', 'Lunch', 'Dinner'],
      ),
      reviews: [],
      isOPen: true,
    );
  }
}

// ============================================================================
// EXPLANATION:
// ============================================================================
//
// 1. This file creates SAMPLE data for 3 restaurants
// 2. In a REAL app, this data would come from an API/Database
// 3. Each restaurant has:
//    - Basic info (name, rating, etc.)
//    - Menu items
//    - Details
//    - Reviews
//
// 4. To use this data:
//    List<Restaurant> restaurants = SampleData.getRestaurants();
//
// ============================================================================
