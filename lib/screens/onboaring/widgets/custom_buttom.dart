

import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';


///
/// Usage:
/// ```dart
/// CustomButton(
///   text: 'Sign in',
///   onPressed: _handleLogin,
///   isLoading: _isLoading,
/// )
/// ```
class CustomButton extends StatelessWidget {
  /// Button text
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Show loading spinner instead of text
  final bool isLoading;

  /// Background color (defaults to primary)
  final Color? backgroundColor;

  /// Text color (defaults to white)
  final Color? textColor;

  /// Button width (defaults to full width)
  final double? width;

  /// Button height (defaults to 56)
  final double height;

  /// Icon to show before text
  final Widget? icon;

  /// Border radius
  final double borderRadius;

  /// Elevation (shadow)
  final double elevation;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 56,
    this.icon,
    this.borderRadius = 12,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? AppColors.textWhite,
          disabledBackgroundColor: (backgroundColor ?? AppColors.primary)
              // ignore: deprecated_member_use
              .withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? AppColors.textWhite,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 8)],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor ?? AppColors.textWhite,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
