import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';

class CategoriesSectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onPressed;

  const CategoriesSectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 🏷️ Section title
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        // 🔗 Action button
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
