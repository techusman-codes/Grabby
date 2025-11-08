// this will replace with API call later

import 'package:grabby_app/core/constant/app_images.dart';
import 'package:grabby_app/models/restaurant_model.dart';



class MockData {
  MockData();
  static final List<RestaurantModel> cactusRestaurants = [
    RestaurantModel(
      id: '1',
      name: 'Cactus Restaurant',
      description:
          'Cactus Restaurant has asserted itself as the go-to restaurant for mouth-watering delicacies in Victoria Island, Lagos. A meal at Cactus will leave you asking for more. \n The restaurant offers a great view of the Lagos Lagoon from its terrace, making it a great place for a romantic date, family outing or a group hang-out.  \n The Cactus menu offers a wide variety of meals including pizza, seafood and chicken dishes. The dessert menu is made up of delicious home made ice cream, cup cakes and other pastries. Whats more, Cactus meals are rather affordable.',
      image: AppImages.restau1,
      location: 'Kaduna, Nigeria',
      rating: 4.5,
      reviewCount: 120,
      isOpen: true,
      cuisineType: 'Nigerian',
      deliveryTime: 30,
      deliveryFee: 500,
      paymentMethod: null,
    ),
  ];
 
  

  // Merchant Moodel


}
