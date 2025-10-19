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
  
  // Auth methods (we'll use these later)
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
  
  // Clear all data (logout)
  Future<bool> clearAll() async {
    _ensureInitialized();
    return await _prefs!.clear();
  }
}