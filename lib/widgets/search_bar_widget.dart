import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';

class SearchWithFilter extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onFilterPressed;
  final ValueChanged<String>? onChanged;

  const SearchWithFilter({
    super.key,
    required this.controller,
    required this.hintText,
    this.onFilterPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),

          Container(
            height: double.infinity,
            width: 55,
            margin: const EdgeInsets.only(right: 4, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: AppColors.softblue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: onFilterPressed,
              tooltip: "Filter",
            ),
          ),
        ],
      ),
    );
  }
}
