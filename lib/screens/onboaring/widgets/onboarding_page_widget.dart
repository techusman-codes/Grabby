import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/models/onbaording_models.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 60), // Top spacing
          // this is going to display if the image is not found
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(
                data.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported_outlined,
                          size: 80,
                          color: AppColors.primary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Image not found',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please add: ${data.image}',
                          style: TextStyle(
                            color: AppColors.textHint,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Text content section
          Expanded(
            flex: 3,
            child: Column(
              children: [
                // Title
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 2),

                // Description
                Text(
                  data.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textPrimary,
                    height: 1.6,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
