import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/screens/onboaring/widgets/page_indicator.dart';

class OnboardingBottomNav extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;
  final bool isLastPage;

  const OnboardingBottomNav({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
    required this.isLastPage,
    required void Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: isLastPage
          ? _buildFullWidthButton(context) // Last page: full-width button
          : _buildRowLayout(context), // Other pages: dots + button
    );
  }

  // Layout for pages 1 & 2: Dots on left, Next button on right
  Widget _buildRowLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side - Dots indicator
        PageIndicator(
          currentIndex: currentPage,
          pageCount: totalPages,
          dotSize: 10,
          dotSpacing: 8,
          activeColor: AppColors.purple,
          inactiveColor: AppColors.dotInactive,
        ),

        // Right side - Next button
        _buildNextButton(compact: true),
      ],
    );
  }

  // Layout for last page: Full-width button only
  Widget _buildFullWidthButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: _buildNextButton(compact: false),
    );
  }

  Widget _buildNextButton({required bool compact}) {
    return ElevatedButton(
      onPressed: onNextPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.softblue,
        foregroundColor: AppColors.textWhite,

        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,

        minimumSize: compact ? null : const Size(double.infinity, 30),
      ),
      child: Row(
        mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isLastPage ? 'Get Started' : 'Next',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
