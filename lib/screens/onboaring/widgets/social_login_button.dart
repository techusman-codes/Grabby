import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

/// Social login button (Apple, Facebook, Google, etc.)
///
/// Usage:
/// ```dart
/// SocialLoginButton(
///   icon: Icons.apple,
///   onTap: () => _handleSocialLogin('Apple'),
/// )
/// ```
class SocialLoginButton extends StatelessWidget {
  /// Image asset path to display
  final String imagePath;

  /// Callback when tapped
  final VoidCallback onTap;

  /// Button size (width and height)
  final double size;

  /// Icon size

  final double imageSize;

  /// Background color
  final Color? backgroundColor;

  /// Icon color

  /// Border color
  final Color? borderColor;

  /// Border radius
  final double borderRadius;

  /// Whether button is enabled
  final bool enabled;

  const SocialLoginButton({
    super.key,

    required this.imagePath,
    required this.onTap,
    this.size = 56,

    this.imageSize = 28,
    this.backgroundColor,

    this.borderColor,
    this.borderRadius = 12,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor ?? AppColors.border,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: imageSize,
            // The 'color' property was removed as it would tint your social icons,
            // which is likely not the desired effect for logos like Google's.
          ),
        ),
      ),
    );
  }
}
