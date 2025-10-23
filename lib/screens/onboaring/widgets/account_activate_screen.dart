import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/core/constant/app_images.dart';
import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/screens/home/main_screen.dart';

import 'package:grabby_app/screens/onboaring/widgets/custom_buttom.dart'; // Destination screen placeholder

class AccountActivatedScreen extends StatelessWidget {
  const AccountActivatedScreen({super.key});

  void _goToHome(BuildContext context) {
    // Use pushAndRemoveUntil to clear all previous screens (like Login/Signup)
    // The user should not be able to press 'back' to return to the sign-up flow.
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainScreen()),
      (Route<dynamic> route) =>
          false, // This ensures all previous routes are removed
    );
  }

  @override
  Widget build(BuildContext context) {
    // Standard padding for content
    const double horizontalPadding = 32.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            // Use spaceBetween to push the button to the bottom
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Top Content (Title, Subtitle, Image)
              Column(
                children: [
                  // Space from the top (adjust as needed)
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                  // Title
                  Text(
                    AppStrings.congratulations,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),

                  // Subtitle/Message
                  Text(
                    AppStrings.verificationSuccess,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),

                  // Image (Rocket)
                  Image.asset(AppImages.rocketScuccess, height: 200),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 300),
                child: CustomButton(
                  text: 'Home',
                  onPressed: () => _goToHome(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
