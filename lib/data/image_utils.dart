import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_images.dart';

// Helper to resolve ImageProvider from a path
ImageProvider resolveImageProvider(String imagePath) {
  if (imagePath.isEmpty) {
    return const AssetImage(
      AppImages.imagePlaceholder,
    ); // Provide a default placeholder
  }
  if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
    return NetworkImage(imagePath);
  } else if (imagePath.startsWith('file:///')) {
    // Strip 'file:///' prefix for local assets
    return AssetImage(imagePath.substring('file:///'.length));
  } else {
    // Assume it's a direct asset path
    return AssetImage(imagePath);
  }
}
