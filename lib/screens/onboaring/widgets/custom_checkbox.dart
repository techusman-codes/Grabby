import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

/// Custom checkbox with label
///
/// Usage:
/// ```dart
/// CustomCheckbox(
///   value: _acceptTerms,
///   onChanged: (value) => setState(() => _acceptTerms = value),
///   label: 'Accept Terms & Condition',
/// )
/// ```
class CustomCheckbox extends StatelessWidget {
  /// Current checkbox value
  final bool value;

  /// Called when checkbox is tapped
  final Function(bool) onChanged;

  /// Label text
  final String label;

  /// Label text style
  final TextStyle? labelStyle;

  /// Checkbox size
  final double size;

  /// Active color
  final Color? activeColor;

  /// Whether checkbox is enabled
  final bool enabled;

  /// Optional trailing widget (e.g., "Learn more" link)
  final Widget? trailing;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.labelStyle,
    this.size = 20,
    this.activeColor,
    this.enabled = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? () => onChanged(!value) : null,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SizedBox(
              height: size,
              width: size,
              child: Checkbox(
                value: value,
                onChanged: enabled ? (val) => onChanged(val ?? false) : null,
                activeColor: activeColor ?? AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(color: AppColors.border, width: 1.5),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style:
                    labelStyle ??
                    TextStyle(
                      fontSize: 14,
                      color: enabled
                          ? AppColors.textPrimary
                          : AppColors.textHint,
                    ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
