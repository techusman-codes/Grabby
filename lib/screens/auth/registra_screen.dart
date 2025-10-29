import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import 'package:grabby_app/core/utils/validator.dart';
import 'package:grabby_app/screens/onboaring/widgets/auth_header.dart';
import 'package:grabby_app/screens/onboaring/widgets/custom_buttom.dart';
import 'package:grabby_app/screens/onboaring/widgets/custom_checkbox.dart';
import 'package:grabby_app/screens/onboaring/widgets/custom_text_field.dart';
import 'package:grabby_app/screens/onboaring/widgets/divider_with_text.dart';
import 'package:grabby_app/screens/onboaring/widgets/phone_number_field.dart';
import 'package:grabby_app/screens/onboaring/widgets/social_login_button.dart';

import '../../services/storage_service.dart';

/// Registration screen for new users
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Text controllers
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // State variables
  bool _isLoading = false;
  bool _acceptTerms = false;
  bool _acceptNewsletter = false;
  String _selectedCountryCode = '+234';

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handle registration
  Future<void> _handleRegister() async {
    // Validate form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Check if terms accepted
    if (!_acceptTerms) {
      _showSnackBar('Please accept Terms & Conditions', isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      final fullName = _fullNameController.text.trim();
      final email = _emailController.text.trim();
      final phone = _selectedCountryCode + _phoneController.text.trim();

      debugPrint('Register attempt:');
      debugPrint('Name: $fullName');
      debugPrint('Email: $email');
      debugPrint('Phone: $phone');
      debugPrint('Newsletter: $_acceptNewsletter');

      // TODO: Implement actual registration with Firebase

      // Save user info
      await StorageService.instance.setUserName(fullName);
      await StorageService.instance.setUserEmail(email);
      await StorageService.instance.setUserPhone(phone);

      if (mounted) {
        _showSnackBar('Account created successfully!', isError: false);

        // Navigate to verification screen
        Navigator.of(
          context,
        ).pushReplacementNamed(AppRoutes.verification, arguments: email);

        // Option 2: Go directly to home (if no verification needed)
        // Uncomment this if you want to skip verification:

        await StorageService.instance.setLoggedIn(true);
        await StorageService.instance.setUserId('Usman Umar Garba');
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.main_screen, (route) => false);
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Registration failed. Please try again.', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  /// Handle social registration
  Future<void> _handleSocialRegister(String provider) async {
    setState(() => _isLoading = true);

    try {
      await Future.delayed(const Duration(seconds: 2));

      debugPrint('$provider registration initiated');

      if (mounted) {
        _showSnackBar('$provider Sign Up - Coming Soon!');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  /// Navigate to login screen
  void _navigateToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  /// Navigate to terms page
  void _showTermsAndConditions() {
    // TODO: Navigate to terms page or show dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Terms & Conditions'),
        content: Text('Terms and conditions content goes here...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  /// Show snackbar message
  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.error : AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                // Header
                AuthHeader(title: 'Grabby', subtitle: 'Create your account'),

                const SizedBox(height: 40),

                // Full Name Field
                CustomTextField(
                  controller: _fullNameController,
                  label: '',
                  hint: 'Full Name',
                  textCapitalization: TextCapitalization.words,
                  validator: Validators.validateName,
                ),

                const SizedBox(height: 20),

                // Email Field
                CustomTextField(
                  controller: _emailController,
                  label: '',
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                  textCapitalization: TextCapitalization.none,
                ),

                const SizedBox(height: 20),

                // Phone Number Field
                PhoneNumberField(
                  controller: _phoneController,
                  label: '', // Label is shown inside the component
                  initialCountryCode: _selectedCountryCode,
                  onCountryChanged: (code) {
                    setState(() {
                      _selectedCountryCode = code;
                    });
                  },
                  validator: Validators.validatePhoneNumber,
                ),

                const SizedBox(height: 20),

                // Password Field
                CustomTextField(
                  label: '',
                  controller: _passwordController,
                  hint: 'Password',
                  isPassword: true,
                  validator: Validators.validatePassword,
                  textCapitalization: TextCapitalization.none,
                ),

                const SizedBox(height: 20),

                // Terms & Conditions Checkbox
                CustomCheckbox(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                  label: 'Accept Terms & Condition',
                  trailing: GestureDetector(
                    onTap: _showTermsAndConditions,
                    child: Icon(
                      Icons.info_outline,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ),
                ),

                // Newsletter Checkbox
                CustomCheckbox(
                  value: _acceptNewsletter,
                  onChanged: (value) {
                    setState(() {
                      _acceptNewsletter = value;
                    });
                  },
                  label: 'Accept to receive Newsletter',
                ),

                const SizedBox(height: 24),

                // Sign Up Button
                CustomButton(
                  text: 'Sign up',
                  onPressed: _handleRegister,
                  isLoading: _isLoading,
                ),

                const SizedBox(height: 32),

                // OR Divider
                DividerWithText(text: 'OR'),

                const SizedBox(height: 32),

                // Social Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginButton(
                      icon: Icons.apple,
                      onTap: () => _handleSocialRegister('Apple'),
                      enabled: !_isLoading,
                    ),
                    const SizedBox(width: 16),
                    SocialLoginButton(
                      icon: Icons.facebook,
                      onTap: () => _handleSocialRegister('Facebook'),
                      enabled: !_isLoading,
                    ),
                    const SizedBox(width: 16),
                    SocialLoginButton(
                      icon: Icons.g_mobiledata_rounded,
                      onTap: () => _handleSocialRegister('Google'),
                      enabled: !_isLoading,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Already have account link
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                    children: [
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _navigateToLogin,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
