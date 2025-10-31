import 'package:flutter/material.dart';

import 'package:grabby_app/core/constant/app_text_style.dart';

/// Header for authentication screens (logo + subtitle)
///
/// Usage:
/// ```dart
/// AuthHeader(
///   title: 'Grabby',
///   subtitle: 'Sign in to your account',
/// )
/// ```
class AuthHeader extends StatelessWidget {
  /// Main title (usually app name or logo)
  final String title;

  /// Subtitle below title
  final String subtitle;

  /// Title font size
  final double titleFontSize;

  /// Whether to show logo image instead of text
  final bool showLogo;

  /// Logo image path (if showLogo is true)
  final String? logoPath;

  /// Logo height
  final double logoHeight;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleFontSize = 36,
    this.showLogo = false,
    this.logoPath,
    this.logoHeight = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title or Logo
        if (showLogo && logoPath != null)
          Image.asset(
            logoPath!,
            height: logoHeight,
            errorBuilder: (context, error, stackTrace) {
              // Fallback to text if image fails
              return _buildTitleText();
            },
          )
        else
          _buildTitleText(),

        const SizedBox(height: 2),

        // Subtitle
        Text(
          subtitle,
          style: AppTextStyles.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTitleText() {
    return Text(
      title,
      style: AppTextStyles.headlineLarge,
      textAlign: TextAlign.center,
    );
  }
}
