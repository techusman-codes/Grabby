import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

/// Divider with text in the middle (commonly used for "OR")
///
/// Usage:
/// ```dart
/// DividerWithText(text: 'OR')
/// ```
class DividerWithText extends StatelessWidget {
  /// Text to display in the middle
  final String text;

  /// Text color
  final Color? textColor;

  /// Divider color
  final Color? dividerColor;

  /// Text font size
  final double fontSize;

  /// Divider thickness
  final double thickness;

  /// Spacing around text
  final double spacing;

  const DividerWithText({
    super.key,
    required this.text,
    this.textColor,
    this.dividerColor,
    this.fontSize = 14,
    this.thickness = 1,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'OR',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
        ),
      ],
    );
  }
}
