class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }

  // static String? validatePhoneNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Phone number is required';
  //   }

  //   final cleanedValue = value.replaceAll(RegExp(r'[^\d+]'), '');

  //   final nigerianPhoneRegex = RegExp(r'^(\+234|234|0)[7-9][0-1]\d{8}$');

  //   if (!nigerianPhoneRegex.hasMatch(cleanedValue)) {
  //     return 'Enter a valid Nigerian phone number';
  //   }

  //   return null; // Valid
  // }

  // Phone number validation (Nigerian format)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove spaces and special characters
    final cleanedValue = value.replaceAll(RegExp(r'[^\d]'), '');

    // Check length (Nigerian numbers are 10 digits after country code)
    if (cleanedValue.length != 10) {
      return 'Enter a valid 10-digit phone number';
    }

    // Check if starts with valid prefix (7, 8, 9)
    if (!cleanedValue.startsWith(RegExp(r'[789]'))) {
      return 'Phone number must start with 7, 8, or 9';
    }

    return null;

    // Valid
  }

  // Confirm password validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null; // Valid
  }

  // Generic required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null; // Valid
  }
}
