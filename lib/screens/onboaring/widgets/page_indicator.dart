import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double dotSpacing;
  final MainAxisAlignment alignment;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.pageCount,
    this.activeColor = AppColors.dotActive,
    this.inactiveColor = AppColors.dotInactive,
    this.dotSize = 10.0,
    this.dotSpacing = 8.0,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(
        pageCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(
            right: index < pageCount - 1 ? dotSpacing : 0,
          ),
          height: dotSize,
          width: dotSize,
          decoration: BoxDecoration(
            color: currentIndex == index ? activeColor : inactiveColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
