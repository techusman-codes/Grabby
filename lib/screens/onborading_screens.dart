import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import 'package:grabby_app/core/constant/onboarding_data.dart';
import 'package:grabby_app/screens/onboaring/onboarding_bottom_nav.dart';
import 'package:grabby_app/screens/onboaring/widgets/onboarding_page_widget.dart';
import 'package:grabby_app/services/storage_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = OnboardingData.items.length;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNextPressed() {
    HapticFeedback.lightImpact();

    if (_currentPage < _totalPages - 1) {
      // Go to next page
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      // Complete onboarding
      _completeOnboarding();
    }
  }

  Future<void> _completeOnboarding() async {
    try {
      await StorageService.instance.setOnboardingComplete(true);

      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      }
    } catch (e) {
      debugPrint('Error completing onboarding: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Current Page: $_currentPage');
    debugPrint('Total Pages: $_totalPages');
    debugPrint('Is Last Page: ${_currentPage == _totalPages - 1}');

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button at top right
            if (_currentPage < _totalPages - 1)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, top: 16),
                  child: TextButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      _pageController.animateToPage(
                        _totalPages - 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textSecondary,
                    ),
                    child: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            else
              const SizedBox(height: 56), // Maintain spacing on last page
            // PageView with onboarding content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _totalPages,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    data: OnboardingData.items[index],
                  );
                },
              ),
            ),

            // Bottom navigation: Dots (left) + Next button (right)
            OnboardingBottomNav(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onNextPressed: _handleNextPressed,
              isLastPage: _currentPage == _totalPages - 1,
            ),
          ],
        ),
      ),
    );
  }
}
