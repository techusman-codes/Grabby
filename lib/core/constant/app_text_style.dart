import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

/// Grabby Typography System
/// Following Material Design 3 guidelines with custom adjustments
class AppTextStyles {
  AppTextStyles._();

  // Font family - Update this when you add custom fonts
  static const String _fontFamily = 'Inter'; // Change to your font

  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w700, // Bold
    height: 1.2,
    letterSpacing: -0.25,
    color: AppColors.black,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w700, // Bold
    height: 1.2,
    letterSpacing: 0,
    color: AppColors.black,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold, // Bold
    height: 1.2,
    letterSpacing: 0,
    color: AppColors.black,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w900, // Semi-bold
    height: 1.5,
    letterSpacing: 0,
    color: AppColors.softblue,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1,
    letterSpacing: 0.1,
    color: AppColors.black,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700, // Semi-bold
    height: 21,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.5,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.4,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  // ==================== BODY STYLES ====================

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    height: 22,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyLargeMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.black,
    height: 22,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 1.4,
    letterSpacing: 0.25,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyMediumBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.4,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    height: 1.3,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
  );

  // ==================== LABEL STYLES ====================

  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.4,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500, // Medium
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  // ==================== SPECIALIZED STYLES ====================
  // Custom styles for specific use cases

  /// Button Text - 16px
  /// Use: Primary buttons
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColors.textWhite,
  );

  /// Button Small - 14px
  /// Use: Secondary buttons, text buttons
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  /// Caption - 12px
  /// Use: Image captions, footnotes
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    height: 1.3,
    letterSpacing: 0.4,
    color: AppColors.textHint,
  );

  /// Overline - 10px (All caps recommended)
  /// Use: Eyebrows, category labels
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.6,
    letterSpacing: 1.5,
    color: AppColors.textSecondary,
  );

  // ==================== PRICE STYLES ====================
  // Specialized for e-commerce

  /// Price Large - 24px
  /// Use: Product detail page price
  static const TextStyle priceLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700, // Bold
    height: 1.2,
    letterSpacing: 0,
    color: AppColors.primary,
  );

  /// Price Medium - 18px
  /// Use: Product card price
  static const TextStyle priceMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700, // Bold
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.primary,
  );

  /// Price Small - 14px
  /// Use: Cart items, small cards
  static const TextStyle priceSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.4,
    letterSpacing: 0,
    color: AppColors.primary,
  );

  /// Strikethrough Price - 14px
  /// Use: Original price with discount
  static const TextStyle priceStrikethrough = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 1.4,
    letterSpacing: 0,
    color: AppColors.textHint,
    decoration: TextDecoration.lineThrough,
  );

  // ==================== ERROR & SUCCESS STYLES ====================

  /// Error Text - 14px
  /// Use: Form validation errors
  static const TextStyle error = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 1.4,
    letterSpacing: 0.25,
    color: AppColors.error,
  );

  /// Success Text - 14px
  /// Use: Success messages
  static const TextStyle success = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 1.4,
    letterSpacing: 0.25,
    color: AppColors.success,
  );

  // ==================== LINK STYLES ====================

  /// Link - 14px
  /// Use: Clickable text links
  static const TextStyle link = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    height: 1.4,
    letterSpacing: 0.25,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );

  /// Link Large - 16px
  /// Use: Prominent links
  static const TextStyle linkLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );
}
