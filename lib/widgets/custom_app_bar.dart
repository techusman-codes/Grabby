import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String profileName;
  final String profileImage;
  final String location;
  final VoidCallback? onNotificationPressed;

  const CustomAppBar({
    super.key,
    required this.profileName,
    required this.profileImage,
    this.location = 'Lagos Nigeria',
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          // 🔹 Top Row: Profile + Notification
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 👤 Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    backgroundImage: AssetImage(profileImage),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    profileName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              // 🔔 Notification Button
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: AppColors.textPrimary,
                onPressed: onNotificationPressed,
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 📍 Location Row
          Row(
            children: [
              Icon(Icons.location_on, size: 22, color: AppColors.textPrimary),
              const SizedBox(width: 6),
              Text(
                location,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
