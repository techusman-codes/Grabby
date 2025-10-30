import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

/// Custom search bar widget
///
/// Reusable search input for home and other screens
class SearchBarWidget extends StatelessWidget {
  final String hint;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;

  const SearchBarWidget({
    super.key,
    this.hint = 'Search for products, restaurants...',
    this.onTap,
    this.onChanged,
    this.controller,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.textSecondary,
            size: 22,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
