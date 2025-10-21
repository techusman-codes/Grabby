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
  /// Icon to display
  final IconData icon;

  /// Callback when tapped
  final VoidCallback onTap;

  /// Button size (width and height)
  final double size;

  /// Icon size
  final double iconSize;

  /// Background color
  final Color? backgroundColor;

  /// Icon color
  final Color? iconColor;

  /// Border color
  final Color? borderColor;

  /// Border radius
  final double borderRadius;

  /// Whether button is enabled
  final bool enabled;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 56,
    this.iconSize = 28,
    this.backgroundColor,
    this.iconColor,
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
          child: Icon(
            icon,
            size: iconSize,
            color: enabled
                ? (iconColor ?? AppColors.textPrimary)
                : AppColors.textHint,
          ),
        ),
      ),
    );
  }
}
