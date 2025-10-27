// This will replace the real API calls later
import 'package:grabby_app/models/category_models.dart';

class MockData {
  // Private constructor to prevent instantiation
  MockData._();

  // Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Fashion', icon: '', productCount: 150),
    CategoryModel(id: id, name: name, icon: icon),
  ];
}
