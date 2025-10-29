import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Private constructor (Singleton pattern)
  StorageService._();

  // Single instance
  static final StorageService instance = StorageService._();

  // SharedPreferences instance
  SharedPreferences? _prefs;

  // Storage keys
  static const String _keyOnboardingComplete = 'onboarding_complete';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserId = 'user_id';
  static const String _keyUserToken = 'user_token';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserName = 'user_name';
  static const String _keyUserPhone = 'user_phone';

  // Initialize storage
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Ensure initialized
  void _ensureInitialized() {
    if (_prefs == null) {
      throw Exception('StorageService not initialized. Call init() first.');
    }
  }

  // Onboarding methods
  Future<bool> setOnboardingComplete(bool value) async {
    _ensureInitialized();
    return await _prefs!.setBool(_keyOnboardingComplete, value);
  }

  bool isOnboardingComplete() {
    _ensureInitialized();
    return _prefs!.getBool(_keyOnboardingComplete) ?? false;
  }

  // Auth methods
  Future<bool> setLoggedIn(bool value) async {
    _ensureInitialized();
    return await _prefs!.setBool(_keyIsLoggedIn, value);
  }

  bool isLoggedIn() {
    _ensureInitialized();
    return _prefs!.getBool(_keyIsLoggedIn) ?? false;
  }

  Future<bool> setUserId(String userId) async {
    _ensureInitialized();
    return await _prefs!.setString(_keyUserId, userId);
  }

  String? getUserId() {
    _ensureInitialized();
    return _prefs!.getString(_keyUserId);
  }

  Future<bool> setUserToken(String token) async {
    _ensureInitialized();
    return await _prefs!.setString(_keyUserToken, token);
  }

  String? getUserToken() {
    _ensureInitialized();
    return _prefs!.getString(_keyUserToken);
  }

  // User profile methods
  Future<bool> setUserEmail(String email) async {
    _ensureInitialized();
    return await _prefs!.setString(_keyUserEmail, email);
  }

  String? getUserEmail() {
    _ensureInitialized();
    return _prefs!.getString(_keyUserEmail);
  }

  Future<bool> setUserName(String name) async {
    _ensureInitialized();
    return await _prefs!.setString(_keyUserName, name);
  }

  String? getUserName() {
    _ensureInitialized();
    return _prefs!.getString(_keyUserName);
  }

  Future<bool> setUserPhone(String phone) async {
    _ensureInitialized();
    return await _prefs!.setString(_keyUserPhone, phone);
  }

  String? getUserPhone() {
    _ensureInitialized();
    return _prefs!.getString(_keyUserPhone);
  }

  // Clear all data (logout)
  Future<bool> clearAll() async {
    _ensureInitialized();
    return await _prefs!.clear();
  }

  // Debug: Print all stored values
  void debugPrintAll() {
    _ensureInitialized();
    print('=== StorageService Debug ===');
    print('Onboarding Complete: ${isOnboardingComplete()}');
    print('Is Logged In: ${isLoggedIn()}');
    print('User ID: ${getUserId()}');
    print('User Email: ${getUserEmail()}');
    print('User Name: ${getUserName()}');
    print('User Phone: ${getUserPhone()}');
    print('========================');
  }
}
